import 'package:flutter/material.dart';

class Active extends StatelessWidget {
  const Active({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
  color: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(43),
    side: const BorderSide( 
      color: Colors.black12,
      width: 1,
    ),
  ),
  child: SizedBox(
    height: 250, 
    width: 1406,  
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment:CrossAxisAlignment.center,
        children: [
          Container(
        width: 117.77,
        height: 210.33,
        decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(26), 
      border: Border.all(
        color: Colors.grey, 
        width: 2, 
      ),
        ),
        child: ClipRRect(
      borderRadius: BorderRadius.circular(26),
      child: Opacity(
        opacity: 1, // opacity: 1
        child: Image.asset(
          'assets/images/nature1.jpg',
          fit: BoxFit.cover, 
        ),
      ),
        ),
      )
      
        ],
        
      ),
    ),
  ),
);

  }
}