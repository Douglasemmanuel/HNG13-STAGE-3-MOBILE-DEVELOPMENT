import 'package:flutter/material.dart';
import 'package:wallpapper_studio_app/widgets/components/custom_container.dart';
import 'package:wallpapper_studio_app/widgets/components/radio_button.dart';
import 'package:wallpapper_studio_app/widgets/components/downbutton.dart' ;
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpapper_studio_app/widgets/components/swtich_container.dart';
class WallpaperSetup extends StatefulWidget {
  final VoidCallback onClose;
   final bool showPreview;
  const WallpaperSetup({super.key, required this.onClose , required this.showPreview});

  @override
  State<WallpaperSetup> createState() => _WallpaperSetupState();
}

class _WallpaperSetupState extends State<WallpaperSetup> {
   int? selectedValue; // default = none selected

  void _onRadioChanged(int? value) {
    setState(() {
      // 👇 toggle selection
      if (selectedValue == value) {
        selectedValue = null; // unselect if already selected
      } else {
        selectedValue = value;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Container(
        color: Colors.white,
        //  width: widget.showPreview ? screenWidth * 0.4 : 0,
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 10 , horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
        'Wallpaper Setup',
        style: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.w500, // Medium weight
          height: 1.0, // line-height 100%
          letterSpacing: 0.0,
          color: Colors.black, // you can change this if needed
        ),
      ),
      SizedBox(height: 10.0,),
       Text(
        ' Configure your wallpaper settings and enable auto-rotation',
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w400, // Medium weight
          height: 1.0, // line-height 100%
          letterSpacing: 0.0,
          color: Colors.black, // you can change this if needed
        ),
      ),
      SizedBox(height: 10.0,),
      CustomContainerRow(
        header: "Activate Wallpaper",
        title: "Set the selected wallpaper as your desktop background",
        buttonText: "Set Now",
        onPressed: () {
      print("Button pressed");
        },
      ),
      SizedBox(height: 10,),
      Text(
        'Display mode',
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w400, 
          height: 1.0, 
          letterSpacing: 0.0,
          color: Colors.black,
        ),
      ),
      SizedBox(height: 5,),
      RadioContainerExample(header: 'Fit', title: 'Scale to fit without cropping', value: 1, selectedValue: selectedValue, onChanged: _onRadioChanged),
      SizedBox(height: 4,),
       RadioContainerExample(header: 'Fill', title: 'Scale to fill the entire screen', value: 2, selectedValue: selectedValue, onChanged: _onRadioChanged),
      SizedBox(height: 4,),
       RadioContainerExample(header: 'Search', title: 'Stretch to fill the screen', value: 3, selectedValue: selectedValue, onChanged: _onRadioChanged),
      SizedBox(height: 4,),
       RadioContainerExample(header: 'Tile', title: 'Repeat the image to fill the screen', value: 4, selectedValue: selectedValue, onChanged: _onRadioChanged),
      SizedBox(height: 5,),
      SwitchContainerExample(),
      SizedBox(height: 25,),
      Text(
        'Advanced Settings',
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w400, 
          height: 1.0, 
          letterSpacing: 0.0,
          color: Colors.black,
        ),
      ),
      SizedBox(height: 5,),
       RadioContainerExample(header: 'Lock Wallpaper', title: 'Prevent accidental changes', value: 5, selectedValue: selectedValue, onChanged: _onRadioChanged),
      SizedBox(height: 4,),
       RadioContainerExample(header: 'Sync Across Devices', title: 'Keep wallpaper consistent on all devices', value: 6, selectedValue: selectedValue, onChanged: _onRadioChanged),
            SizedBox(height: 14,),
          Positioned(
              bottom: 20,
        left: 20,
        right: 20,
            child: 
               CustomButtonRow(firstButtonText: 'Cancel', secondButtonText: 'save Setings', onFirstPressed:widget.onClose, onSecondPressed:widget.onClose)
            
          ),
            ],
          ),
          ),
      ),
    );
  }
}