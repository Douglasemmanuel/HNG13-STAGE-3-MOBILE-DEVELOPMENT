import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
class PreviewWallpaper extends StatelessWidget {
   final VoidCallback onPreviewPressed;
  const PreviewWallpaper({super.key , required this.onPreviewPressed});

  @override
  Widget build(BuildContext context) {
      final List<String> labels = ['Nature', 'Ambiance', 'Flowers'];
       final List<String> iconPaths = [
    'assets/images/downf.svg',
    'assets/images/max.svg' ,
    'assets/images/gearbox.svg' ,
  ];
   return Positioned(
      top: 141,
      left: 739,
      child: Container(
        width: 661,
        height: 746,
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Color.fromARGB(0, 255, 255, 255),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, 
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                       Text(
                  'Preview',
                  style: GoogleFonts.poppins(
            fontSize: 32,
            fontWeight: FontWeight.w600, 
            height: 1.0,
            letterSpacing: 0.0, 
                  ),
                       ),
                       SizedBox(height: 30.0),
                       Text(
                  ' Name',
                  style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400, 
            height: 1.0,
            letterSpacing: 0.0, 
            color:  Color(0xFF808080),
                  ),
                       ),
                         SizedBox(height: 10.0),
                       Text(
                  'Nature 1',
                  style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w500, 
            height: 1.0,
            letterSpacing: 0.0, 
                  ),
                       ),
             SizedBox(height: 30.0),
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
                         SizedBox(height: 10.0),
                Row(
              children: labels.map((label) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4 , vertical: 4),
                  child: TextButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(72, 40)), // ensures fixed width & height
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 12, vertical: 4), // centers text vertically
              ),
              backgroundColor: MaterialStateProperty.all(
                const Color(0x33BFBFBF),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              overlayColor: WidgetStateProperty.all(
                Colors.black.withOpacity(0.1),
              ),
            ),
            onPressed: () => print('$label pressed'),
            child: Center(
              child: Text(
                label,
                style: const TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
                  ),
                );
              }).toList(),
            ),
             SizedBox(height: 20.0),
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
            color:  Color(0xFF808080),
                  ),
                       ),
                        SizedBox(height: 10.0),
                       Opacity(
                        opacity: 1.0,
                         child: SizedBox(
                            width: 280.807, // fixed width
                                     height: 126, 
                           child: ShaderMask(
                                     shaderCallback: (Rect bounds) {
                                       return const LinearGradient(
                                         begin: Alignment.topCenter,
                                         end: Alignment.bottomCenter,
                                         colors: [
                                           Color(0xFF000000), // black
                                           Color(0xFFFFFFFF), // white
                                         ],
                                         stops: [0.0, 1.25], // mimic 125%
                                       ).createShader(bounds);
                                     },
                                     blendMode: BlendMode.srcIn, // ensures the gradient only fills the text
                                     child: Text(
                                       'Discover the pure beauty of "Natural Essence" – your gateway to authentic, nature-inspired experiences. '
                                       'Let this unique collection elevate your senses and connect you with the unrefined elegance of the natural world. '
                                       'Embrace "Natural Essence" for a truly organic transformation in your daily life.',
                                       style: GoogleFonts.poppins(
                                         fontSize: 14,
                                         fontWeight: FontWeight.w500,
                                         height: 1.0,
                                         letterSpacing: 0.0,
                                         color: Colors.white, // fallback color
                                       ),
                                       textAlign: TextAlign.left,
                                     ),
                           ),
                         ),
                       ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
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
                  'assets/images/downf.svg', 
                  fit: BoxFit.contain,
                ),
                ),
              ),
               SizedBox(width: 10.0),
              SizedBox(
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
                  'assets/images/max.svg', 
                  fit: BoxFit.contain,
                ),
                ),
              ),
               SizedBox(width: 10.0),
              SizedBox(
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
                  'assets/images/gearbox.svg', 
                  fit: BoxFit.contain,
                ),
                ),
              ),
               SizedBox(width: 10.0),
                        ],
                       ),
                  
                        
                ],
                
              ),
                  SizedBox(height: 20.0),
                  
            
                    ],
                  )
                  ),
                Opacity(
                  opacity: 1, // opacity: 1
                  child: Container(
            width: 258.036, // specified width
            height: 524.995, // specified height
            margin: const EdgeInsets.only(bottom: 24.82), // gap equivalent
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                image: AssetImage('assets/images/phoneholder.png'),
                fit: BoxFit.cover,
              ),
            ),
                  ),
                ),
              ],
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
    SizedBox(
      width: 200,
      height: 50,
      
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16), // like IconButton
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(21),
          ),
          backgroundColor: const Color(0xFFF8F8F8),
          side: const BorderSide(
            color: Colors.black, // border color
            width: 0.6, // border width
          ),
        ),
        onPressed: () {
          print('Save to Favourites pressed');
        },
        child: Text(
          'Save to Favourites',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500, // Medium
            height: 1.0, // line-height 100%
            letterSpacing: 0.0,
            color: Colors.black,
          ),
        ),
      ),
    ),
    const SizedBox(width: 10), // spacing between buttons
    SizedBox(
      width: 200,
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(21),
          ),
          backgroundColor: const Color(0xFFFBB03B), // orange
        ),
        onPressed: onPreviewPressed,
        child: Text(
          'Set to Wallpaper',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500, // Medium
            height: 1.0,
            letterSpacing: 0.0,
            color: Colors.white,
          ),
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





