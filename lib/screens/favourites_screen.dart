import 'package:flutter/material.dart';
import 'package:wallpapper_studio_app/utils/route_generator.dart';
import 'package:wallpapper_studio_app/widgets/components/navbar.dart';
import 'package:wallpapper_studio_app/widgets/components/navbar_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpapper_studio_app/widgets/components/saved_wallpapers.dart' ;
import 'package:wallpapper_studio_app/widgets/components/custom_apbar.dart';
class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 800;
    return Scaffold(
       endDrawer: isSmallScreen ? const NavbarDrawer() : null,
     appBar:CustomAppBar(isSmallScreen: isSmallScreen),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Column(
  crossAxisAlignment: CrossAxisAlignment.start, 
  children: [
    SizedBox(
      // width: 60, 
      child: Image.asset(
        'assets/images/SavedWallpapers.png',
        height: 60,
        fit: BoxFit.contain,
      ),
    ),
    const SizedBox(height: 15),
    ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 870),
      child: Text(
        'Your saved wallpapers collection',
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: 24,
          color: Color(0xFF575757),
        ),
      ),
    ),
  ],
)

              ),
              //  _EmptyFavourites(context),
               SavedWallpapers(),
            ],
          ),
          ),
        ),
    );
  }



  Widget _EmptyFavourites(BuildContext build){
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 35),
            Image.asset(
                      'assets/images/empty.png',
                      height: 185,
                      width: 197.77,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 15),
           Text(
        'No Saved Wallpapers',
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          fontSize: 24,
          color: const Color(0xFF575757),
        ),
      ),
        Text(
        ' Start saving your favorite wallpapers to see them here',
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: const Color(0xFF575757),
        ),
      ),
       const SizedBox(height: 25),
      ElevatedButton(
  onPressed: () {
     Navigator.pushNamed(context, RouteGenerator.browse); 
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFFFBB03B), 
    fixedSize: const Size(200, 50),            
    padding: const EdgeInsets.all(10),          
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(21),  
    ),
   
  ),
  child: const Text(
    'Browse Wallpaper',
    style: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  ),
),

        ],
      ),
    );

  }

 
}