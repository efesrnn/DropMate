// DropMate - Mini Katalog uygulamasinin giris noktasi.
// Bu dosya MaterialApp'i baslatir, tema ve route tanimlarini yukler.

import 'package:flutter/material.dart';
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
    );
  }
}
