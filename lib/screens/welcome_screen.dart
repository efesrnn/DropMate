// Karsilama / Splash ekrani.
// DropMate logosu, tagline ve "Devam Et" butonu icerir.
// Stateless bir widget olarak tasarlanmistir; durum tasimaz.

import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/dropmate_logo.dart';
import 'product_list_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Spacer(flex: 2),
              const DropMateLogo(size: 96),
              const SizedBox(height: 32),
              Text(
                'Sipariş ver.\nKomşun getirsin.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      height: 1.2,
                    ),
              ),
              const SizedBox(height: 16),
              Text(
                'Herhangi bir marketten herhangi bir ürün — '
                'yakındaki komşun dakikalar içinde getirsin.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textSecondary,
                    ),
              ),
              const Spacer(flex: 3),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // MaterialPageRoute ile push - Navigator.push kullanimi
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute<void>(
                        builder: (_) => const ProductListScreen(),
                      ),
                    );
                  },
                  child: const Text('Devam Et'),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
