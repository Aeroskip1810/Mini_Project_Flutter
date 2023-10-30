class Shoes {
  String imageUrl;
  String title;
  String tipe;
  int size;
  String kategori;

  Shoes({
    required this.imageUrl,
    required this.title,
    required this.tipe,
    required this.size,
    required this.kategori,
  });

  factory Shoes.fromJson(Map<String, dynamic> json) {
    return Shoes(
      imageUrl: json['imageUrl'] as String,
      title: json['title'] as String,
      tipe: json['tipe'] as String,
      size: json['size'] as int,
      kategori: json['kategori'] as String,
    );
  }
}
