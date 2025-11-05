import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpapper_studio_app/widgets/components/button.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  final List<dynamic> categoryList = const [
    {
      'title':'Nature',
      'subtitle':'Mountain, Forest and Landscapes',
      'image':'assets/images/nature.jpg',
      'wallpaperCount': '3 Wallpapers',
    },
    {
      'title':'Abstract',
      'subtitle':'Modern Geometric and artistic designs',
      'image':'assets/images/abstract.jpg',
      'wallpaperCount': '4 Wallpapers',
    },
    {
      'title':'Urban',
      'subtitle':'Cities, architecture and street',
      'image':'assets/images/urban.jpg',
      'wallpaperCount': '6 Wallpapers',
    },
    {
      'title':'Space',
      'subtitle':'Cosmos, Planets, and galaxies',
      'image':'assets/images/space.jpg',
      'wallpaperCount': '3 Wallpapers',
    },
    {
      'title':'Minimalist',
      'subtitle':'Clean, Simple and elegant',
      'image':'assets/images/minimalist.jpg',
      'wallpaperCount': '6 Wallpapers',
    },
    {
      'title':'Animal',
      'subtitle':'Wildlife and nature Photography',
      'image':'assets/images/animal.jpg',
      'wallpaperCount': '4 Wallpapers',
    },
  ];

  @override


  Widget build(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;

  int crossAxisCount = 3; 
  double containerWidth = 435; 
  if (screenWidth < 600) {
    crossAxisCount = 1;
    containerWidth = 400;   
  } else if (screenWidth < 1024) {
    crossAxisCount = 2; 
  }
    return GridView.builder(
      itemCount: categoryList.length,
      shrinkWrap: true, 
      physics: const NeverScrollableScrollPhysics(), 
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 435 / 290, 
      ),
      itemBuilder: (context, index) {
        final category = categoryList[index];
        return Container(
          width: containerWidth,
          height: 290,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(category['image']),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(), 
                Text(
                  category['title'],
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    category['subtitle'],
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
                Button(
          theWidth: 110.0,

          theHeight: 26.0,
          theChild: Text(
                        category['wallpaperCount'],
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
      },
    );
  }

}
