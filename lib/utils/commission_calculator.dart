// DropMate komisyon hesaplayicisi.
// Yonergede teslimat suresi arttikca komisyon azalir mantigi tanimlidir;
// burada bu mantik somut bir formul olarak ifade edilir.
//
// Formul: max komisyondan baslar, beklenen sure asildiginde lineer azalir,
// min ile max arasinda clamp edilir. BRAND_IDENTITY.md 8. bolum referansi.

class CommissionCalculator {
  CommissionCalculator._();

  /// Verilen teslimat moduna ait min/max araliginda dinamik komisyon doner.
  ///
  /// [elapsedMinutes] kuryenin teslimati tamamladigi sure.
  /// [expectedMinutes] modun beklenen ortalama suresi (orta nokta).
  /// [minCommission] / [maxCommission] BRAND_IDENTITY tablosundan gelir.
  static double calculate({
    required int elapsedMinutes,
    required int expectedMinutes,
    required int minCommission,
    required int maxCommission,
  }) {
    // Beklenen sureyi gecmediyse maksimum komisyon.
    if (elapsedMinutes <= expectedMinutes) {
      return maxCommission.toDouble();
    }
    // Beklenenden iki kat fazla surdiyse minimum komisyon (daha fazla
    // gecikme komisyon dusurmez - alt limit).
    final overtime = elapsedMinutes - expectedMinutes;
    final ratio = (overtime / expectedMinutes).clamp(0.0, 1.0);
    final range = (maxCommission - minCommission).toDouble();
    final value = maxCommission - (range * ratio);
    return value.clamp(minCommission.toDouble(), maxCommission.toDouble());
  }

  /// Komisyonu yonergedeki ust/alt sistem siniri (15-120 TL) icine clamp eder.
  static double clampToGlobalLimits(double value) {
    return value.clamp(15.0, 120.0);
  }
}
