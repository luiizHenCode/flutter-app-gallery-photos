import 'package:flutter/material.dart';
import 'package:grid_gallery/models/favorites_model.dart';
import 'package:grid_gallery/pages/home/home_page.dart';
import 'package:grid_gallery/pages/photo/photo_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritesModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Grid Gallery",
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        "/photo": (context) => const PhotoPage(),
      },
    );
  }
}
