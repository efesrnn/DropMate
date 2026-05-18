// DropMate logo widget'i.
// Daire içinde aşağı doğru bir damla/pin sembolü + wordmark.
// BRAND_IDENTITY 5. bölümdeki tarife uygun olarak Flutter ile çizilmiştir.

import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class DropMateLogo extends StatelessWidget {
  final double size;
  final bool showWordmark;

  const DropMateLogo({
    super.key,
    this.size = 64,
    this.showWordmark = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Sembol - yeşil daire içinde beyaz damla
        Container(
          width: size,
          height: size,
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              Icons.location_on,
              color: Colors.white,
              size: size * 0.6,
            ),
          ),
        ),
        if (showWordmark) ...[
          SizedBox(width: size * 0.18),
          Text(
            'DropMate',
            style: TextStyle(
              fontSize: size * 0.5,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.5,
              color: AppColors.secondary,
            ),
          ),
        ],
      ],
    );
  }
}
