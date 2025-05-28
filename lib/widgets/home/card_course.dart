import 'package:flutter/material.dart';
import 'package:landing_page/widgets/button.dart';

class CardCourse extends StatelessWidget {
  final String title;
  final ImageProvider image;
  final String level;
  final String participants;
  final String nameProfessor;
  final String position;
  final String price;
  final ImageProvider imageProfessor;

  const CardCourse({
    super.key,
    this.title = 'Microsoft word',
    this.image = const AssetImage('assets/images/word.png'),
    this.level = 'Beginner',
    this.participants = '1000',
    this.nameProfessor = 'Mr. Bunthorn Liv',
    this.position = 'Professor',
    this.price = '39.99',
    this.imageProfessor = const AssetImage('assets/images/professor.png'),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 164,
      height: 275,
      child: Card(
        color: const Color.fromARGB(255, 255, 255, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 137.5,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Color(0xFFF8F8F8),
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFFDEDEDE),
                    width: 1,
                  ),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image(
                  image: image,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                // Course Info
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'inriaSans',
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.layers,
                                color: Color(0xFF595959),
                                size: 12,
                              ),
                              Text(
                                level,
                                style: const TextStyle(
                                  color: Color(0xFF595959),
                                  fontSize: 10,
                                  fontFamily: 'inriaSans',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 10),
                          Row(
                            children: [
                              const Icon(
                                Icons.group,
                                color: Color(0xFF595959),
                                size: 12,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                participants,
                                style: const TextStyle(
                                  color: Color(0xFF595959),
                                  fontSize: 10,
                                  fontFamily: 'inriaSans',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Professor Info
                Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F8F8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundImage: imageProfessor,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                nameProfessor,
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'inriaSans',
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                position,
                                style: const TextStyle(
                                  fontSize: 9,
                                  color: Colors.grey,
                                  fontFamily: 'inriaSans',
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Price
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                      Text(
                        '\$$price',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'inriaSans',
                        ),
                      ),
                      Button(
                        text: 'Start',
                        onPressed: () {},
                        width: 72,
                        height: 22,
                        borderRadius: 8,
                        color: const Color.fromARGB(255, 192, 218, 240),
                        textColor: const Color.fromARGB(255, 73, 142, 210),
                        fontSize: 8,
                        iconSize: 8,
                        rightIcon: Icons.arrow_forward,
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}