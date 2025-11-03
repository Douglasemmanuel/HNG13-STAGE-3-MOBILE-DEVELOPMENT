import 'package:flutter/material.dart';
import 'package:wallpapper_studio_app/widgets/components/button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpapper_studio_app/data/wallpaper_dart.dart';

class WallpaperCategory extends StatefulWidget {
  const WallpaperCategory({super.key});

  @override
  State<WallpaperCategory> createState() => _WallpaperCategoryState();
}

class _WallpaperCategoryState extends State<WallpaperCategory> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount = 6;
    if (screenWidth < 600) {
      crossAxisCount = 2;
    } else if (screenWidth < 1024) {
      crossAxisCount = 4;
    }

    return GridView.count(
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: wallpapers.map((wallpaper) {
        return Container(
          width: 190,
          height: 290,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(wallpaper.imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // SvgPicture.asset(
                    //   'assets/images/liked.svg',
                    //   height: 40,
                    //   width: 40,
                    //   fit: BoxFit.contain,
                    // ),
                    SvgPicture.asset(
                      'assets/images/unliked.svg',
                      height: 40,
                      width: 40,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  wallpaper.title,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Button(
                  theWidth: 72.0,
                  theHeight: 25.0,
                  theChild: Text(
                    wallpaper.buttonTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
