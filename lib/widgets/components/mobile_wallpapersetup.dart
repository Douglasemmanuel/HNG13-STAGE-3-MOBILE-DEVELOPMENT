import 'package:flutter/material.dart';
import 'package:wallpapper_studio_app/widgets/components/custom_apbar.dart';
import 'package:wallpapper_studio_app/widgets/components/custom_container.dart';
import 'package:wallpapper_studio_app/widgets/components/radio_button.dart';
import 'package:wallpapper_studio_app/widgets/components/downbutton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpapper_studio_app/widgets/components/swtich_container.dart';

class MobileWallpapersetup extends StatefulWidget {
  final VoidCallback onClose;

  const MobileWallpapersetup({super.key, required this.onClose});

  @override
  State<MobileWallpapersetup> createState() => _MobileWallpapersetupState();
}

class _MobileWallpapersetupState extends State<MobileWallpapersetup> {
  int? selectedValue; // default = none selected

  void _onRadioChanged(int? value) {
    setState(() {
      if (selectedValue == value) {
        selectedValue = null; // unselect if already selected
      } else {
        selectedValue = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // so it doesn't try to fill the screen
        children: [
          Text(
            'Wallpaper Setup',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              height: 1.0,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Configure your wallpaper settings and enable auto-rotation',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.0,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          CustomContainerRow(
            header: "Activate Wallpaper",
            title: "Set the selected wallpaper as your desktop background",
            buttonText: "Set Now",
            onPressed: () {
              print("Button pressed");
            },
          ),
          const SizedBox(height: 10),
          Text(
            'Display mode',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              height: 1.0,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          RadioContainerExample(
            header: 'Fit',
            title: 'Scale to fit without cropping',
            value: 1,
            selectedValue: selectedValue,
            onChanged: _onRadioChanged,
          ),
          const SizedBox(height: 4),
          RadioContainerExample(
            header: 'Fill',
            title: 'Scale to fill the entire screen',
            value: 2,
            selectedValue: selectedValue,
            onChanged: _onRadioChanged,
          ),
          const SizedBox(height: 4),
          RadioContainerExample(
            header: 'Stretch',
            title: 'Stretch to fill the screen',
            value: 3,
            selectedValue: selectedValue,
            onChanged: _onRadioChanged,
          ),
          const SizedBox(height: 4),
          RadioContainerExample(
            header: 'Tile',
            title: 'Repeat the image to fill the screen',
            value: 4,
            selectedValue: selectedValue,
            onChanged: _onRadioChanged,
          ),
          const SizedBox(height: 5),
          SwitchContainerExample(),
          const SizedBox(height: 25),
          Text(
            'Advanced Settings',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              height: 1.0,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          RadioContainerExample(
            header: 'Lock Wallpaper',
            title: 'Prevent accidental changes',
            value: 5,
            selectedValue: selectedValue,
            onChanged: _onRadioChanged,
          ),
          const SizedBox(height: 4),
          RadioContainerExample(
            header: 'Sync Across Devices',
            title: 'Keep wallpaper consistent on all devices',
            value: 6,
            selectedValue: selectedValue,
            onChanged: _onRadioChanged,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButtonRow(
                firstButtonText: 'Cancel',
                secondButtonText: 'Save Settings',
                onFirstPressed: widget.onClose,
                onSecondPressed: widget.onClose,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
