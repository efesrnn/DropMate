// Product modeli.
// JSON serilestirme (fromJson/toJson) destekler, hem seed verisi okumak
// hem de ilerideki REST entegrasyonlari icin temel olusturur.

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

  // JSON'dan Product nesnesi olusturur.
  // Eksik veya yanlis tipli alanlar icin guvenli varsayilanlar kullanir.
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

  // Product nesnesini JSON'a cevirir (cart kalici hale getirme vb. icin).
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

  // Fiyatin "₺49,90" formatinda string gosterimini dondurur.
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
