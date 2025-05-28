import 'package:flutter/material.dart';

class ResultWidget extends StatefulWidget {
  final String title;
  final String description;
  final ImageProvider image;
  final String level;
  final String participants;

  const ResultWidget({
    super.key,
    this.title = 'Computer Network',
    this.description =
        'A network is a system that links computers and devices to share resources and exchange data, enabling communication and access to shared services, whether locally or globally. Networking allows systems to communicate, share files, and connect to the internet, playing a key role in today’s digital world.',
    this.image = const AssetImage('assets/images/word.png'),
    this.level = 'Beginner',
    this.participants = '100',
  });

  @override
  State<ResultWidget> createState() => _ResultWidgetState();
}

class _ResultWidgetState extends State<ResultWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFEFEFEF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: widget.image,
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF000000),
                      fontFamily: 'inriaSans',
                    ),
                  ),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedSize(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          child: ConstrainedBox(
                            constraints: isExpanded
                                ? const BoxConstraints()
                                : const BoxConstraints(maxHeight: 35),
                            child: Text(
                              widget.description,
                              softWrap: true,
                              overflow: TextOverflow.fade,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(253, 164, 164, 166),
                                fontFamily: 'inriaSans',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          isExpanded ? 'See less' : 'See more',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFFFF7A00),
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xFFFF7A00),
                            fontFamily: 'inriaSans',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.layers,
                          size: 15, color: Color(0xFF595959)),
                      const SizedBox(width: 5),
                      Text(
                        widget.level,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color(0xFF595959),
                          fontFamily: 'inriaSans',
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.people,
                          size: 15, color: Color(0xFF595959)),
                      const SizedBox(width: 5),
                      Text(
                        widget.participants,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color(0xFF595959),
                          fontFamily: 'inriaSans',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}