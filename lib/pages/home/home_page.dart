import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// MODELS
import '../../models/favorites_model.dart';
import '../../models/photos_model.dart';
//PAGES
import '../../pages/photo/photo_page.dart';
// SERVICES
import '../../services/fetch_photos.dart';
// WIDGETS
import '../../widgets/photo_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<PhotosModel>> _futurePhotos;

  @override
  void initState() {
    super.initState();
    _futurePhotos = fetchPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesModel>(builder: (context, favorite, child) {
      return Scaffold(
          body: FutureBuilder(
              future: _futurePhotos,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 5.0,
                      right: 5.0,
                    ),
                    child: CustomScrollView(
                      slivers: [
                        const SliverAppBar(
                          title: Text(' G R I D   G A L L E R Y'),
                          floating: true,
                          snap: true,
                          centerTitle: true,
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.only(bottom: 36.0),
                          sliver: SliverGrid(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                            ),
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                PhotosModel photo = snapshot.data![index];

                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/photo',
                                      arguments: PhotoPageArgs(
                                        photo: photo,
                                      ),
                                    );
                                  },
                                  child: PhotoCard(
                                    photo: photo,
                                    margin: const EdgeInsets.all(5.0),
                                    borderRadius: BorderRadius.circular(8.0),
                                    isFavorite: favorite.contains(photo.id),
                                    toggleFavorite: () {
                                      favorite.toggle(photo.id);
                                    },
                                  ),
                                );
                              },
                              childCount: snapshot.data!.length,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("${snapshot.error}"),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }));
    });
  }
}
