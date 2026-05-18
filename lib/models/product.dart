// Product modeli.
// JSON serileştirme (fromJson/toJson) destekler, hem seed verisi okumak
// hem de ilerideki REST entegrasyonları için temel oluşturur.

class Product {
  final int id;
  final String name;
  final String category;
  final double price;
  final String description;
  final String imageUrl;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.imageUrl,
  });

  // JSON'dan Product nesnesi oluşturur.
  // Eksik veya yanlış tipli alanlar için güvenli varsayılanlar kullanır.
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name']?.toString() ?? '',
      category: json['category']?.toString() ?? 'Genel',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      description: json['description']?.toString() ?? '',
      imageUrl: json['imageUrl']?.toString() ?? '',
    );
  }

  // Product nesnesini JSON'a çevirir (cart kalıcı hale getirme vb. için).
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'price': price,
      'description': description,
      'imageUrl': imageUrl,
    };
  }

  // Fiyatın "₺49,90" formatında string gösterimini döndürür.
  String get formattedPrice {
    final whole = price.truncate();
    final fraction = ((price - whole) * 100).round().toString().padLeft(2, '0');
    return '₺$whole,$fraction';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Product && other.id == id);

  @override
  int get hashCode => id.hashCode;
}
