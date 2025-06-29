class ApiConstants {

  //* Match Endpoints
  static const String todayMatches = "https://staging.torliga.com/api/v1/home/todayMatches";
  static const String pastMatches = "https://staging.torliga.com/api/v1/home/yesterdayMatches";
  static const String upcomingMatches = "https://staging.torliga.com/api/v1/home/tomorrowMatches";

  //* WebSocket URL & Endpoints
  static const String webSocketUrl = "wss://mqtt.staging.torliga.com/app/4bae652d93c285868d11?protocol=7&client=js&version=4.3.1&flash=false";
  static const String webSocketChannel = "thesports-football.matchs";
  static const String webSocketEvent = "score-event";
}