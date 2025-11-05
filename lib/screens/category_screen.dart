// ignore_for_file: non_constant_identifier_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wallpapper_studio_app/utils/route_generator.dart';
import 'package:wallpapper_studio_app/widgets/components/navbar.dart';
import 'package:wallpapper_studio_app/widgets/components/navbar_drawer.dart';
import 'package:wallpapper_studio_app/widgets/components/preview_wallpaper.dart';
import 'package:wallpapper_studio_app/widgets/components/swtich_container.dart';
import 'package:wallpapper_studio_app/widgets/components/wallpaper_category.dart'  ;
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpapper_studio_app/widgets/components/custom_apbar.dart';
import 'package:wallpapper_studio_app/widgets/components/radio_button.dart';
import 'package:wallpapper_studio_app/widgets/components/wallpaper_setup.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
   bool showActiveCategories = false; 
  int selectedIconIndex = 0;
 int? selectedValue; // default = none selected
  bool showPreview = false;

  void _onRadioChanged(int? value) {
    setState(() {
      // 👇 toggle selection
      if (selectedValue == value) {
        selectedValue = null; // unselect if already selected
      } else {
        selectedValue = value;
      }
    });
  }
  void _onIconPressed(int index) {
    setState(() {
      selectedIconIndex = index;
      showActiveCategories = index == 1; 
    });
  }
  void _showPreview() {
    setState(() {
      showPreview = true;
    });
  }

  void _hidePreview() {
    setState(() {
      showPreview = false;
    });
  }
  @override
  Widget build(BuildContext context) {
       final isSmallScreen = MediaQuery.of(context).size.width < 800;
    return Scaffold(
       endDrawer: isSmallScreen ? const NavbarDrawer() : null,
    appBar:CustomAppBar(isSmallScreen: isSmallScreen) ,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:10 , vertical: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                _Nature(context),
                //  WallpaperSetup(),
                if (!isSmallScreen) PreviewWallpaper(onPreviewPressed: _showPreview),
            if (showPreview)
            Center(
              child: GestureDetector(
                onTap: _hidePreview,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5, // 40% of screen width
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                    child: Container(
                      color: Colors.black.withOpacity(0.3),
                      alignment: Alignment.center,
                      child: WallpaperSetup(
                        onClose: _hidePreview,
                      ),
                    ),
                  ),
                ),
              ),
            ),
      // The overlay with blur
      // Positioned.fill(
      //   child: GestureDetector(
      //     onTap: _hidePreview,
      //     child: BackdropFilter(
      //       filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      //       child: Container(
      //         color: Colors.black.withOpacity(0.3),
      //         alignment: Alignment.center,
      //         child: ConstrainedBox(
      //           constraints: BoxConstraints(
      //             maxWidth: MediaQuery.of(context).size.width * 0.6,
      //           ),
      //           child: WallpaperSetup(
      //             onClose: _hidePreview,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
          
            ],
            ),
      ),
      ),
    );
  }




  Widget _Nature (BuildContext context){
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
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
  // WallpaperCategory()
    // Expanded(child: WallpaperCategory(),),
    // WallpaperCategory(),
        ],
    );
  }




  void showCustomDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true, 
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent, 
        insetPadding: const EdgeInsets.only(
          top: 115, 
          left: 20, 
          right: 20,
          bottom: 20, 
        ),
        child: Container(
          width: 400,
          height: 1231.9947509765625,
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF), 
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Example content
              Text(
                'Custom Modal Title',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24), // gap
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Your modal content goes here. You can add widgets, buttons, lists, or anything inside.',
                        style: TextStyle(fontSize: 16),
                      ),
                      // more content here
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

}