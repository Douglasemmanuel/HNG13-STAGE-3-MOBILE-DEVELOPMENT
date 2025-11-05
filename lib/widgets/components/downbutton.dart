import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonRow extends StatelessWidget {
  final String firstButtonText;
  final String secondButtonText;
  final VoidCallback onFirstPressed;
  final VoidCallback onSecondPressed;
  final bool reverseOrder; // to control which button comes first

  const CustomButtonRow({
    Key? key,
    required this.firstButtonText,
    required this.secondButtonText,
    required this.onFirstPressed,
    required this.onSecondPressed,
    this.reverseOrder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    // Define the two styled buttons
    final firstButton = SizedBox(
      width: 200,
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(21),
          ),
          backgroundColor: const Color(0xFFF8F8F8),
          side: const BorderSide(
            color: Colors.black,
            width: 0.1,
          ),
        ),
        onPressed: onFirstPressed,
        child: Text(
          firstButtonText,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 1.0,
            color: Colors.black,
          ),
        ),
      ),
    );

    final secondButton = SizedBox(
      width: 200,
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(21),
          ),
          backgroundColor: const Color(0xFFFBB03B),
        ),
        onPressed: onSecondPressed,
        child: Text(
          secondButtonText,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 1.0,
            color: Colors.white,
          ),
        ),
      ),
    );

    // Arrange buttons based on order
    final buttonList = reverseOrder
        ? [secondButton, sizedGap(isSmallScreen), firstButton]
        : [firstButton, sizedGap(isSmallScreen), secondButton];

    // Show Row or Column depending on screen size
    return isSmallScreen
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: buttonList,
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: buttonList,
          );
  }

  // Responsive spacing
  Widget sizedGap(bool isSmallScreen) =>
      SizedBox(height: isSmallScreen ? 10 : 0, width: isSmallScreen ? 0 : 10);
}
