import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:tornet/core/network/api_constants.dart';

class WebSocketService {
  WebSocketChannel? _channel;
  final StreamController<Map<String, dynamic>> _scoreEventController = StreamController<Map<String, dynamic>>.broadcast();

  // Public stream that other classes can listen to
  Stream<Map<String, dynamic>> get scoreEventStream => _scoreEventController.stream;

  // Connect to WebSocket
  void connect() {
    try {
      _channel = WebSocketChannel.connect(Uri.parse(ApiConstants.webSocketUrl));
      // Listen for messages from the server
      _channel!.stream.listen(
        (message) {
          _handleMessage(message);
        },
        onError: (error) {
          if (kDebugMode) {
            print('WebSocket Error: $error');
          }
        },
        onDone: () {
          if (kDebugMode) {
            print('WebSocket connection closed');
          }
          // Attempt to reconnect after a delay
          Future.delayed(const Duration(seconds: 5), () {
            connect();
          });
        },
      );

      // Subscribe to the football matches channel
      _subscribeToChannel();
    } catch (e) {
      if (kDebugMode) {
        print('WebSocket Connection Error: $e');
      }
    }
  }

  // Subscribe to the football matches channel
  void _subscribeToChannel() {
    if (_channel != null) {
      final subscriptionMessage = {
        "event": "pusher:subscribe",
        "data": {"channel": ApiConstants.webSocketChannel},
      };
      _channel!.sink.add(jsonEncode(subscriptionMessage));
    }
  }

  // Handle incoming messages
  void _handleMessage(dynamic message) {
    try {
      final Map<String, dynamic> parsedMessage = jsonDecode(message);
      // Check if this is a score event
      if (parsedMessage['event'] == ApiConstants.webSocketEvent) {
        // Parse the data string which contains the actual score information
        final String dataString = parsedMessage['data'];
        final List<dynamic> scoreData = jsonDecode(dataString);
        // Create a structured map with the score information
        final Map<String, dynamic> scoreInfo = {
          'matchId': scoreData[0],
          'matchStatus': scoreData[1],
          'homeTeamData': scoreData[2],
          'awayTeamData': scoreData[3],
          'kickOffTimestamp': scoreData[4],
          'reserved': scoreData[5],
        };
        // Add to the stream for listeners
        _scoreEventController.add(scoreInfo);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error parsing WebSocket message: $e');
      }
    }
  }

  // Disconnect from WebSocket
  void disconnect() {
    _channel?.sink.close();
  }

  // Dispose resources
  void dispose() {
    disconnect();
    _scoreEventController.close();
  }
}
