import 'package:flutter/material.dart';
import 'package:wallpapper_studio_app/utils/route_generator.dart';
import 'package:wallpapper_studio_app/widgets/components/navbar.dart';
import 'package:wallpapper_studio_app/widgets/components/navbar_drawer.dart';
import 'package:wallpapper_studio_app/widgets/components/wallpaper_category.dart'  ;
import 'package:wallpapper_studio_app/widgets/components/preview.dart' ;
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:10 , vertical: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                _Nature(context),
                PreviewWallpaper(),
            ],),
      ),
      ),
    );
  }




  Widget _Nature(BuildContext context){
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
  children: [
    IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context); 
      },
    ),
    GestureDetector(
      onTap: () {
        Navigator.pop(context); 
      },
      child: Text(
        'Back to Categories',
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
    ),
  ],
  ),
    SizedBox(height: 10),
  Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    // Text on the left
    Padding(
      padding: const EdgeInsets.only(left:20),
      child: SizedBox(
        child:  SvgPicture.asset(
                      'assets/images/Nature.svg',
                       height: 40,
                      width: 40,
                       fit: BoxFit.contain,
                       ),
      ),
    ),
    const SizedBox(width: 16),
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
    ),
    WallpaperCategory(),
        ],
    );
  }
}