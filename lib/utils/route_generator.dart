import 'package:flutter/material.dart';
import 'package:wallpapper_studio_app/screens/home_screen.dart';
import 'package:wallpapper_studio_app/screens/settings_screen.dart';
import 'package:wallpapper_studio_app/screens/browse_screen.dart';
import 'package:wallpapper_studio_app/screens/favourites_screen.dart';
import 'package:wallpapper_studio_app/screens/wallpapper_screen.dart';
import 'package:wallpapper_studio_app/screens/initial_screen.dart';

class RouteGenerator {
  static const String initial = '/' ;
  static const  String home = '/home' ;
  static const String  setting = '/settings' ;
  static const  String browse = '/browse' ;
  static const String favourites = '/favourites' ;
  static const  String wallpapper = '/wallpapper' ;


  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case initial:
      return MaterialPageRoute(builder: (_)=> InitialScreen());
      case home:
        return  MaterialPageRoute(builder: (_)=> HomeScreen());
      case browse:
        return  MaterialPageRoute(builder: (_)=> BrowseScreen());
      case setting:
        return  MaterialPageRoute(builder: (_)=> SettingsScreen());
      case favourites:
        return  MaterialPageRoute(builder: (_)=> FavouritesScreen());
      case wallpapper:
        return  MaterialPageRoute(builder: (_)=> WallpapperScreen());
      default:
      return _errorRoute();
    }
  }



static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Page not found')),
      ),
    );
  }
}