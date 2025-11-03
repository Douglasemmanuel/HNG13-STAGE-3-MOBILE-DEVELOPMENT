import 'package:flutter/material.dart';
import 'package:wallpapper_studio_app/utils/route_generator.dart';
import 'package:wallpapper_studio_app/widgets/components/navbar.dart';
import 'package:wallpapper_studio_app/widgets/components/navbar_drawer.dart';
import 'package:wallpapper_studio_app/widgets/components/categories.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpapper_studio_app/widgets/components/active_categories.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
   bool showActiveCategories = false; 
  int selectedIconIndex = 0;

  void _onIconPressed(int index) {
    setState(() {
      selectedIconIndex = index;
      showActiveCategories = index == 1; 
    });
  }
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
      body:SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _BrowserHeader(context),
               if (!showActiveCategories) const Categories(),
              if (showActiveCategories) const ActiveCategories(),
              SizedBox(height:30),
            ],
          ),
        ),
        ),
    );
  }

  Widget _BrowserHeader(BuildContext context){
    return Padding(
      padding:const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
                      'assets/images/Browsecategories.png',
                      height: 60,
                      width: 560,
                      fit: BoxFit.contain,
                    ),
                   const SizedBox(height: 5),
                    Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    // Text on the left
    Expanded(
      child: Text(
        'Explore our curated collections of stunning wallpapers',
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: 24,
          color: const Color(0xFF575757),
        ),
      ),
    ),

    // Spacer between text and icons
    const SizedBox(width: 16),

    // Icons in a row on the right
    Row(
      mainAxisSize: MainAxisSize.min,
      children:  [
        IconButton(
  onPressed: () => _onIconPressed(0),
  icon: SvgPicture.asset(
    'assets/images/SquaresFour.svg',
    height: 40,
    width: 40,
    colorFilter: ColorFilter.mode(
      selectedIconIndex == 0 ? Colors.amberAccent : Colors.black,
      BlendMode.srcIn,
    ),
  ),
),

        SizedBox(width: 4),
        IconButton(
  onPressed: () => _onIconPressed(1),
  icon: SvgPicture.asset(
    'assets/images/Rows.svg',
    height: 40,
    width: 40,
    colorFilter: ColorFilter.mode(
      selectedIconIndex == 1 ? Colors.amberAccent.shade700 : Colors.black,
      BlendMode.srcIn,
    ),
  ),
),
      ],
    ),
  ],
)

        ],
      ),
    );

  }
}