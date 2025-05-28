import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  final List<String> somethingLeft = [
    'About Us',
    'Contact Us',
    'FaQs',
    'Community Forum',
    'Term of Service',
    'Careers',
    'Leadership',
    'Blog'
  ];

  final List<String> somethingRight = [
    'Social Impact',
    'Cookies Setting',
    'Terms',
    'Accessibility Statement',
    'Investors',
    'GO Pro Course',
    'Affiliate'
  ];

  final List<ImageProvider> imageList = [
    const AssetImage('assets/images/facebook.png'),
    const AssetImage('assets/images/linkedin.png'),
    const AssetImage('assets/images/youtube.png'),
  ];

  FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Footer
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: somethingLeft
                  .map(
                    (item) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontFamily: 'inriaSans',
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),

            // Right Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: somethingRight
                  .map(
                    (item) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontFamily: 'inriaSans',
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
        const SizedBox(height: 40),
        const Column(
          children: [
            Center(
              child: Text(
                'Certified',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontFamily: 'inriaSans',
                ),
              ),
            ),
            Image(
              image: AssetImage('assets/images/itc_logo.png'),
              width: 200,
              height: 200,
            ),
          ],
        ),
        const SizedBox(height: 60),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imageList
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Image(
                    image: item,
                    width: 40,
                    height: 40,
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 40),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Copyright © 2025 Worktency, Inc. All rights reserved.',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.black87,
                fontFamily: 'inriaSans',
              ),
            ),
          ],
        ),
      ],
    );
  }
}