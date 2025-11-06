import 'package:flutter_riverpod/legacy.dart';
import 'package:wallpapper_studio_app/models/wallpapper_models.dart';

// StateNotifier to manage favorites
class FavoritesNotifier extends StateNotifier<List<Wallpaper>> {
  FavoritesNotifier() : super([]);

  // Check if wallpaper is favorite
  bool isFavorite(String imagePath) {
    return state.any((wallpaper) => wallpaper.imagePath == imagePath);
  }

  // Add wallpaper to favorites
  void addToFavorites(Wallpaper wallpaper) {
    if (!isFavorite(wallpaper.imagePath)) {
      state = [...state, wallpaper]; // update state
    }
  }

  // Remove wallpaper from favorites
  void removeFromFavorites(String imagePath) {
    state = state.where((wallpaper) => wallpaper.imagePath != imagePath).toList();
  }

  // Toggle favorite
  void toggleFavorite(Wallpaper wallpaper) {
    if (isFavorite(wallpaper.imagePath)) {
      removeFromFavorites(wallpaper.imagePath);
    } else {
      addToFavorites(wallpaper);
    }
  }
}

// Riverpod provider
final favoritesProvider = StateNotifierProvider<FavoritesNotifier, List<Wallpaper>>(
  (ref) => FavoritesNotifier(),
);
