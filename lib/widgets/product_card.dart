// Tek bir ürünün kart gösterimi.
// GridView içinde kullanılır. Image.network + errorBuilder ile
// offline çalışmayı destekler. Layout Expanded + mainAxisSize.min ile
// katı hücre yüksekliğinde overflow olmadan çalışır.

import 'package:flutter/material.dart';
import '../models/product.dart';
import '../theme/app_colors.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ürün görseli - kalan dikey alanı kaplar, overflow olmaz.
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: SizedBox.expand(
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stack) =>
                          _ImagePlaceholder(category: product.category),
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return const ColoredBox(
                          color: AppColors.background,
                          child: Center(
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              // Metin alanı - sabit yüksekliği yok, içerik kadar kaplar.
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Kategori rozeti
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.10),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        product.category,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 10.5,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryDark,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                        height: 1.25,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product.formattedPrice,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ImagePlaceholder extends StatelessWidget {
  final String category;
  const _ImagePlaceholder({required this.category});

  IconData get _icon {
    switch (category) {
      case 'Market':
        return Icons.local_grocery_store_outlined;
      case 'Yemek':
        return Icons.restaurant_outlined;
      case 'İlaç':
        return Icons.medication_outlined;
      case 'Çiçek & Hediye':
        return Icons.local_florist_outlined;
      case 'Kırtasiye':
        return Icons.edit_note_outlined;
      case 'Teknoloji':
        return Icons.devices_other_outlined;
      case 'Su & İçecek':
        return Icons.local_drink_outlined;
      default:
        return Icons.shopping_bag_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Center(
        child: Icon(
          _icon,
          size: 40,
          color: AppColors.primary.withOpacity(0.6),
        ),
      ),
    );
  }
}
