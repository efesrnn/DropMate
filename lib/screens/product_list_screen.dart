// Ana ekran: arama + kategori filtresi + urun gridi.
// Karta dokununca named route + Route Arguments ile detay ekranina gider.

import 'package:flutter/material.dart';
import '../data/products.dart';
import '../models/product.dart';
import '../theme/app_colors.dart';
import '../widgets/category_chip_row.dart';
import '../widgets/product_card.dart';
import '../widgets/search_field.dart';
import 'product_detail_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late final List<Product> _allProducts;
  final TextEditingController _searchController = TextEditingController();
  String _query = '';
  String _selectedCategory = 'Tumu';

  @override
  void initState() {
    super.initState();
    _allProducts = loadProducts();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Product> get _filteredProducts {
    final q = _query.trim().toLowerCase();
    return _allProducts.where((p) {
      final matchesCategory =
          _selectedCategory == 'Tumu' || p.category == _selectedCategory;
      final matchesQuery = q.isEmpty ||
          p.name.toLowerCase().contains(q) ||
          p.description.toLowerCase().contains(q);
      return matchesCategory && matchesQuery;
    }).toList(growable: false);
  }

  void _openDetail(Product p) {
    // Named route + Route Arguments yonergeyi karsilar.
    Navigator.of(context).pushNamed(
      ProductDetailScreen.routeName,
      arguments: p,
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = _filteredProducts;
    return Scaffold(
      appBar: AppBar(
        title: const Text('DropMate'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
            tooltip: 'Sepet',
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
            child: SearchField(
              controller: _searchController,
              onChanged: (v) => setState(() => _query = v),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CategoryChipRow(
              categories: kCategories,
              selected: _selectedCategory,
              onSelected: (c) => setState(() => _selectedCategory = c),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: items.isEmpty
                ? _EmptyState(query: _query)
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.builder(
                      itemCount: items.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.66,
                      ),
                      itemBuilder: (context, index) {
                        final p = items[index];
                        return ProductCard(
                          product: p,
                          onTap: () => _openDetail(p),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final String query;
  const _EmptyState({required this.query});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.search_off,
                size: 64, color: AppColors.textSecondary),
            const SizedBox(height: 12),
            Text(
              query.isEmpty
                  ? 'Bu kategoride urun bulunamadi'
                  : '"$query" icin sonuc yok',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.textSecondary,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
