import 'package:flutter/material.dart';
import 'package:wallpapper_studio_app/utils/route_generator.dart';
import 'package:google_fonts/google_fonts.dart';

final List<Map<String, dynamic>> navbarItems = [
  {
    'icon': Icons.home_outlined,
    'title': 'Home',
    'link': RouteGenerator.home,
  },
  {
    'icon': Icons.grid_on_outlined,
    'title': 'Browse',
    'link': RouteGenerator.browse,
  },
  {
    'icon': Icons.favorite_outline,
    'title': 'Favorites',
    'link': RouteGenerator.favourites,
  },
  {
    'icon': Icons.settings_outlined,
    'title': 'Settings',
    'link': RouteGenerator.setting,
  },
];
class NavbarDrawer extends StatefulWidget {
  const NavbarDrawer({super.key});

  @override
  State<NavbarDrawer> createState() => _NavbarDrawerState();
}

class _NavbarDrawerState extends State<NavbarDrawer> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image at the top
            SizedBox(
              width: screenWidth * 0.5,
              child: Image.asset(
        'assets/images/logo.png',
        height: 61,
        width: 185,
        fit: BoxFit.contain,
      ),
            ),
            const SizedBox(height: 20), 

            // Navigation items
            ...navbarItems.asMap().entries.map((entry) {
              int index = entry.key;
              var item = entry.value;
              bool isSelected = _selectedIndex == index;

              return InkWell(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, item['link']);
                },
                child: SizedBox(
                  width: 330,
                  height: 60,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.grey.withOpacity(0.2)
                          : null,
                      border: const Border(
                        bottom: BorderSide(width: 0.5, color: Colors.grey),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          item['icon'],
                          size: 28,
                          color: isSelected ? Colors.black : Colors.black87,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          item['title'],
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: isSelected ? Colors.black : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

