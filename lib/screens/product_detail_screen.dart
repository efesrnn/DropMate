// Urun detay ekrani.
// Product nesnesini Route Arguments uzerinden alir.
// Statefull cunku secili teslimat secenegi tutulur.

import 'package:flutter/material.dart';
import '../models/product.dart';
import '../theme/app_colors.dart';
import '../widgets/delivery_option_card.dart';

class ProductDetailScreen extends StatefulWidget {
  static const String routeName = '/product-detail';

  // Direkt push edildiginde de calissin diye constructor parametresi de var.
  final Product? product;

  const ProductDetailScreen({super.key, this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _selectedDeliveryIndex = 1; // varsayilan: Bisiklet

  @override
  Widget build(BuildContext context) {
    // Route Arguments yoluyla gelen Product nesnesini al.
    final Product product = widget.product ??
        ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Urun Detayi'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Urun gorseli
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

            // Kategori rozeti
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

            // Baslik
            Text(
              product.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),

            // Fiyat
            Text(
              product.formattedPrice,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 20),

            // Aciklama
            Text(
              'Aciklama',
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

            // Teslimat secenekleri
            Text(
              'Teslimat Secenegi',
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
          ],
        ),
      ),
      // Alt sabit buton (Sepete Ekle - sonraki commit'te bagli olacak)
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Sepete eklendi')),
                );
              },
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text('Sepete Ekle'),
            ),
          ),
        ),
      ),
    );
  }
}
