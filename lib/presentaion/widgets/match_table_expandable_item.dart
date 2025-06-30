import 'package:flutter/material.dart';
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
          Image.network(match.data?[0].competition?.logo ?? '', height: 20, width: 20),
          const SizedBox(width: 8),
          Text(match.data?[0].competition?.name ?? '', style: TextStyle(color: Colors.white.withValues(alpha: 0.80), fontWeight: FontWeight.bold)),
        ],
      ),
      // Matches
      children: match.data?[0].matches?.map((match) => _buildMatchCard(match)).toList() ?? [],
    );
  }

  Widget _buildMatchCard(SingleMatch match) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      color: AppColors.grey,
      child: Row(
        children: [
          // Home team name (flexible)
          Expanded(
            child: Text(
              match.homeTeam?.name ?? 'X',
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          // Center section with fixed layout (logos and time)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(match.homeTeam?.logo ?? '', height: 32, width: 32), //! use app network image later.
              const SizedBox(width: 8),
              Text(
                match.matchTime ?? 'xx:xx',
                style: const TextStyle(color: Color(0xFF949699), fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              Image.network(match.awayTeam?.logo ?? '', height: 32, width: 32), //! use app network image later.
            ],
          ),
          const SizedBox(width: 8),
          // Away team name (flexible)
          Expanded(
            child: Text(
              match.awayTeam?.name ?? 'X',
              style: const TextStyle(color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
