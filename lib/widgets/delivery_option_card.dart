// Teslimat seçeneği kartı (Araba / Bisiklet / Yürüyüş).
// BRAND_IDENTITY 8. tablosundaki min-max komisyon aralıklarını gösterir.

import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class DeliveryOption {
  final String label;
  final IconData icon;
  final String duration;
  final int minCommission;
  final int maxCommission;

  const DeliveryOption({
    required this.label,
    required this.icon,
    required this.duration,
    required this.minCommission,
    required this.maxCommission,
  });
}

// BRAND_IDENTITY ile birebir komisyon aralıkları.
const List<DeliveryOption> kDeliveryOptions = <DeliveryOption>[
  DeliveryOption(
    label: 'Araba',
    icon: Icons.directions_car_outlined,
    duration: '10-20 dk',
    minCommission: 45,
    maxCommission: 120,
  ),
  DeliveryOption(
    label: 'Bisiklet',
    icon: Icons.pedal_bike_outlined,
    duration: '20-35 dk',
    minCommission: 25,
    maxCommission: 75,
  ),
  DeliveryOption(
    label: 'Yürüyüş',
    icon: Icons.directions_walk_outlined,
    duration: '35-60 dk',
    minCommission: 15,
    maxCommission: 40,
  ),
];

class DeliveryOptionCard extends StatelessWidget {
  final DeliveryOption option;
  final bool selected;
  final VoidCallback onTap;

  const DeliveryOptionCard({
    super.key,
    required this.option,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? AppColors.primary.withOpacity(0.08) : AppColors.surface,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: selected ? AppColors.primary : AppColors.border,
              width: selected ? 1.5 : 1,
            ),
          ),
          child: Column(
            children: [
              Icon(
                option.icon,
                size: 28,
                color: selected ? AppColors.primary : AppColors.secondary,
              ),
              const SizedBox(height: 8),
              Text(
                option.label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                option.duration,
                style: const TextStyle(
                  fontSize: 11,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: AppColors.accent.withOpacity(0.18),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  '₺${option.minCommission}-${option.maxCommission}',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: AppColors.secondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
