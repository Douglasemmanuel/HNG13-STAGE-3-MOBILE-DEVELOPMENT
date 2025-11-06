import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomContainerRow extends StatelessWidget {
  final String header;
  final String title;
  final String buttonText;
  final VoidCallback onPressed;

  const CustomContainerRow({
    super.key,
    required this.header,
    required this.title,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive sizes
    final containerWidth = screenWidth < 800 ? screenWidth * 0.9 : 569.0;
    final titleFontSize = screenWidth < 800 ? 12.0 : 14.0;
    final headerFontSize = screenWidth < 800 ? 18.0 : 20.0;
    final buttonFontSize = screenWidth < 800 ? 12.0 : 14.0;
    final textWidth = screenWidth < 800 ? screenWidth * 0.4 : 200.0;
    final buttonWidth = screenWidth < 800 ? 80.0 : 144.0;
    final buttonHeight = screenWidth < 800 ? 40.0 : 44.0;

    return Container(
      width: containerWidth,
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey,
          width: 0.1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left side texts
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                header,
                style: GoogleFonts.poppins(
                  fontSize: headerFontSize,
                  fontWeight: FontWeight.w500,
                  height: 1.0,
                  letterSpacing: 0.0,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: textWidth,
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w500,
                    height: 1.0,
                    letterSpacing: 0.0,
                    color: const Color(0xFF9C9C9C),
                  ),
                  softWrap: true,
                ),
              ),
            ],
          ),

          // Button
          if(screenWidth > 800) 
          SizedBox(
            width: buttonWidth,
            height: buttonHeight,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFC8FFBD),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(38),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                elevation: 0,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/images/greenbox.svg',
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    buttonText,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: buttonFontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
