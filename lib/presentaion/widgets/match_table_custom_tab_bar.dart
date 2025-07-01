import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tornet/core/utils/app_enums.dart';
import 'package:tornet/presentaion/bloc/matches_cubit.dart';

class MatchTableCustomTabbar extends StatelessWidget {
  const MatchTableCustomTabbar({super.key, required this.tabController});

  final ValueNotifier<MatchDateType> tabController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTabBarButton(title: MatchDateType.today, context: context),
        SizedBox(width: 4),
        _buildTabBarButton(title: MatchDateType.upcoming, context: context),
        SizedBox(width: 4),
        _buildTabBarButton(title: MatchDateType.past, context: context),
      ],
    );
  }

  Widget _buildTabBarButton({required MatchDateType title, required BuildContext context}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          tabController.value = title;
          switch (title) {
            case MatchDateType.today:
              context.read<MatchesCubit>().fetchTodayMatches();
              break;
            case MatchDateType.past:
              context.read<MatchesCubit>().fetchPastMatches();
              break;
            case MatchDateType.upcoming:
              context.read<MatchesCubit>().fetchUpcomingMatches();
              break;
          }
        },
        child: Container(
          width: 100,
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: ShapeDecoration(
            color: title == tabController.value
                ? null
                : const Color(0xFF36383A),
            gradient: title == tabController.value
                ? LinearGradient(
                    begin: Alignment(-0.00, 0.00),
                    end: Alignment(1.00, 1.00),
                    colors: [const Color(0xFF86F14D), const Color(0xFFE6FF48)],
                  )
                : null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 6,
            children: [
              Text(
                title.name,
                style: TextStyle(
                  color: title == tabController.value
                      ? const Color(0xFF2E3236)
                      : const Color(0xFF949699),
                  fontSize: 12,
                  fontFamily: 'Chakra Petch',
                  fontWeight: FontWeight.w700,
                  height: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
