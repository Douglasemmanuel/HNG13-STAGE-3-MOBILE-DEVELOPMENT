import 'package:flutter/material.dart';
import 'package:wallpapper_studio_app/utils/route_generator.dart';
import 'package:wallpapper_studio_app/widgets/components/navbar.dart';
import 'package:wallpapper_studio_app/widgets/components/navbar_drawer.dart';
import 'package:google_fonts/google_fonts.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
   bool isSwitched = false;
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 800;
    return Scaffold(
      endDrawer: isSmallScreen ? const NavbarDrawer() : null,
     appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: Colors.grey, 
                width: 1,           
              ),
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent, 
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteGenerator.initial); 
                  },
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 61,
                    width: 185,
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(width: 20),
                if (!isSmallScreen) const Navbar(),
              ],
            ),
            actions: [
              if (isSmallScreen)
                Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.menu, size: 32, color: Colors.black),
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Column(
  crossAxisAlignment: CrossAxisAlignment.start, 
  children: [
    SizedBox(
      // width: 60, 
      child: Image.asset(
        'assets/images/Settingsheader.png',
        height: 60,
        fit: BoxFit.contain,
      ),
    ),
    const SizedBox(height: 15),
    ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 870),
      child: Text(
        'Customize your Wallpaper Studio experience',
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: 24,
          color: Color(0xFF575757),
        ),
      ),
    ),
  ],
),
              ),
              _buildContainer(context),
              SizedBox(height: 30), 

            ],
          ),
          ),
        ),
    );
  }

Widget _buildContainer(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;

  return Positioned(
    top: 150.63,
    left: 47,
    child: Transform.rotate(
      angle: 0, 
      child: Opacity(
        opacity: 1, 
        child: Container(
          width: screenWidth < 800 ? 399 : 1346,
          height:  screenWidth < 800 ? 1078 :782, 
          padding: EdgeInsets.symmetric(horizontal:  screenWidth < 800 ? 15:20 , vertical:  screenWidth < 800 ? 15:50),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: screenWidth < 800
              ? Column(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Wallpapper Setup',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'Configure your wallpaper settings and enable auto-rotation',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 30),
        Opacity(
          opacity: 1,
          child: Container(
            width: 569,
            height: 114,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFFE5E5E5),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Image Quality',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  width: 569,
                  height: 36,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: const Color(0xFFE5E5E5),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'High ( Best Quality )',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: const Color(0xFF9C9C9C),
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        size: 24,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 25),
        Opacity(
          opacity: 1,
          child: Container(
            width: 359,
            height: 100,
            padding:  EdgeInsets.symmetric(horizontal: 3 , vertical: 3) ,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFFE5E5E5),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 4, 4, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Notifications',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      Transform.scale(
                        scale: 0.7,
                        child: Switch(
                          value: isSwitched,
                          onChanged: (bool value) {
                            setState(() {
                              isSwitched = value;
                            });
                          },
                          activeColor: Colors.white,
                          activeTrackColor: const Color(0xFFFBB03B),
                          inactiveThumbColor: Colors.grey,
                          inactiveTrackColor: Colors.grey.shade300,
                        ),
                      ),
                    ],
                  ),
                ),
                // const SizedBox(height: 0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    'Get notified about new wallpapers and updates',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: const Color(0xFF9C9C9C),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
         const SizedBox(height: 30), 
        Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
  
    Opacity(
      opacity: 1,
      child: Container(
        width: 359,
        height: 50,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFFF8F8F8), 
          borderRadius: BorderRadius.circular(21),
          border: Border.all(
            color: const Color(0xFFE5E5E5),
            width: 1,
          ),
        ),
        child: TextButton(
          onPressed: () {
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
      ),
    ),
    const SizedBox(height: 10), 
    Opacity(
      opacity: 1,
      child: Container(
        width: 359,
        height: 50,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFFFFB03B), 
          borderRadius: BorderRadius.circular(21),
          border: Border.all(
            color: const Color(0xFFE5E5E5),
            width: 1,
          ),
        ),
        child: TextButton(
          onPressed: () {
            // Action for Save Settings
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          child: const Text(
            'Save Settings',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    ),
  ],
)

      ],
    ),
    const SizedBox(height: 30),
    SizedBox(
      width: 258.04,
      height: 524,
      child: Image.asset(
        'assets/images/settingphone.png',
        fit: BoxFit.contain,
      ),
    ),
  ],
)

              : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Wallpapper Setup',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 5), 
                        Text(
                          ' Configure your wallpaper settings and enable auto-rotation',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                         SizedBox(height: 5), 
                        Opacity(
      opacity: 1, 
      child: Container(
        width: 569,
        height: 114,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white, 
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFFE5E5E5), 
            width: 1, 
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
              Text(
                      ' Image Quality',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Container(
        width: 569,
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white, 
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: const Color(0xFFE5E5E5), 
            width: 1, 
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
                 Text(
                      'High ( Best Quality )',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xFF9C9C9C),
                          ),
                        ),
                         Icon(
                            Icons.keyboard_arrow_down,
                            size: 24,
                            color: Colors.black,
                          ),
        ],
        ),
                        ),
          ],
          ), 
      ),
    ),
    SizedBox(height: 25,),
      Opacity(
      opacity: 1, 
      child: Container(
        width: 569,
        height: 92,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white, 
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFFE5E5E5), 
            width: 1, 
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
           Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                   Text(
                      'Notifications',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                  Transform.scale(
  scale: 0.7,
  child: Switch(
    value: isSwitched,
    onChanged: (bool value) {
      setState(() {
        isSwitched = value;
      });
    },
    activeColor: Colors.white,
    activeTrackColor: const Color(0xFFFBB03B),
    inactiveThumbColor: Colors.grey,
    inactiveTrackColor: Colors.grey.shade300,
  ),
)

            ],
           ),
                        // SizedBox(height: 15),
                      Text(
                      'Get notified about new wallpapers and updates',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xFF9C9C9C),
                          ),
                        ),
          ],
          ), 
          
      ),
    ),
    const SizedBox(height: 30), 
    Row(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
    Opacity(
      opacity: 1,
      child: Container(
        width: 200,
        height: 50,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFFF8F8F8), 
          borderRadius: BorderRadius.circular(21),
          border: Border.all(
            color: const Color(0xFFE5E5E5),
            width: 1,
          ),
        ),
        child: TextButton(
          onPressed: () {
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
      ),
    ),
    const SizedBox(width: 10), 
    Opacity(
      opacity: 1,
      child: Container(
        width: 200,
        height: 50,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFFFFB03B), 
          borderRadius: BorderRadius.circular(21),
          border: Border.all(
            color: const Color(0xFFE5E5E5),
            width: 1,
          ),
        ),
        child: TextButton(
          onPressed: () {
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          child: const Text(
            'Save Settings',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    ),
  ],
)

                      ],
                    ),
                    SizedBox(
                      width: 258.04,
                      height: 525,
                      child: Image.asset(
                        'assets/images/settingphone.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],

                  
                ),
                
        ),
        
      ),
    ),
  );
}
}