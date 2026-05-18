// DropMate komisyon hesaplayıcısı.
// Yönergede teslimat süresi arttıkça komisyon azalır mantığı tanımlıdır;
// burada bu mantık somut bir formül olarak ifade edilir.
//
// Formül: max komisyondan başlar, beklenen süre aşıldığında lineer azalır,
// min ile max arasında clamp edilir. BRAND_IDENTITY.md 8. bölüm referansı.

class CommissionCalculator {
  CommissionCalculator._();

  /// Verilen teslimat moduna ait min/max aralığında dinamik komisyon döner.
  ///
  /// [elapsedMinutes] kuryenin teslimatı tamamladığı süre.
  /// [expectedMinutes] modun beklenen ortalama süresi (orta nokta).
  /// [minCommission] / [maxCommission] BRAND_IDENTITY tablosundan gelir.
  static double calculate({
    required int elapsedMinutes,
    required int expectedMinutes,
    required int minCommission,
    required int maxCommission,
  }) {
    // Beklenen süreyi geçmediyse maksimum komisyon.
    if (elapsedMinutes <= expectedMinutes) {
      return maxCommission.toDouble();
    }
    // Beklenenden iki kat fazla sürdüyse minimum komisyon (daha fazla
    // gecikme komisyonu düşürmez - alt limit).
    final overtime = elapsedMinutes - expectedMinutes;
    final ratio = (overtime / expectedMinutes).clamp(0.0, 1.0);
    final range = (maxCommission - minCommission).toDouble();
    final value = maxCommission - (range * ratio);
    return value.clamp(minCommission.toDouble(), maxCommission.toDouble());
  }

  /// Komisyonu yönergedeki üst/alt sistem sınırı (15-120 TL) içine clamp eder.
  static double clampToGlobalLimits(double value) {
    return value.clamp(15.0, 120.0);
  }
}
