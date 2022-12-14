import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget(
      {Key? key,
      this.imageLink = 'https://via.placeholder.com/150',
      this.title = 'Title',
      this.detailsPage = const SizedBox(),
      this.pointTextColor = Colors.teal,
      this.cardBackgroundColor = const Color.fromARGB(51, 255, 255, 255)})
      : super(key: key);
  final String imageLink;
  final String title;

  final Color pointTextColor;
  final Color cardBackgroundColor;
  final Widget detailsPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 0),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => detailsPage));
        },
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
                  decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(imageLink))),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
