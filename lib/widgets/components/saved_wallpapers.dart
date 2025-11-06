
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpapper_studio_app/provider/favourites_provider.dart';
import 'package:wallpapper_studio_app/widgets/components/button.dart';

class SavedWallpapers extends ConsumerWidget {
  const SavedWallpapers({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider);

    final screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = 6;
    double containerWidth = 190;

    if (screenWidth < 600) {
      crossAxisCount = 2;
      containerWidth = 190;
    } else if (screenWidth < 1024) {
      crossAxisCount = 4;
    }

    // Show empty message if there are no saved wallpapers
    if (favorites.isEmpty) {
      return Center(
        child: Text(
          "No saved wallpapers yet!",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600],
          ),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        final wallpaper = favorites[index];

        return Container(
          width: containerWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(wallpaper.imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Favorite icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        ref
                            .read(favoritesProvider.notifier)
                            .toggleFavorite(wallpaper);
                      },
                      child: SvgPicture.asset(
                        'assets/images/liked.svg',
                        height: 40,
                        width: 40,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                // Wallpaper title
                Text(
                  wallpaper.title,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 5),

                // Button
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
      },
    );
  }
}
