import 'package:flutter/material.dart';
import 'package:shopverse/core/util/constants/assets_helper.dart';

class HeaderScreen extends StatelessWidget {
  const HeaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // صورة الهيدر
        Image.asset(
          AssetsHelper.header,
          width: double.infinity,
          height: 300,
          fit: BoxFit.cover,
        ),

        Positioned(
          left: 20,
          bottom: 50,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "New Collection 2026",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black.withValues(alpha: 0.5),
                      blurRadius: 6,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  // color: ColorsManager.orangeColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  "Shop Now",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
