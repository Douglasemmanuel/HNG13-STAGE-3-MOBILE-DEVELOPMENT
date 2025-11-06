// ignore_for_file: non_constant_identifier_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wallpapper_studio_app/widgets/components/mobile_wallpapersetup.dart';
import 'package:wallpapper_studio_app/widgets/components/navbar_drawer.dart';
import 'package:wallpapper_studio_app/widgets/components/preview_wallpaper.dart';
import 'package:wallpapper_studio_app/widgets/components/wallpaper_category.dart'  ;
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpapper_studio_app/widgets/components/custom_apbar.dart';
import 'package:wallpapper_studio_app/widgets/components/wallpaper_setup.dart';
import 'package:wallpapper_studio_app/widgets/components/mobile_preview_wallpaper.dart' ;
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
   bool isComponentVisible = false;
    void toggleComponentVisibility() {
    setState(() {
      isComponentVisible = !isComponentVisible; 
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
          padding: const EdgeInsets.symmetric(horizontal:1 , vertical: 2),
     child: Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Expanded(
      child: Stack(
        children: [
          // Wallpaper/Nature stays fully visible
          _Nature(context),

          // Only overlay a blur + dim on top when preview is active
          if (showPreview)
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: Container(
                  color: Colors.black.withOpacity(0.3), // semi-transparent dim
                ),
              ),
            ),
        ],
      ),
    ),

    // Preview wallpaper button (hidden when preview is active)
    if (!showPreview && !isSmallScreen)
      PreviewWallpaper(
        onPreviewPressed: _showPreview,
        showPreview: showPreview,
        onSetWallpaperPressed: () {},
        onSavePressed: () {},
        title: 'Wallpaper Title',
        imagePath: 'assets/images/Nature.svg',
        tags: ['nature', 'landscape'],
      ),

    // Wallpaper setup modal (shown when preview is active)
    if (showPreview && !isSmallScreen)
      Center(
        child: WallpaperSetup(
          onClose: _hidePreview,
          showPreview: showPreview,
        ),
      ),
  ],
),

        ),
      ),
    );
  }




  Widget _Nature (BuildContext context){
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
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
        onPressed: () {
          _onIconPressed(1);
          if (MediaQuery.of(context).size.width < 800) {
      showCustomDialog(context);
    }
        } ,
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
      SizedBox(height: 20,),
        WallpaperCategory(
          
        )
      // Expanded(child: WallpaperCategory(),),
      // WallpaperCategory(),
          ],
      ),
    );
  }
void showCustomDialog(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth >= 800) return;

  bool isComponentVisible = false; // Local state for toggle

  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      final screenHeight = MediaQuery.of(context).size.height;

      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.only(
              top: 50,
              left: 20,
              right: 20,
              bottom: 20,
            ),
            child: Container(
              width: 400,
              // Use max 80% of screen height to avoid overflow
              constraints: BoxConstraints(
                maxHeight: screenHeight * 0.8,
              ),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // First component
                    if (!isComponentVisible)
                      MobilePreviewWallpaper(
                        onSetWallpaperPressed: () {
                          setState(() {
                            isComponentVisible = true;
                          });
                        },
                        onSavePressed: () {},
                        imagePath: 'assets/images/phoneholder.png',
                        title: 'Nature 1',
                        tags: ['Nature', 'Ambiance', 'Flowers'],
                      ),

                    // Second component
                    if (isComponentVisible)
                      MobileWallpapersetup(
                        onClose:() {
                          setState(() {
                            isComponentVisible = false;
                          });
                        },
                        )
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}




//   void showCustomDialog(BuildContext context) {
//      final screenWidth = MediaQuery.of(context).size.width;
//   if (screenWidth >= 800) return;
//   showDialog(
//     context: context,
//     barrierDismissible: true, 
//     builder: (BuildContext context) {
//       return Dialog(
//         backgroundColor: Colors.transparent, 
//         insetPadding: const EdgeInsets.only(
//           top: 115, 
//           left: 20, 
//           right: 20,
//           bottom: 20, 
//         ),
//         child: Container(
//           width: 400,
//           height: 1231.9947509765625,
//           padding: const EdgeInsets.all(40),
//           decoration: BoxDecoration(
//             color: const Color(0xFFFFFFFF), 
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: MobilePreviewWallpaper(
//             onSetWallpaperPressed: toggleComponentVisibility,
//              onSavePressed: (){},
//               imagePath: 'assets/images/phoneholder.png',
//   title: 'Nature 1',
//   tags: ['Nature', 'Ambiance', 'Flowers'],
//                 ),
//         ),
//       );
//     },
//   );
// }



void showAWallpaperSettingsDialog(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth < 800) return; // Only show for desktop/computer screens

  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 100,
          vertical: 80,
        ),
        child: Container(
          width: 600,  // wider for desktop
          height: 800, // adjust as needed
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text('hii'),
        ),
      );
    },
  );
}

}