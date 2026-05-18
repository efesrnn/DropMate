// Ürün detay ekranı.
// Product nesnesini Route Arguments üzerinden alır.
// Sepete Ekle butonu CartController state'ini günceller (durum simülasyonu).

import 'package:flutter/material.dart';
import '../models/cart_controller.dart';
import '../models/product.dart';
import '../theme/app_colors.dart';
import '../widgets/delivery_option_card.dart';

class ProductDetailScreen extends StatefulWidget {
  static const String routeName = '/product-detail';

  final Product? product;

  const ProductDetailScreen({super.key, this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _selectedDeliveryIndex = 1; // varsayılan: Bisiklet

  @override
  Widget build(BuildContext context) {
    // Route Arguments yoluyla gelen Product nesnesi.
    final Product product = widget.product ??
        ModalRoute.of(context)!.settings.arguments as Product;
    final selectedOption = kDeliveryOptions[_selectedDeliveryIndex];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Ürün Detayı'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: AspectRatio(
                aspectRatio: 1.1,
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (c, e, s) => Container(
                    color: AppColors.background,
                    child: const Center(
                      child: Icon(Icons.image_outlined,
                          size: 48, color: AppColors.textSecondary),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.10),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                product.category,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryDark,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              product.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              product.formattedPrice,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Açıklama',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              product.description,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.textSecondary,
                  ),
            ),
            const SizedBox(height: 24),
            Text(
              'Teslimat Seçeneği',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            Row(
              children: List.generate(kDeliveryOptions.length, (i) {
                final opt = kDeliveryOptions[i];
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: i == kDeliveryOptions.length - 1 ? 0 : 8,
                    ),
                    child: DeliveryOptionCard(
                      option: opt,
                      selected: _selectedDeliveryIndex == i,
                      onTap: () =>
                          setState(() => _selectedDeliveryIndex = i),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 16),
            // Tahmini teslimat - seçime göre güncellenir.
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  const Icon(Icons.schedule, color: AppColors.primary),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Tahmini teslimat: ',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 13,
                            ),
                          ),
                          TextSpan(
                            text: selectedOption.duration,
                            style: const TextStyle(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    '₺${selectedOption.minCommission}-${selectedOption.maxCommission}',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: AppColors.accent,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => _addToCart(context, product),
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text('Sepete Ekle'),
            ),
          ),
        ),
      ),
    );
  }

  void _addToCart(BuildContext context, Product product) {
    // CartController durumunu güncelle - state simülasyonu.
    CartController.instance.add(product);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} sepete eklendi'),
        backgroundColor: AppColors.success,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
