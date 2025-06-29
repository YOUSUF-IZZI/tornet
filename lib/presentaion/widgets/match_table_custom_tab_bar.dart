import 'package:flutter/material.dart';

class MatchTableCustomTabbar extends StatelessWidget {
  const MatchTableCustomTabbar({super.key, required this.tabController});

  final ValueNotifier<String> tabController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTabBarButton(title: 'Today'),
        SizedBox(width: 4),
        _buildTabBarButton(title: 'Upcoming'),
        SizedBox(width: 4),
        _buildTabBarButton(title: 'Past'),
      ],
    );
  }

  Widget _buildTabBarButton({required String title}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          tabController.value = title;
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
                title,
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
