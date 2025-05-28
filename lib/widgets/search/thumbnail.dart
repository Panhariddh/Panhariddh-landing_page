import 'package:flutter/material.dart';

class ThumbnailCard extends StatelessWidget {
  final String title;
  final String description;
  final ImageProvider image;
  final Color backgroundColor;
  const ThumbnailCard(
      {super.key,
      this.title = 'Introduction to Machine Learning',
      this.description =
          '“Machine learning and AI are the engines driving the technological revolution of our time, transforming the way we work, live, and innovate”',
      this.image = const AssetImage('assets/images/info.png'),
      this.backgroundColor = const Color(0xFFE0E0E0)});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 283,
      height: 316,
      child: Card(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 243,
                height: 167,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                    image: image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF353535),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'inriaSans',
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: 270,
                child: Text(
                  description,
                  style: const TextStyle(
                    color: Color(0xFF353535),
                    fontSize: 12,
                    fontFamily: 'inriaSans',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}