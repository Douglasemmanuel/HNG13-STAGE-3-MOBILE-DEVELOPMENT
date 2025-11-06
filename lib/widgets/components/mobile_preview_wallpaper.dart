import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MobilePreviewWallpaper extends StatelessWidget {
  final VoidCallback onSetWallpaperPressed;
  final VoidCallback onSavePressed;
  final String imagePath;
  final String title;
  final List<String> tags;

  const MobilePreviewWallpaper({
    super.key,
    required this.onSetWallpaperPressed,
    required this.onSavePressed,
    required this.imagePath,
    required this.title,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Wallpaper Image
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Preview',
              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                height: 1.0,
                letterSpacing: 0.0,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              ' Name',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.0,
                letterSpacing: 0.0,
                color: Color(0xFF808080),
              ),
            ),
            const SizedBox(height: 10),
            // Wallpaper Title
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Tags',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 1.0,
                letterSpacing: 0.0,
                color: Color(0xFF808080),
              ),
            ),
            const SizedBox(height: 4),
            // Tags
            Wrap(
  spacing: 8,
  runSpacing: 4,
  children: tags.map(
    (tag) => Container(
      decoration: BoxDecoration(
        color: const Color(0x33BFBFBF),
        borderRadius: BorderRadius.circular(24), // rounded corners
        border: Border.all(
          color: Colors.black.withOpacity(0.3), // subtle black border
          width: 0.1,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Text(
        tag,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  ).toList(),
),

            const SizedBox(height: 20),
            // Description
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.0,
                    letterSpacing: 0.0,
                    color: Color(0xFF808080),
                  ),
                ),
                const SizedBox(height: 10),
                Opacity(
                  opacity: 1.0,
                  child: SizedBox(
                    width: 280.807,
                    height: 126,
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF000000),
                            Color(0xFFFFFFFF),
                          ],
                          stops: [0.0, 1.25],
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.srcIn,
                      child: Text(
                        'Discover the pure beauty of "Natural Essence" – your gateway to authentic, nature-inspired experiences. '
                        'Let this unique collection elevate your senses and connect you with the unrefined elegance of the natural world. '
                        'Embrace "Natural Essence" for a truly organic transformation in your daily life.',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 1.0,
                          letterSpacing: 0.0,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Icons Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    for (var icon in ['downf', 'max', 'gearbox'])
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: Container(
                            padding: const EdgeInsets.all(6.53),
                            decoration: BoxDecoration(
                              color: const Color(0x1A7C7C7C),
                              borderRadius: BorderRadius.circular(11),
                              border: Border.all(
                                color: const Color(0xFFE5E5E5),
                                width: 0.5,
                              ),
                            ),
                            child: SvgPicture.asset(
                              'assets/images/$icon.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
            // Buttons
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color(0xFFF8F8F8),
                    side: const BorderSide(color: Colors.black, width: 0.6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(21),
                    ),
                  ),
                  onPressed: onSavePressed,
                  child: Text(
                    'Save to Favourites',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color(0xFFFBB03B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(21),
                    ),
                  ),
                  onPressed: onSetWallpaperPressed,
                  child: Text(
                    'Set to Wallpaper',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
