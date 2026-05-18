// DropMate - Mini Katalog uygulamasinin giris noktasi.
// Hem named route hem MaterialPageRoute kullanimi yonergeyi karsilar.

import 'package:flutter/material.dart';
import 'models/product.dart';
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
      // Named route + route arguments
      routes: {
        ProductDetailScreen.routeName: (context) {
          final args = ModalRoute.of(context)!.settings.arguments;
          return ProductDetailScreen(
            product: args is Product ? args : null,
          );
        },
      },
    );
  }
}
