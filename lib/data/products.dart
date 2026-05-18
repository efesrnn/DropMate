// Statik ürün verisi.
// 7 kategori (Market, Yemek, İlaç, Çiçek & Hediye, Kırtasiye, Teknoloji,
// Su & İçecek) üzerinden ~18 ürün tanımlar.
// Gerçek bir backend yerine bu sabit liste kullanılır.

import '../models/product.dart';

// 7 sabit kategori - BRAND_IDENTITY.md ile birebir uyumlu.
const List<String> kCategories = <String>[
  'Tümü',
  'Market',
  'Yemek',
  'İlaç',
  'Çiçek & Hediye',
  'Kırtasiye',
  'Teknoloji',
  'Su & İçecek',
];

// Unsplash üzerinden ürüne özel sabit görsel.
// Her foto ID ürün ile semantik olarak eşleşir; çevrimdışı
// durumda ProductCard'ın errorBuilder'ı kategoriye uygun ikon gösterir.
String _img(String photoId) =>
    'https://images.unsplash.com/$photoId?auto=format&fit=crop&w=400&h=400&q=80';

// Ham JSON listesi - Product.fromJson ile parse edilir.
final List<Map<String, dynamic>> productJson = <Map<String, dynamic>>[
  {
    'id': 1,
    'name': 'Tam Buğday Ekmek',
    'category': 'Market',
    'price': 24.90,
    'description':
        'Günlük taze, %100 tam buğday unundan; lifli ve doyurucu. 500 gr ambalaj.',
    'imageUrl': _img('photo-1509440159596-0249088772ff'),
  },
  {
    'id': 2,
    'name': 'Organik Süt 1L',
    'category': 'Market',
    'price': 32.50,
    'description':
        'Çumralı çiftliklerden günlük organik inek sütü. Soğuk zincir korumalı.',
    'imageUrl': _img('photo-1550583724-b2692b85b150'),
  },
  {
    'id': 3,
    'name': 'Kahvaltı Yumurtası 15li',
    'category': 'Market',
    'price': 89.90,
    'description':
        'Serbest gezen tavuk yumurtası, kahvaltı boyu, 15li koli.',
    'imageUrl': _img('photo-1518569656558-1f25e69d93d7'),
  },
  {
    'id': 4,
    'name': 'Cheeseburger Menü',
    'category': 'Yemek',
    'price': 189.00,
    'description':
        '180 gr dana köfte, cheddar peynir, patates ve içecek. Sıcak teslimat.',
    'imageUrl': _img('photo-1568901346375-23c9450c58cd'),
  },
  {
    'id': 5,
    'name': 'Margherita Pizza Orta',
    'category': 'Yemek',
    'price': 215.00,
    'description':
        'Ev yapımı hamur, doğal domates sos ve mozzarella. 30 cm.',
    'imageUrl': _img('photo-1604068549290-dea0e4a305ca'),
  },
  {
    'id': 6,
    'name': 'Tavuk Sezar Salata',
    'category': 'Yemek',
    'price': 145.00,
    'description':
        'Izgara tavuk göğsü, marul, parmesan, kruton ve sezar sos.',
    'imageUrl': _img('photo-1551248429-40975aa4de74'),
  },
  {
    'id': 7,
    'name': 'Parol 500 mg 20 Tablet',
    'category': 'İlaç',
    'price': 38.75,
    'description':
        'Hafif/orta ağrı ve ateş düşürücü. Reçetesiz satılabilir.',
    'imageUrl': _img('photo-1584308666744-24d5c474f2ae'),
  },
  {
    'id': 8,
    'name': 'C Vitamini 1000 mg',
    'category': 'İlaç',
    'price': 129.00,
    'description':
        'Efervesan tablet, 20 adet. Bağışıklık desteği için.',
    'imageUrl': _img('photo-1626716493137-b67fe9501e76'),
  },
  {
    'id': 9,
    'name': 'Kırmızı Gül Buketi',
    'category': 'Çiçek & Hediye',
    'price': 459.00,
    'description':
        '11 dal taze kırmızı gül, hediye ambalajlı. Aynı gün teslimat.',
    'imageUrl': _img('photo-1561181286-d3fee7d55364'),
  },
  {
    'id': 10,
    'name': 'Premium Çikolata Kutusu',
    'category': 'Çiçek & Hediye',
    'price': 299.00,
    'description':
        '24lü karışık bitter ve sütlü çikolata. Hediye paketi dahil.',
    'imageUrl': _img('photo-1549007994-cb92caebd54b'),
  },
  {
    'id': 11,
    'name': 'A4 Defter 80 Yaprak',
    'category': 'Kırtasiye',
    'price': 64.90,
    'description':
        'Spiralli, çizgili, kapaklı defter. Lise/üniversite için uygun.',
    'imageUrl': _img('photo-1531346878377-a5be20888e57'),
  },
  {
    'id': 12,
    'name': 'Jel Kalem Seti 8li',
    'category': 'Kırtasiye',
    'price': 79.50,
    'description':
        '0.7 mm jel kalem, 8 renk, akıcı yazım.',
    'imageUrl': _img('photo-1568871391175-e29ee4406bbe'),
  },
  {
    'id': 13,
    'name': 'USB-C Şarj Kablosu 1m',
    'category': 'Teknoloji',
    'price': 99.00,
    'description':
        '3A hızlı şarj destekli örgü kaplı USB-C kablo.',
    'imageUrl': _img('photo-1583394838336-acd977736f90'),
  },
  {
    'id': 14,
    'name': 'Kablosuz Kulaklık',
    'category': 'Teknoloji',
    'price': 749.00,
    'description':
        'Bluetooth 5.3, 30 saate kadar pil, gürültü izolasyonu.',
    'imageUrl': _img('photo-1505740420928-5e560c06d30e'),
  },
  {
    'id': 15,
    'name': 'Powerbank 10.000 mAh',
    'category': 'Teknoloji',
    'price': 549.00,
    'description':
        'Hızlı şarj çıkışlı taşınabilir batarya, USB-C giriş.',
    'imageUrl': _img('photo-1609091839311-d5365f9ff1c5'),
  },
  {
    'id': 16,
    'name': 'Doğal Kaynak Suyu 5L',
    'category': 'Su & İçecek',
    'price': 29.00,
    'description':
        'Cam şişe ambalaj, doğal kaynak suyu, 5 litre.',
    'imageUrl': _img('photo-1548839140-29a749e1cf4d'),
  },
  {
    'id': 17,
    'name': 'Taze Sıkma Portakal Suyu',
    'category': 'Su & İçecek',
    'price': 69.00,
    'description':
        '500 ml taze sıkılmış portakal suyu, şekersiz.',
    'imageUrl': _img('photo-1600271886742-f049b9b40ce6'),
  },
  {
    'id': 18,
    'name': 'Soğuk Demleme Kahve',
    'category': 'Su & İçecek',
    'price': 95.00,
    'description':
        '12 saat soğuk demleme, 330 ml şişe, %100 arabica.',
    'imageUrl': _img('photo-1461023058943-07fcbe16d735'),
  },
];

// JSON listesini Product objelerine çevirir.
List<Product> loadProducts() {
  return productJson.map((j) => Product.fromJson(j)).toList(growable: false);
}
