import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' ;
import 'package:wallpapper_studio_app/app.dart' ;
import 'package:wallpapper_studio_app/provider/navbar_provider.dart' ;
void main() async {
   WidgetsFlutterBinding.ensureInitialized();

  // Load saved navbar index
  final savedNavbarIndex = await NavbarIndexNotifier.loadIndex();
   runApp(
    ProviderScope(
      overrides: [
        navbarIndexProvider.overrideWith(
          (ref) => NavbarIndexNotifier(savedNavbarIndex),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

