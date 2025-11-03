import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Active extends StatelessWidget {
  const Active({super.key});

  @override
 Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallScreen = constraints.maxWidth <= 500;
        double screenWidth = MediaQuery.of(context).size.width;
        double fontSize;

        if (screenWidth >= 500) {
          fontSize = 14; 
        } else {
          fontSize = 16; 
    }
       
        return Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(43),
            side: const BorderSide(
              color: Colors.black12,
              width: 1,
            ),
          ),
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(
              maxWidth: 1406,
              minHeight: 250,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🖼 Left Image
                    Container(
                      width: 117.77,
                      height: 210.33,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(26),
                        child: Image.asset(
                          'assets/images/nature1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                  SizedBox(
                        width: MediaQuery.of(context).size.width < 500 ? 6 : 20,
                      ),



                    // 📄 Main Content
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/active.png',
                              height: 36,
                              width: 392,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 7),
                            Text(
                              'This wallpaper is currently set as your active background',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: const Color(0xFF808080),
                              ),
                            ),
                            const SizedBox(height: 16),

                            // 🏷 Category and Selection
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Category',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: fontSize,
                                        color: const Color(0xFF808080),
                                      ),
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width < 400 ? 1: 4),
                                    Text(
                                      '-',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width < 400 ? 1: 4),
                                    Text(
                                      'Nature',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: fontSize,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      'Selection',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: fontSize,
                                        color: const Color(0xFF808080),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '-',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      'Wallpaper 5',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: fontSize,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),

                                // 📱 Icons under Selection on small screens
                                if (isSmallScreen) ...[
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      _buildIconButton(Icons.download),
                                      const SizedBox(width: 8),
                                      _buildIconButton(Icons.copy),
                                    ],
                                  ),
                                ],
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // 🖥 Icons in bottom-right for large screens
                if (!isSmallScreen)
                  Positioned(
                    bottom: 50,
                    // top:5,
                    right: 20,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildIconButton(Icons.file_upload_outlined),
                        const SizedBox(width: 8),
                        _buildIconButton(Icons.settings_outlined),
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
 Widget _buildIconButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0x1A7C7C7C),
        border: Border.all(
          color: const Color(0xFFE5E5E5),
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        icon,
        color: Colors.black87,
        size: 20,
      ),
    );
  }
}