import 'package:flutter/material.dart';

class Information extends StatelessWidget {
  final String title;
  final ImageProvider image;
  final String name;
  final String position;
  final IconData iconOne;
  final IconData iconTwo;
  final String hashtagOne;
  final String hashtagTwo;

  const Information({
    super.key,
    required this.title,
    required this.image,
    required this.name,
    required this.position,
    required this.iconOne,
    required this.iconTwo,
    required this.hashtagOne,
    required this.hashtagTwo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 160,
          height: 140,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            image: DecorationImage(
              image: image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 16),
        // Use Flexible here — NOT Expanded inside SizedBox
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF353535),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'inriaSans',
                ),
              ),
              const SizedBox(height: 10),
              // Wrap text widgets inside Flexible to avoid overflow in the Row
              Row(
                children: [
                  Flexible(
                    child: Text(
                      name,
                      style: const TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'inriaSans',
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    "|",
                    style: TextStyle(color: Color(0xFF7B7B7B), fontSize: 10),
                  ),
                  const SizedBox(width: 5),
                  Flexible(
                    child: Text(
                      position,
                      style: const TextStyle(
                        color: Color(0xFF7B7B7B),
                        fontSize: 10,
                        fontFamily: 'inriaSans',
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _buildHashtag(iconOne, hashtagOne),
              const SizedBox(height: 10),
              _buildHashtag(iconTwo, hashtagTwo),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHashtag(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: const BoxDecoration(
        color: Color(0xFFF4F5FA),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: const Color(0xFF164F89), size: 15),
          const SizedBox(width: 5),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF164F89),
              fontSize: 10,
              fontWeight: FontWeight.bold,
              fontFamily: 'inriaSans',
            ),
          ),
        ],
      ),
    );
  }
}