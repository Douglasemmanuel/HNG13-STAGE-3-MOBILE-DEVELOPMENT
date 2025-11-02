import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpapper_studio_app/widgets/components/categories.dart';
import 'package:wallpapper_studio_app/widgets/components/navbar.dart';
import 'package:wallpapper_studio_app/widgets/components/navbar_drawer.dart';
import 'package:wallpapper_studio_app/widgets/components/active.dart';
import 'package:wallpapper_studio_app/utils/route_generator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
  final isSmallScreen = MediaQuery.of(context).size.width < 800;

    return Scaffold(
       endDrawer: isSmallScreen ? const NavbarDrawer() : null,
     appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: Colors.grey, 
                width: 1,           
              ),
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent, 
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteGenerator.initial); 
                  },
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 61,
                    width: 185,
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(width: 20),
                if (!isSmallScreen) const Navbar(),
              ],
            ),
            actions: [
              if (isSmallScreen)
                Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.menu, size: 32, color: Colors.black),
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
  body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER SECTION
              Padding(
                padding:const EdgeInsets.symmetric(vertical: 10.0) ,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Active(),
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
                    Text(
                      'See All',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                        color: Color(0xFF808080),
                      ),
                    ),
                  ],
                ),
              ),

              // CATEGORIES LIST
              Categories(),
              
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}