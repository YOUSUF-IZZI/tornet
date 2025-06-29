/* Project plan
1. UI Implementation
You need to recreate a page based on the Figma design provided. From the image you shared, I can see it's a sports match schedule app with:

A tabbed interface (Today, Upcoming, Past)
Match listings grouped by leagues (LaLiga, Premier League)
Team logos/jerseys with match times
Clean, modern UI with a dark theme
2. API Integration
You need to integrate with three REST API endpoints:

Today's Matches: https://staging.torliga.com/api/v1/home/todayMatches
Past Matches: https://staging.torliga.com/api/v1/home/yesterdayMatches
Upcoming Matches: https://staging.torliga.com/api/v1/home/tomorrowMatches
All require the same authorization token: 15819|rX7ELUR9o4zNtSfCvAygVYvhTeiPGGBn18gNXotU3d8b99d2

3. WebSocket Integration
You need to implement real-time score updates using WebSocket:

WebSocket URL: wss://mqtt.staging.torliga.com/app/4bae652d93c285868d11?protocol=7&client=js&version=4.3.1&flash=false
Channel: "thesports-football.matchs"
Event: "score-event"
The payload will contain match IDs and scores
4. Architecture Requirements
Clean Architecture principles
BLoC for state management
Proper WebSocket handling for real-time updates
Current Project State
The project appears to be a fresh Flutter project with a basic structure. You've started setting up a folder structure that aligns with Clean Architecture:

/lib/core: For core utilities and shared components
/lib/data: For data sources, repositories implementations, and models
/lib/domain: For entities, repositories interfaces, and use cases
/lib/presentation: For UI components, screens, and BLoC
The 
home_screen.dart
 file has been created but only contains a basic scaffold.

Next Steps
To complete this task, you'll need to:

Add necessary dependencies to 
pubspec.yaml
:
BLoC packages for state management
HTTP package for API calls
WebSocket package for real-time updates
JSON serialization tools
Implement the data layer:
Create models for matches, teams, leagues
Implement API services for fetching data
Implement WebSocket service for real-time updates
Implement the domain layer:
Define entities
Define repository interfaces
Create use cases
Implement the presentation layer:
Create BLoCs for managing state
Build UI components based on the Figma design
Implement the tabbed interface
Create match list widgets
Connect everything together in the main app
*/



import 'package:flutter/material.dart';
import 'package:tornet/core/utils/app_them.dart';
import 'package:tornet/presentaion/screens/match_table_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Set initial status bar style
  AppTheme.updateStatusBarStyle(ThemeMode.dark);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      home: const MatchTableScreen(),
    );
  }
}