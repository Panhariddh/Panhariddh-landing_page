import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final ImageProvider image;

  const CustomCard({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 123,
      height: 132,
      child: Card(
        color: const Color.fromARGB(255, 224, 237, 245),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: image,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFFFF7A00),
                fontSize: 12,
                fontWeight: FontWeight.bold,
                fontFamily: 'inriaSans',
              ),
            ),
          ],
        ),
      ),
    );
  }
}