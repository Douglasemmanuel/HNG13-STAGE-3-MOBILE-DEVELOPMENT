import 'package:flutter/material.dart';
import 'package:wallpapper_studio_app/widgets/components/button.dart' ;
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SavedWallpapers extends StatefulWidget {
  const SavedWallpapers({super.key});

  @override
  State<SavedWallpapers> createState() => _SavedWallpapersState();
}

class _SavedWallpapersState extends State<SavedWallpapers> {
  @override
  Widget build(BuildContext context) {
      final screenWidth = MediaQuery.of(context).size.width;

  int crossAxisCount = 6; 
  double containerWidth = 190; 
  if (screenWidth < 600) {
    crossAxisCount = 2; 
    containerWidth = 190;  
  } else if (screenWidth < 1024) {
    crossAxisCount = 4; 
  }
    return Container(
      width: containerWidth,
          height: 290,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage('assets/images/nature1.jpg'),
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
    SvgPicture.asset(
      'assets/images/liked.svg',
      height: 40,
      width: 40,
      fit: BoxFit.contain,
    ),
  ],
),
                const Spacer(), 
                Text(
                  'Nature 1',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox( height: 5) ,
                 Button(
          theWidth: 72.0,
          theHeight: 25.0,
          theChild: Text(
                        'Nature',
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
  }
}