# Tornet - Sports Match Tracking Application

## Project Overview

Tornet is a Flutter application designed for tracking and displaying sports matches, particularly focusing on football (soccer) leagues such as LaLiga and Premier League. The app provides real-time match data, including scores, match statuses, and upcoming fixtures.

## Key Features

- Real-time match score updates via WebSocket
- View today's matches
- View upcoming matches
- View past matches
- Beautiful UI with custom blurry background effects

## API Endpoints

The application uses the following REST API endpoints:

| Endpoint | URL | Description |
|----------|-----|-------------|
| Today's Matches | `https://staging.torliga.com/api/v1/home/todayMatches` | Retrieves all matches scheduled for the current day |
| Past Matches | `https://staging.torliga.com/api/v1/home/yesterdayMatches` | Retrieves matches from the previous day |
| Upcoming Matches | `https://staging.torliga.com/api/v1/home/tomorrowMatches` | Retrieves matches scheduled for the next day |

## WebSocket Implementation

The application uses WebSockets to receive real-time match updates, particularly score changes.

### WebSocket Details

- **WebSocket URL**: `wss://mqtt.staging.torliga.com/app/4bae652d93c285868d11?protocol=7&client=js&version=4.3.1&flash=false`
- **Channel**: `thesports-football.matchs`
- **Event**: `score-event`

### WebSocket Data Structure

When a score update is received, the data is structured as follows:

```json
{
  "matchId": "string",
  "matchStatus": integer,
  "homeTeamData": [array],
  "awayTeamData": [array],
  "kickOffTimestamp": timestamp,
  "reserved": any
}
```

Match status codes:
- 0: Abnormal
- 1: Not started
- 2: First half
- 3: Half-time
- 4: Second half
- 5-6: Overtime
- 7: Penalty Shoot-out
- 8: End
- 9: Delay
- 10: Interrupt
- 11: Cut in half
- 12: Cancel
- 13: To be determined

## Authentication

API requests include an Authorization header with a Bearer token:
```
Authorization: Bearer 15819|rX7ELUR9o4zNtSfCvAygVYvhTeiPGGBn18gNXotU3d8b99d2
```

## Package Dependencies

| Package | Purpose |
|---------|---------|
| flutter_svg | Rendering SVG images |
| hooks_riverpod | State management alternative (not primary) |
| flutter_hooks | Simplifies stateful logic in widgets |
| flutter_riverpod | State management alternative (not primary) |
| dio | HTTP client for API requests |
| pretty_dio_logger | Logging network requests and responses |
| flutter_bloc | Primary state management solution |
| equatable | Simplifies equality comparisons for classes |
| loading_animation_widget | Provides loading animations |
| web_socket_channel | Handles WebSocket connections |

## Architecture

The application follows a clean architecture approach with:

1. **Data Layer**: Models for API responses
2. **Core Layer**: Network services, constants, and utilities
3. **Presentation Layer**: UI components and state management (Cubit)

### State Management

The app uses the BLoC pattern via Cubit for state management:

- **MatchesCubit**: Handles fetching matches and updating scores
- **States**:
  - MatchesInitial
  - MatchesLoading
  - MatchesLoadedSuccessfuly
  - MatchesError

## UI Components

The app includes custom UI components such as:
- BluryBackground: Creates a blurred background effect with configurable colors and flow directions
