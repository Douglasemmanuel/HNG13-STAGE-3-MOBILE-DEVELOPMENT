import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpapper_studio_app/widgets/components/button.dart' ;

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

class ActiveCategories extends StatelessWidget {
  const ActiveCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // for vertical scrolling
      child: Column(
        children: categoryList.map((category) {
          return Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black, width: 0.1),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width < 500 ? 150 : 277.21,
                    height: MediaQuery.of(context).size.width < 500 ? 100 : 185.12,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width < 500 ? 16.56 : 9.29),
                      child: Image.asset(
                        category['image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.width < 500 ? 1 : 20),
                        Text(
                          category['title'],
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: MediaQuery.of(context).size.width < 500 ? 20 : 30,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height:MediaQuery.of(context).size.width < 500 ? 1:10),
                        Text(
                          category['subtitle'],
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.width < 500 ? 2: 20),
                        SizedBox(
                          width: 110,
                          height: 28,
                          child: InkWell(
                            onTap: () {
                              print("${category['wallpaperCount']} pressed");
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white, width: 0.5),
                                borderRadius: BorderRadius.circular(30),
                                gradient: LinearGradient(
  colors: [
    const Color(0x1A878787), 
    // Color(0x33878787),
    Colors.grey.shade200.withOpacity(0.1), 
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
),

                              ),
                              alignment: Alignment.center,
                              child: Text(
                                category['wallpaperCount'],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
