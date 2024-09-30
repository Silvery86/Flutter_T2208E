
class Destination {
  final String name;
  final String imageUrl;
  final double rating;
  final bool isFavorite;

  Destination({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.isFavorite,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      name: json['name'],
      imageUrl: json['imageUrl'],
      rating: json['rating'].toDouble(),
      isFavorite: json['isFavorite'],
    );
  }
}
