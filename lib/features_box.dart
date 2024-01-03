import 'package:aladdin_jin/colors.dart';
import 'package:flutter/material.dart';

class FeaturesBox extends StatelessWidget {
  // konstruktir yaratish kerak

  final Color color;

  final String headerText;

  final String descriptionText;

  const FeaturesBox(
      {super.key,
      required this.color,
      required this.headerText,
      required this.descriptionText});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 35,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20).copyWith(left: 15),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  headerText,
                  style: const TextStyle(
                    fontFamily: 'Barlow',
                    color: Rang.mainFontColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          const SizedBox(height: 2,),
               Padding(
                 padding: const EdgeInsets.only(right: 20),
                 child: Text(
                  descriptionText,
                  style: const TextStyle(
                    fontFamily: 'Barlow',
                    color: Rang.mainFontColor,
                  ),
                               ),
               ),
            ],
          ),
        )
       

        );
  }
}
