import 'package:flutter/material.dart';
import 'package:grid_gallery/models/favorites_model.dart';
import 'package:grid_gallery/models/photos_model.dart';
import 'package:grid_gallery/widgets/photo_card.dart';
import 'package:provider/provider.dart';

class PhotoPageArgs {
  PhotoPageArgs({
    required this.photo,
  });

  final PhotosModel photo;
}

class PhotoPage extends StatefulWidget {
  const PhotoPage({super.key});

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  @override
  Widget build(BuildContext context) {
    PhotoPageArgs args =
        ModalRoute.of(context)!.settings.arguments as PhotoPageArgs;

    return Consumer<FavoritesModel>(
      builder: (context, favorite, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('P H O T O '),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PhotoCard(
                  photo: args.photo,
                  height: 300,
                  borderRadius: BorderRadius.circular(20),
                  isFavorite: favorite.contains(args.photo.id),
                  toggleFavorite: () {
                    favorite.toggle(args.photo.id);
                  },
                ),
                const SizedBox(height: 16.0),
                const Text(
                  "A U T H O R",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
                Text(
                  args.photo.author,
                  style: const TextStyle(
                    fontSize: 32,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
