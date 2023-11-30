class PhotosModel {
  final String id;
  final String author;
  final int width;
  final int height;
  final String url;
  final String downloadUrl;

  PhotosModel({
    required this.id,
    required this.author,
    required this.width,
    required this.height,
    required this.url,
    required this.downloadUrl,
  });

// Define a função que converte o JSON para um objeto Dart
  factory PhotosModel.fromJson(Map<String, dynamic> json) {
    try {
      return PhotosModel(
        id: json['id'],
        author: json['author'],
        width: json['width'],
        height: json['height'],
        url: json['url'],
        downloadUrl: json['download_url'],
      );
    } catch (e) {
      throw const FormatException('Unexpected JSON type for PhotosModel');
    }
  }

  // Define a função que converte um objeto Dart para uma lista de JSON
  static List<PhotosModel> fromJsonList(List<dynamic> json) {
    return json.map((e) => PhotosModel.fromJson(e)).toList();
  }
}
