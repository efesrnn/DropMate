// Sepet durumu - basit ChangeNotifier (material/foundation içinde gelir).
// Harici bir state-management paketi kullanılmaz; yönergeye uygun.

import 'package:flutter/foundation.dart';
import 'product.dart';

class CartController extends ChangeNotifier {
  // Singleton - tüm ekranlar aynı sepete erişir.
  CartController._internal();
  static final CartController instance = CartController._internal();

  final List<Product> _items = <Product>[];

  // Sepetteki ürün listesi (değiştirilemez).
  List<Product> get items => List.unmodifiable(_items);

  // Sepetteki toplam adet (rozet için).
  int get count => _items.length;

  // Toplam tutar.
  double get total =>
      _items.fold<double>(0, (sum, p) => sum + p.price);

  void add(Product p) {
    _items.add(p);
    notifyListeners();
  }

  void removeAt(int index) {
    if (index >= 0 && index < _items.length) {
      _items.removeAt(index);
      notifyListeners();
    }
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
