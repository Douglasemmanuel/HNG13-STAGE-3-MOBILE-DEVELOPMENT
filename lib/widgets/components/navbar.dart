


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpapper_studio_app/data/navbar_data.dart';
import 'package:wallpapper_studio_app/provider/navbar_provider.dart' ;

class Navbar extends ConsumerWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get active index from provider
    final activeIndex = ref.watch(navbarIndexProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: navbarItems.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        final isSelected = index == activeIndex;

        return Padding(
          padding: const EdgeInsets.only(right: 16),
          child: InkWell(
            onTap: () {
              // Update provider value
              ref.read(navbarIndexProvider.notifier).state = index;

              // Navigate to target route
              final targetRoute = item.link;
              final currentRoute = ModalRoute.of(context)?.settings.name;
              if (targetRoute != currentRoute) {
                Navigator.pushNamed(context, targetRoute);
              }
            },
            borderRadius: BorderRadius.circular(12),
            splashColor: Colors.amber.withOpacity(0.2),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color:
                    isSelected ? Color(0xFFF5F5F5) : Colors.transparent,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: isSelected ? Color(0xFFF5F5F5) : Colors.transparent,
                  width: 2,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    item.icon,
                    size: 28,
                    color:
                        isSelected ? Color(0xFF000000): Colors.black54,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    item.title,
                    style: GoogleFonts.poppins(
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w400,
                      fontSize: 14,
                      color:
                          isSelected ? Color(0xFF000000): Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
