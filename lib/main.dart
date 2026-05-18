// DropMate - Mini Katalog uygulamasının giriş noktası.
// Hem named route hem MaterialPageRoute kullanımı yönergeyi karşılar.

import 'package:flutter/material.dart';
import 'models/product.dart';
import 'screens/cart_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/welcome_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const DropMateApp());
}

class DropMateApp extends StatelessWidget {
  const DropMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DropMate',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const WelcomeScreen(),
      // Named route + route arguments (yönerge gerekliliği).
      routes: {
        ProductDetailScreen.routeName: (context) {
          final args = ModalRoute.of(context)!.settings.arguments;
          return ProductDetailScreen(
            product: args is Product ? args : null,
          );
        },
        CartScreen.routeName: (context) => const CartScreen(),
      },
    );
  }
}
