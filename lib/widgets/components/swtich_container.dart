import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SwitchContainerExample extends StatefulWidget {
  const SwitchContainerExample({Key? key}) : super(key: key);

  @override
  _SwitchContainerExampleState createState() => _SwitchContainerExampleState();
}

class _SwitchContainerExampleState extends State<SwitchContainerExample> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive font sizes
    final headerFontSize = screenWidth < 800 ? 14.0 : 16.0;
    final titleFontSize = screenWidth < 800 ? 12.0 : 14.0;

    // Responsive spacing between text and switch
    final switchSpacing = screenWidth < 800 ? 8.0 : 20.0;

    return Container(
      width: screenWidth < 800 ? screenWidth * 0.9 : 569,
      height: 92,
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey,
          width: 0.1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Head + Title Text Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Auto - Rotation",
                  style: GoogleFonts.poppins(
                    fontSize: headerFontSize,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Automatically change your wallpaper at regular intervals",
                  style: GoogleFonts.poppins(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  softWrap: true,
                ),
              ],
            ),
          ),

          SizedBox(width: switchSpacing),

          // Switch Button
          Switch(
            value: isSwitched,
            activeColor: Colors.white,
            activeTrackColor: const Color(0xFFFBB03B),
            inactiveThumbColor: Colors.grey,
            inactiveTrackColor: Colors.grey.shade300,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
