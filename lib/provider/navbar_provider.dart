import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';

// final navbarIndexProvider = StateNotifierProvider<NavbarIndexNotifier, int>(
//   (ref) => NavbarIndexNotifier(),
// );

// class NavbarIndexNotifier extends StateNotifier<int> {
//   static const String _key = 'active_navbar_index';

//   NavbarIndexNotifier() : super(0) {
//     _loadIndex();
//   }

//   Future<void> _loadIndex() async {
//     final prefs = await SharedPreferences.getInstance();
//     final savedIndex = prefs.getInt(_key) ?? 0;
//     state = savedIndex;
//   }

//   Future<void> setIndex(int index) async {
//     state = index;
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setInt(_key, index);
//   }
// }


final navbarIndexProvider =
    StateNotifierProvider<NavbarIndexNotifier, int>((ref) => NavbarIndexNotifier());

class NavbarIndexNotifier extends StateNotifier<int> {
  static const String _key = 'active_navbar_index';

  NavbarIndexNotifier([super.initialIndex = 0]);

  Future<void> setIndex(int index) async {
    state = index;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_key, index);
  }

  static Future<int> loadIndex() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_key) ?? 0;
  }
}
