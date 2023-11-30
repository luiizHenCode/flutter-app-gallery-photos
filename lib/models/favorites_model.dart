import 'package:flutter/material.dart';

class FavoritesModel extends ChangeNotifier {
  final List<String> _favorites = [];

  List<String> get favorites => _favorites;

  void toggle(String id) {
    if (_favorites.contains(id)) {
      _favorites.remove(id);
    } else {
      _favorites.add(id);
    }
    notifyListeners();
  }

  void add(String id) {
    _favorites.add(id);
    notifyListeners();
  }

  void remove(String id) {
    _favorites.remove(id);
    notifyListeners();
  }

  void clear() {
    _favorites.clear();
    notifyListeners();
  }

  bool contains(String id) {
    return _favorites.contains(id);
  }
}
