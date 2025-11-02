import 'package:flutter/material.dart';
import 'package:wallpapper_studio_app/utils/route_generator.dart' ;
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WallPapper Studio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white)
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteGenerator.initial,
      onGenerateRoute: RouteGenerator.generateRoute,
    ) ;
  }
}