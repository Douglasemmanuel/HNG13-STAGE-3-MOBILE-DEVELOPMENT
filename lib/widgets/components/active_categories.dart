import 'package:flutter/material.dart';

class ActiveCategories extends StatelessWidget {
  const ActiveCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment:MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
  width: 277.21, 
  height: 185.12,
  child: ClipRRect(
    borderRadius: BorderRadius.circular(16.56), 
    child: Image.asset(
      'assets/images/nature.jpg', 
      fit: BoxFit.cover, 
    ),
  ),
),

          SizedBox(width:10),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
          ),
        ],
        ),
    );
  }
}