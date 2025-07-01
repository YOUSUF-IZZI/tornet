import 'package:flutter/material.dart';
import 'package:tornet/core/common/widgets/app_network_image.dart';
import 'package:tornet/core/utils/app_colors.dart';
import 'package:tornet/data/models/match_model/match.dart';
import 'package:tornet/data/models/match_model/match_model.dart';

class MatchTableExpandableItem extends StatelessWidget {
  const MatchTableExpandableItem({super.key, required this.match});

  final MatchModel match;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      collapsedBackgroundColor: AppColors.lightGrey,
      backgroundColor: AppColors.lightGrey,
      iconColor: Colors.white,
      collapsedIconColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      // League logo + League name
      title: Row(
        children: [
          AppAuthenticatedImage(imageUrl: match.data?[0].competition?.logo, width: 24, height: 24),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              match.data?[0].competition?.name ?? '',
              style: TextStyle(color: Colors.white.withValues(alpha: 0.80), fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      // Matches
      children: match.data?[0].matches?.map((match) => _buildMatchCard(match)).toList() ?? [],
    );
  }

  Widget _buildMatchCard(SingleMatch match) {
    // Get scores from the match data
    final int homeScore = match.homeTeam?.score != null && match.homeTeam!.score!.isNotEmpty ? (match.homeTeam!.score![0] as int? ?? 0) : 0;
    final int awayScore = match.awayTeam?.score != null && match.awayTeam!.score!.isNotEmpty ? (match.awayTeam!.score![0] as int? ?? 0) : 0;
    // Determine if the match is live
    final bool isLive = match.matchStatusId != null && (match.matchStatusId == 2 || match.matchStatusId == 3 || match.matchStatusId == 4 || match.matchStatusId == 5 || match.matchStatusId == 7);
    // Get match status text
    String statusText = match.matchTime ?? 'xx:xx';
    if (isLive) {
      statusText = match.matchStatusDescription ?? 'LIVE';
    } else if (match.matchStatusId == 8) {
      statusText = 'FT'; // Full Time
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      color: AppColors.grey,
      child: Row(
        children: [
          // Home team name (flexible)
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Text(
                    match.homeTeam?.name ?? 'X',
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // Show score if match is live or finished
                if (isLive || match.matchStatusId == 8)
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(
                      '$homeScore',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Center section with fixed layout (logos and time/status)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppAuthenticatedImage(imageUrl: match.homeTeam?.logo, width: 32, height: 32),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: isLive ? BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(4)) : null,
                child: Text(
                  statusText,
                  style: TextStyle(color: isLive ? Colors.white : const Color(0xFF949699), fontWeight: FontWeight.bold, fontSize: isLive ? 12 : 14),
                ),
              ),
              const SizedBox(width: 8),
              AppAuthenticatedImage(imageUrl: match.awayTeam?.logo, width: 32, height: 32),
            ],
          ),
          const SizedBox(width: 8),
          // Away team name (flexible)
          Expanded(
            child: Row(
              children: [
                // Show score if match is live or finished
                if (isLive || match.matchStatusId == 8)
                  Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Text(
                      '$awayScore',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                Flexible(
                  child: Text(
                    match.awayTeam?.name ?? 'X',
                    style: const TextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}