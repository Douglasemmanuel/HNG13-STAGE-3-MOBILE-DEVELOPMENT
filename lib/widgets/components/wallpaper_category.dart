import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallpapper_studio_app/provider/favourites_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpapper_studio_app/data/wallpaper_dart.dart';

class WallpaperCategory extends ConsumerWidget {

  const WallpaperCategory({super.key });

  @override
  Widget build(BuildContext context ,WidgetRef ref) {
 final favorites = ref.watch(favoritesProvider);
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: wallpapers.length,
      shrinkWrap: true, // crucial for nested scrollables
      physics: const NeverScrollableScrollPhysics(), 
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // number of columns in the grid
        crossAxisSpacing: 16, // horizontal spacing
        mainAxisSpacing: 16, // vertical spacing
        childAspectRatio: 0.7, // adjust for image height vs width
      ),
      itemBuilder: (context, index) {
        final wallpaper = wallpapers[index];
          final isFav = favorites.any((w) => w.imagePath == wallpaper.imagePath);
        return GestureDetector(
           onTap: () {},
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Wallpaper image
                Image.asset(
                  wallpaper.imagePath,
                  fit: BoxFit.cover,
                ),
                // Overlay content
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            ref
                                .read(favoritesProvider.notifier)
                                .toggleFavorite(wallpaper);
                          },
                          child: SvgPicture.asset(
                             isFav ?
          
                            'assets/images/liked.svg'
                            :
                            'assets/images/unliked.svg',
                            height: 40,
                            width: 40,
                          ),
                        ),
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
                      SizedBox(
                        width: 72,
                        height: 25,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black45,
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            wallpaper.buttonTitle,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
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