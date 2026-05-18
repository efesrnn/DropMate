// Statik urun verisi.
// 7 kategori (Market, Yemek, Ilac, Cicek & Hediye, Kirtasiye, Teknoloji,
// Su & Icecek) uzerinden ~18 urun tanimlar.
// Gercek bir backend yerine bu sabit liste kullanilir.

import '../models/product.dart';

// 7 sabit kategori - BRAND_IDENTITY.md ile birebir uyumlu.
const List<String> kCategories = <String>[
  'Tumu',
  'Market',
  'Yemek',
  'Ilac',
  'Cicek & Hediye',
  'Kirtasiye',
  'Teknoloji',
  'Su & Icecek',
];

// Picsum tohum URL'si - ag bagli olmasa bile fallback ile sorunsuz calisir.
String _img(int seed) => 'https://picsum.photos/seed/dropmate$seed/400/400';

// Ham JSON listesi - Product.fromJson ile parse edilir.
final List<Map<String, dynamic>> productJson = <Map<String, dynamic>>[
  {
    'id': 1,
    'name': 'Tam Bugday Ekmek',
    'category': 'Market',
    'price': 24.90,
    'description':
        'Gunluk taze, %100 tam bugday unundan; lifli ve doyurucu. 500 gr ambalaj.',
    'imageUrl': _img(1),
  },
  {
    'id': 2,
    'name': 'Organik Sut 1L',
    'category': 'Market',
    'price': 32.50,
    'description':
        'Cumranli ciftliklerden gunluk organik inek sutu. Soguk zincir korumali.',
    'imageUrl': _img(2),
  },
  {
    'id': 3,
    'name': 'Kahvalti Yumurtasi 15li',
    'category': 'Market',
    'price': 89.90,
    'description':
        'Serbest gezen tavuk yumurtasi, kahvalti boyu, 15li koli.',
    'imageUrl': _img(3),
  },
  {
    'id': 4,
    'name': 'Cheeseburger Menu',
    'category': 'Yemek',
    'price': 189.00,
    'description':
        '180 gr dana kofte, cedar peynir, patates ve icecek. Sicak teslimat.',
    'imageUrl': _img(4),
  },
  {
    'id': 5,
    'name': 'Margherita Pizza Orta',
    'category': 'Yemek',
    'price': 215.00,
    'description':
        'Ev yapimi hamur, dogal domates sos ve mozzarella. 30 cm.',
    'imageUrl': _img(5),
  },
  {
    'id': 6,
    'name': 'Tavuk Sezar Salata',
    'category': 'Yemek',
    'price': 145.00,
    'description':
        'Izgara tavuk gogsu, marul, parmesan, kruton ve sezar sos.',
    'imageUrl': _img(6),
  },
  {
    'id': 7,
    'name': 'Parol 500 mg 20 Tablet',
    'category': 'Ilac',
    'price': 38.75,
    'description':
        'Hafif/orta agri ve ates dusurucu. Recetesiz satilabilir.',
    'imageUrl': _img(7),
  },
  {
    'id': 8,
    'name': 'C Vitamini 1000 mg',
    'category': 'Ilac',
    'price': 129.00,
    'description':
        'Efervesan tablet, 20 adet. Bagisiklik destegi icin.',
    'imageUrl': _img(8),
  },
  {
    'id': 9,
    'name': 'Kirmizi Gul Buketi',
    'category': 'Cicek & Hediye',
    'price': 459.00,
    'description':
        '11 dal taze kirmizi gul, hediye ambalajli. Ayni gun teslimat.',
    'imageUrl': _img(9),
  },
  {
    'id': 10,
    'name': 'Premium Cikolata Kutu',
    'category': 'Cicek & Hediye',
    'price': 299.00,
    'description':
        '24li karisik bitter ve sutlu cikolata. Hediye paketi dahil.',
    'imageUrl': _img(10),
  },
  {
    'id': 11,
    'name': 'A4 Defter 80 Yaprak',
    'category': 'Kirtasiye',
    'price': 64.90,
    'description':
        'Spiralli, cizgili, kapakli defter. Lise/universite icin uygun.',
    'imageUrl': _img(11),
  },
  {
    'id': 12,
    'name': 'Jel Kalem Seti 8li',
    'category': 'Kirtasiye',
    'price': 79.50,
    'description':
        '0.7 mm jel kalem, 8 renk, akici yazim.',
    'imageUrl': _img(12),
  },
  {
    'id': 13,
    'name': 'USB-C Sarj Kablosu 1m',
    'category': 'Teknoloji',
    'price': 99.00,
    'description':
        '3A hizli sarj destekli orgu kapli USB-C kablo.',
    'imageUrl': _img(13),
  },
  {
    'id': 14,
    'name': 'Kablosuz Kulaklik',
    'category': 'Teknoloji',
    'price': 749.00,
    'description':
        'Bluetooth 5.3, 30 saate kadar pil, gurultu izolasyonu.',
    'imageUrl': _img(14),
  },
  {
    'id': 15,
    'name': 'Powerbank 10.000 mAh',
    'category': 'Teknoloji',
    'price': 549.00,
    'description':
        'Hizli sarj cikisli tasinabilir batarya, USB-C giris.',
    'imageUrl': _img(15),
  },
  {
    'id': 16,
    'name': 'Dogal Kaynak Suyu 5L',
    'category': 'Su & Icecek',
    'price': 29.00,
    'description':
        'Saman ambalaj, dogal kaynak suyu, 5 litre.',
    'imageUrl': _img(16),
  },
  {
    'id': 17,
    'name': 'Taze Sikma Portakal Suyu',
    'category': 'Su & Icecek',
    'price': 69.00,
    'description':
        '500 ml taze sikilmis portakal suyu, sekersiz.',
    'imageUrl': _img(17),
  },
  {
    'id': 18,
    'name': 'Soguk Demleme Kahve',
    'category': 'Su & Icecek',
    'price': 95.00,
    'description':
        '12 saat soguk demleme, 330 ml sise, %100 arabica.',
    'imageUrl': _img(18),
  },
];

// JSON listesini Product objelerine cevirir.
List<Product> loadProducts() {
  return productJson.map((j) => Product.fromJson(j)).toList(growable: false);
}
