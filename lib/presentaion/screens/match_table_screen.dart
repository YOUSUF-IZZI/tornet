import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tornet/core/common/widgets/blurry_circle.dart';
import 'package:tornet/presentaion/widgets/match_table_custom_tab_bar.dart';
import 'package:tornet/presentaion/widgets/match_table_tabbar_view.dart';

class MatchTableScreen extends HookWidget {
  const MatchTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = useState('Today');
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              right: MediaQuery.of(context).size.width * (-0.3),
              bottom: MediaQuery.of(context).size.height * 0.2,
              child: BlurryCircle(size: MediaQuery.of(context).size.width * 0.6, colors: const [Color(0xFF86F14D), Color(0xFFE6FF48)], blurSigma: 50.0, begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * -0.4,
              bottom: MediaQuery.of(context).size.height * -0.255,
              child: BlurryCircle(size: MediaQuery.of(context).size.width * 0.6, colors: const [Color(0xFF86F14D), Color(0xFFE6FF48)], blurSigma: 50.0, begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 13),
              child: Column(
                children: [
                  MatchTableCustomTabbar(tabController: tabController),
                  const SizedBox(height: 20),
                  MatchTableTabbarView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
