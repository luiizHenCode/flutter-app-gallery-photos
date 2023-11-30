import 'package:flutter/material.dart';
import 'package:grid_gallery/models/photos_model.dart';

class PhotoCard extends StatelessWidget {
  const PhotoCard({
    super.key,
    this.margin,
    this.borderRadius,
    this.height,
    this.isFavorite = false,
    this.toggleFavorite,
    required this.photo,
  });

  final PhotosModel photo;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final double? height;
  final bool isFavorite;
  final Function()? toggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "photo-${photo.id}",
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: height,
            margin: margin,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  photo.downloadUrl,
                ),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3),
                  BlendMode.darken,
                ),
              ),
              color: Colors.grey[200],
              borderRadius: borderRadius,
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: GestureDetector(
              onTap: toggleFavorite,
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.white,
                size: 32,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
