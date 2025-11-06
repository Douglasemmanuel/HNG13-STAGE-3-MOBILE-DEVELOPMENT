import 'package:flutter/material.dart';
import 'package:wallpapper_studio_app/widgets/components/navbar_drawer.dart';
import 'package:wallpapper_studio_app/widgets/components/custom_apbar.dart';
class WallpapperScreen extends StatelessWidget {
  const WallpapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 800;
    return Scaffold(
      endDrawer: isSmallScreen ? const NavbarDrawer() : null,
     appBar:CustomAppBar(isSmallScreen: isSmallScreen),
      body:SingleChildScrollView(
        child: Center(
          child:Text('Settings Screen') ,
        ),
        ),
    );
  }
}