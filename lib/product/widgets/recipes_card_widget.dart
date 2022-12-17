import 'package:flutter/material.dart';

import '../constants/project_variables.dart';

class RecipesCardWidget extends StatelessWidget {
  const RecipesCardWidget(
      {Key? key,
      this.imageLink = 'https://via.placeholder.com/150',
      this.title = 'Title',
      this.pointTextColor = Colors.teal,
      this.cardBackgroundColor = ColorItems.recipesCardBackgroundColor})
      : super(key: key);
  final String imageLink;
  final String title;

  final Color pointTextColor;
  final Color cardBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11.0),
          color: cardBackgroundColor,
        ),
        height: 170,
        width: 160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(imageLink))),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                          overflow: TextOverflow.ellipsis,
                          title,
                          style: const TextStyle(
                              color: ColorItems.recipesCardTextColor, fontSize: 20, fontWeight: FontWeight.bold))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
