// DropMate marka renk tokenleri.
// BRAND_IDENTITY.md ile birebir ayni HEX degerlerini icerir.

import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Birincil marka rengi - butonlar, CTA, logo
  static const Color primary = Color(0xFF00C896);
  static const Color primaryDark = Color(0xFF00A37A);

  // Ikincil - basliklar, koyu metin, navbar
  static const Color secondary = Color(0xFF1A1A2E);

  // Vurgu - komisyon/fiyat rozetleri
  static const Color accent = Color(0xFFFFB400);

  // Yuzeyler
  static const Color background = Color(0xFFFAFAFA);
  static const Color surface = Color(0xFFFFFFFF);

  // Metin
  static const Color textPrimary = Color(0xFF1A1A2E);
  static const Color textSecondary = Color(0xFF6B7280);

  // Cizgi & durum renkleri
  static const Color border = Color(0xFFE5E7EB);
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
}
