import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tornet/core/common/widgets/app_loading_indicator.dart';
import 'package:tornet/presentaion/bloc/matches_cubit.dart';
import 'package:tornet/presentaion/bloc/matches_state.dart';
import 'package:tornet/presentaion/widgets/match_table_expandable_item.dart';

class MatchTableTabbarView extends StatefulWidget {
  const MatchTableTabbarView({super.key});

  @override
  State<MatchTableTabbarView> createState() => _MatchTableTabbarViewState();
}

class _MatchTableTabbarViewState extends State<MatchTableTabbarView> {
  @override
  void initState() {
    super.initState();
    _loadMatches();
  }

  void _loadMatches() {
    context.read<MatchesCubit>().fetchTodayMatches();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: BlocBuilder<MatchesCubit, MatchesState>(
        builder: (context, state) {
          if (state is MatchesLoading) {
            return const Center(child: AppLoadingIndicator());
          } else if (state is MatchesLoadedSuccessfuly) {
            if (state.match.data == null || state.match.data!.isEmpty) {
              return Center(
                child: Column(
                  children: [
                    SvgPicture.asset('assets/icons/svg/no-results-found.svg'),
                    Text(
                      'No matches available',
                      style: TextStyle(fontSize: 18, color: Colors.white.withValues(alpha: 0.80), fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            }
            return ListView.builder(
              itemCount: (state.match.data?.length ?? 0),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: MatchTableExpandableItem(match: state.match),
                );
              },
            );
          } else {
            return Center(child: Column(
              children: [
                SvgPicture.asset('assets/icons/svg/something-went-error.svg'),
                Text('Something went wrong', style: TextStyle(fontSize: 18, color: Colors.white.withValues(alpha: 0.80), fontWeight: FontWeight.bold)),
              ],
            ));
          }
        },
      ),
    );
  }
}
