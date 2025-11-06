import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpapper_studio_app/widgets/components/categories.dart';
import 'package:wallpapper_studio_app/widgets/components/navbar_drawer.dart';
import 'package:wallpapper_studio_app/utils/route_generator.dart';
import 'package:wallpapper_studio_app/widgets/components/custom_apbar.dart';
class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 800;

    return Scaffold(
      endDrawer: isSmallScreen ? const NavbarDrawer() : null,
    appBar: CustomAppBar(isSmallScreen: isSmallScreen),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER SECTION
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/headername.png',
                      height: 60,
                      width: 870,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 20),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 870),
                      child: Text(
                        'Discover curated collections of stunning wallpapers. Browse by category, preview in full-screen, and set your favorites.',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 24,
                          color: const Color(0xFF575757),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // CATEGORIES HEADER
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Categories',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 32,
                        color: Colors.black,
                      ),
                    ),
                   GestureDetector(
  onTap: () {
   Navigator.pushNamed(context, RouteGenerator.home);
  },
  child: Text(
    'See All',
    style: GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: 24,
      color: const Color(0xFF808080),
    ),
  ),
)

                  ],
                ),
              ),

              // CATEGORIES LIST
              const Categories(),

              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
