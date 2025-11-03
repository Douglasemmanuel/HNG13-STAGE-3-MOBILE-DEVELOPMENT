import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpapper_studio_app/data/navbar_data.dart';



class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  
 int _selectedIndex = -1;
  @override
  
  Widget build(BuildContext context) {
    return Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      // Image.asset(
      //   'assets/images/logo.png',
      //   height: 61,
      //   width: 185,
      //   fit: BoxFit.contain,
      // ),
      
      Row(
            mainAxisSize: MainAxisSize.min,
            children: navbarItems.asMap().entries.map((entry) {
              int index = entry.key;
              var item = entry.value;
              bool isSelected = _selectedIndex == index;

              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                    Navigator.pushNamed(context, item.link);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: isSelected
                        ? BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x1A000000),
                                offset: Offset(0, 1),
                                blurRadius: 0,
                                spreadRadius: 0,
                              ),
                            ],
                          )
                        : null,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(item.icon, size: 28, color: Colors.black87),
                        const SizedBox(width: 10),
                        Text(
                          item.title,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
    ],
  ),
);

  }
}