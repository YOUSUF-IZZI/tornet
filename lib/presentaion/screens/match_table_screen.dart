import 'package:flutter/material.dart';
import 'package:tornet/presentaion/widgets/blurry_circle.dart';

class MatchTableScreen extends StatelessWidget {
  const MatchTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
