import 'dart:convert';

import 'package:http/http.dart' as http;

// MODEL
import '../models/photos_model.dart';

Future<List<PhotosModel>> fetchPhotos() async {
  final response = await http.get(
    Uri.parse("https://picsum.photos/v2/list?page=2&limit=50"),
  );

  if (response.statusCode == 200) {
    List<PhotosModel> photosList =
        PhotosModel.fromJsonList(jsonDecode(response.body) as List<dynamic>);

    return photosList;
  } else {
    throw Exception("Failed to load photos");
  }
}
