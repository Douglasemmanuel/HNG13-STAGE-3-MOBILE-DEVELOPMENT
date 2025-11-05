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
    return Container(
      width: 569,
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 30),
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
              SizedBox(width: 4), 
             Text(
  header,
  style: GoogleFonts.poppins(
    fontSize: 20,                 
    fontWeight: FontWeight.w500,   
    height: 1.0,                   
    letterSpacing: 0.0,          
  ),
),
             SizedBox(height: 8), // gap
            SizedBox(
  width: 200, // set the desired width
  child: Text(
    title,
    style: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 1.0,
      letterSpacing: 0.0,
      color: const Color(0xFF9C9C9C),
    ),
    softWrap: true, // allow wrapping
  ),
)


            ],
          ),
            SizedBox(
      width: 144,
      height: 44,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        decoration: BoxDecoration(
          color: const Color(0xFFC8FFBD), // background: #C8FFBD
          borderRadius: BorderRadius.circular(38), // curved edges
        ),
        child: Center(
         child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/images/greenbox.svg', // fixed icon path
            width: 20,
            height: 20,
          ),
          const SizedBox(width: 8), // spacing between icon and text
          const Text(
            'Activate', // fixed text
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
        ),
      ),
            ),
        
        ],
      ),
    );
  }
}
