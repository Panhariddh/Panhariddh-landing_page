import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:landing_page/widgets/button.dart';
import 'package:landing_page/widgets/footer_widget.dart';
import 'package:landing_page/widgets/home/app_bar.dart';
import 'package:landing_page/widgets/home/button_nav.dart';
import 'package:landing_page/widgets/home/card.dart';
import 'package:landing_page/widgets/home/card_course.dart';
import 'package:landing_page/widgets/home/card_teacher.dart';
import 'package:landing_page/widgets/home/horizontal_category.dart';
import 'package:landing_page/widgets/home/information.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final PageController _topRowController =
      PageController(viewportFraction: 0.45);
  final PageController _bottomRowController =
      PageController(viewportFraction: 0.45);

  @override
  void dispose() {
    _topRowController.dispose();
    _bottomRowController.dispose();
    super.dispose();
  }

  final List<String> categories = [
    'Artificial Intelligent',
    'Machine Learning',
    'Self Development',
    'Web Development',
  ];

  int _selectedIndex = 0;
  int _selectedCategoryIndex = 0;

  final Map<String, List<Widget>> _coursesByCategory = {
    'Artificial Intelligent': List.generate(
      10,
      (index) => const CardCourse(title: 'Artificial Intelligence'),
    ),
    'Machine Learning': List.generate(
      5,
      (index) => const CardCourse(title: 'Machine Learning'),
    ),
    'Self Development': List.generate(
      5,
      (index) => const CardCourse(title: 'Self Development'),
    ),
    'Web Development': List.generate(
      5,
      (index) => const CardCourse(title: 'Web Development'),
    ),
  };

  final List<Map<String, dynamic>> informationList = [
    {
      'title':
          "“Machine learning and AI are the engines driving the technological revolution of our time, transforming the way we work, live, and innovate”",
      'image': const AssetImage('assets/images/info.png'),
      'name': "Dr. VALY Dona",
      'position': "Professor @ITC,  Cofounder @ Worktency",
      'iconOne': Icons.memory,
      'iconTwo': Icons.smart_toy,
      'hashtagOne': "Machine learning",
      'hashtagTwo': "Artificial Intelligent",
    },
    // Duplicate with slight variation for demo (you can customize these)
    {
      'title': "“AI reshapes industries and powers innovation at scale.”",
      'image': const AssetImage('assets/images/info.png'),
      'name': "HOK Tin",
      'position': "AI Developer",
      'iconOne': Icons.computer,
      'iconTwo': Icons.memory,
      'hashtagOne': "AI",
      'hashtagTwo': "Innovation",
    },
    {
      'title': "“Empower your future with self-development skills.”",
      'image': const AssetImage('assets/images/info.png'),
      'name': "HENG Rathpisey",
      'position': "Lecturer @ITC",
      'iconOne': Icons.school,
      'iconTwo': Icons.person,
      'hashtagOne': "Self Development",
      'hashtagTwo': "Growth",
    },
    {
      'title': "“Education is the most powerful weapon you can use.”",
      'image': const AssetImage('assets/images/info.png'),
      'name': "Dr. VALY Dona",
      'position': "Professor @ITC",
      'iconOne': Icons.auto_stories,
      'iconTwo': Icons.lightbulb,
      'hashtagOne': "Education",
      'hashtagTwo': "Learning",
    },
    {
      'title': "“Technology empowers creativity and connectivity.”",
      'image': const AssetImage('assets/images/info.png'),
      'name': "HOK Tin",
      'position': "Web Developer",
      'iconOne': Icons.web,
      'iconTwo': Icons.code,
      'hashtagOne': "Web",
      'hashtagTwo': "Technology",
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/myCourses');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/onlineCourses');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/category');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),

      // App Bar
      appBar: const AppBarComponent(),

      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: 'Unlock Your Potential \n',
                    style: TextStyle(
                        fontSize: 28,
                        fontFamily: 'inriaSans',
                        color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'with \t',
                        style: TextStyle(
                            fontSize: 28,
                            fontFamily: 'inriaSans',
                            color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Worktency',
                        style: TextStyle(
                          fontSize: 28,
                          color: Color(0xFFEE6019),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'inriaSans',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Center(
                child: Text(
                  'Discover industry-leading courses designed to equip you with real-world skills. Join our community and start your journey to success today.',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'inriaSans',
                      color: Color(0xFF2F2F2F)),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Image.asset(
                  'assets/images/logo-landing.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 30),
              Button(
                text: "Explore Courses",
                onPressed: () {},
                width: 160,
                height: 40,
                borderRadius: 30,
                leftIcon: Icons.book,
                iconSize: 17,
                textColor: const Color(0xFF164F89),
                fontSize: 14,
                color: const Color(0xFFFFFFFF),
              ),
              const SizedBox(height: 20),
              Button(
                text: "Get Started",
                onPressed: () {},
                width: 182,
                height: 40,
                borderRadius: 30,
                leftIcon: Icons.arrow_forward,
                iconSize: 17,
                textColor: const Color(0xFFFFFFFF),
                fontSize: 14,
                color: const Color(0xFFFF7A00),
              ),
              const SizedBox(height: 60),
              const Text(
                'Why Choose Worktency?',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'inriaSans',
                    color: Color(0xFF2F2F2F)),
              ),
              const SizedBox(height: 40),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomCard(
                    title: 'Expert Instructors',
                    image: AssetImage('assets/images/instructor.png'),
                  ),
                  CustomCard(
                    title: 'Flexible Learning',
                    image: AssetImage('assets/images/learning.png'),
                  ),
                  CustomCard(
                    title: 'Hands-On Learning',
                    image: AssetImage('assets/images/handson.png'),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              const Text(
                'Featured Course',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'inriaSans',
                    color: Color(0xFF2F2F2F)),
              ),
              const SizedBox(height: 20),
              HorizontalCategory(
                categories: categories,
                selectedIndex: _selectedCategoryIndex,
                onCategoryTap: (index) {
                  setState(() {
                    _selectedCategoryIndex = index;
                  });
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                child: Column(
                  children: [
                    // First row
                    SizedBox(
                      height: 300,
                      child: PageView.builder(
                        controller: _topRowController,
                        scrollDirection: Axis.horizontal,
                        itemCount: min(
                            5,
                            _coursesByCategory[
                                        categories[_selectedCategoryIndex]]
                                    ?.length ??
                                0),
                        padEnds: false,
                        itemBuilder: (context, index) {
                          final course = _coursesByCategory[
                              categories[_selectedCategoryIndex]]![index];
                          return SizedBox(width: 170, child: course);
                        },
                      ),
                    ),

                    // Second row (if more than 5 items)
                    if ((_coursesByCategory[categories[_selectedCategoryIndex]]
                                ?.length ??
                            0) >
                        5)
                      Column(
                        children: [
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 300,
                            child: PageView.builder(
                              controller: _bottomRowController,
                              scrollDirection: Axis.horizontal,
                              itemCount: min(
                                  5,
                                  (_coursesByCategory[categories[
                                                  _selectedCategoryIndex]]
                                              ?.length ??
                                          0) -
                                      5),
                              padEnds: false,
                              itemBuilder: (context, index) {
                                final course = _coursesByCategory[categories[
                                    _selectedCategoryIndex]]![index + 5];
                                return SizedBox(width: 170, child: course);
                              },
                            ),
                          ),
                        ],
                      ),

                    const SizedBox(height: 12),

                    SmoothPageIndicator(
                      controller: _topRowController,
                      count: min(
                              5,
                              _coursesByCategory[
                                          categories[_selectedCategoryIndex]]
                                      ?.length ??
                                  0) +
                          ((_coursesByCategory[categories[
                                              _selectedCategoryIndex]]
                                          ?.length ??
                                      0) >
                                  5
                              ? min(
                                  5,
                                  (_coursesByCategory[categories[
                                                  _selectedCategoryIndex]]
                                              ?.length ??
                                          0) -
                                      5)
                              : 0),
                      effect: const WormEffect(
                        dotHeight: 8,
                        dotWidth: 8,
                        activeDotColor: Color(0xFFFF7A00),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 60),
              const Text(
                'Meet Our Teachers',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'inriaSans',
                    color: Color(0xFF2F2F2F)),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardTeacher(
                      name: "Dr. VALY Dona",
                      image: AssetImage('assets/images/dona.jpg'),
                      position: "Researcher, AI Specialist"),
                  CardTeacher(
                      name: "HOK Tin",
                      image: AssetImage('assets/images/tin.jpg'),
                      position: "Web Developer"),
                  CardTeacher(
                      name: "HENG Rathpisey",
                      image: AssetImage('assets/images/sey.jpg'),
                      position: "Lecturer at ITC"),
                ],
              ),
              const SizedBox(height: 60),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 40,
                    color: Color(0xFFFF7A00),
                  ),
                  Transform.translate(
                    offset: const Offset(-20, 0), // shift left by 10 pixels
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 40,
                      color: Color(0xFFFF7A00),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(
                        -40, 0), // shift even more for tighter overlap
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 40,
                      color: Color(0xFFFF7A00),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(-40, 0),
                    child: RichText(
                      text: const TextSpan(
                        text: 'To reach our only One goal,',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: 'inriaSans',
                        ),
                        children: [
                          TextSpan(
                            text: ' \n',
                          ),
                          WidgetSpan(
                            child: SizedBox(height: 30),
                          ),
                          TextSpan(
                            text: 'what we can share with you today',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: informationList.length,
                    itemBuilder: (context, index) {
                      final info = informationList[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Information(
                          title: info['title'],
                          image: info['image'],
                          name: info['name'],
                          position: info['position'],
                          iconOne: info['iconOne'],
                          iconTwo: info['iconTwo'],
                          hashtagOne: info['hashtagOne'],
                          hashtagTwo: info['hashtagTwo'],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "See More",
                            style: TextStyle(
                              fontFamily: 'inriaSans',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF164F89),
                            ),
                          ),
                          const SizedBox(height: 4), // This is the gap
                          Container(
                            height: 2,
                            width: 50, // You can adjust the width as needed
                            color: const Color(0xFF164F89),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 150,
                  height: 40,
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.contain,
                    width: 150,
                    height: 40, // no scaling at all
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Footer
              FooterWidget()
            ],
          ),
        ),
      ),
      bottomNavigationBar: ButtonNavigate(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}