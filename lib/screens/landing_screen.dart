import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:landing_page/widgets/button.dart';
import 'package:landing_page/widgets/button_nav.dart';
import 'package:landing_page/widgets/card.dart';
import 'package:landing_page/widgets/card_course.dart';
import 'package:landing_page/widgets/card_teacher.dart';
import 'package:landing_page/widgets/horizontal_category.dart';
import 'package:landing_page/widgets/information.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final PageController _pageController1 = PageController();
  final PageController _pageController2 = PageController();

  // int _currentPage1 = 0;

  @override
  void dispose() {
    _pageController1.dispose();
    _pageController2.dispose();
    super.dispose();
  }

  final List<String> categories = [
    'Artificial Intelligent',
    'Machine Learning',
    'Self Development',
    'Web Development',
  ];

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

  int _selectedIndex = 0;
  int _selectedCategoryIndex = 0;

  final Map<String, List<CardCourse>> _coursesByCategory = {
    'Artificial Intelligent': [
      const CardCourse(),
      const CardCourse(),
      const CardCourse(),
    ],
    'Machine Learning': [
      const CardCourse(),
      const CardCourse(),
      const CardCourse(),
    ],
    'Self Development': [
      const CardCourse(),
      const CardCourse(),
      const CardCourse(),
    ],
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leadingWidth: 150,
          leading: Padding(
            padding: const EdgeInsets.only(left: 12),
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
          actions: [
            IconButton(
              icon: const Icon(Icons.search, size: 24),
              onPressed: () {},
              color: const Color(0xFF164F89),
            ),
            IconButton(
              icon: const Icon(Icons.person, size: 24),
              onPressed: () {},
              color: const Color(0xFF164F89),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
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
                width: 180,
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
              // Replace the existing Row with this:
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CustomCard(
                      title: 'Expert Instructors',
                      image: AssetImage('assets/images/instructor.png'),
                    ),
                    const SizedBox(width: 20),
                    const CustomCard(
                      title: 'Flexible Learning',
                      image: AssetImage('assets/images/learning.png'),
                    ),
                    const SizedBox(width: 20),
                    const CustomCard(
                      title: 'Hands-On Learning',
                      image: AssetImage('assets/images/handson.png'),
                    ),
                  ],
                ),
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
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      _coursesByCategory[categories[_selectedCategoryIndex]]
                              ?.length ??
                          0,
                  itemBuilder: (context, index) {
                    final course = _coursesByCategory[
                        categories[_selectedCategoryIndex]]![index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: course,
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      _coursesByCategory[categories[_selectedCategoryIndex]]
                              ?.length ??
                          0,
                  itemBuilder: (context, index) {
                    final course = _coursesByCategory[
                        categories[_selectedCategoryIndex]]![index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: course,
                    );
                  },
                ),
              ),
              // SizedBox(
              //   height: 300,
              //   child: PageView.builder(
              //     controller: _pageController1,
              //     itemCount:
              //         _coursesByCategory[categories[_selectedCategoryIndex]]
              //                 ?.length ??
              //             0,
              //     onPageChanged: (index) {
              //       setState(() {
              //         _currentPage1 = index;
              //       });
              //     },
              //     itemBuilder: (context, index) {
              //       final course = _coursesByCategory[
              //           categories[_selectedCategoryIndex]]![index];
              //       return Padding(
              //         padding: const EdgeInsets.only(right: 20),
              //         child: course,
              //       );
              //     },
              //   ),
              // ),
              const SizedBox(height: 10),
              Center(
                child: SmoothPageIndicator(
                  controller: _pageController1,
                  count: _coursesByCategory[categories[_selectedCategoryIndex]]
                          ?.length ??
                      0,
                  effect: const WormEffect(dotHeight: 8, dotWidth: 8),
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
             // Replace with:
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CardTeacher(
                        name: "Dr. VALY Dona",
                        image: AssetImage('assets/images/dona.jpg'),
                        position: "Researcher, AI Specialist"),
                    const SizedBox(width: 20),
                    const CardTeacher(
                        name: "HOK Tin",
                        image: AssetImage('assets/images/tin.jpg'),
                        position: "Web Developer"),
                    const SizedBox(width: 20),
                    const CardTeacher(
                        name: "HENG Rathpisey",
                        image: AssetImage('assets/images/sey.jpg'),
                        position: "Lecturer at ITC"),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              // Replace with:
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 40,
                    color: Color(0xFFFF7A00),
                  ),
                  Transform.translate(
                    offset: const Offset(-20, 0),
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 40,
                      color: Color(0xFFFF7A00),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(-40, 0),
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
                          TextSpan(text: ' \n'),
                          WidgetSpan(child: SizedBox(height: 30)),
                          TextSpan(text: 'what we can share with you today'),
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
              const SizedBox(height: 40),
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
              // Replace with:
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 8,
                runSpacing: 8,
                children: imageList
                    .map(
                      (item) => Image(
                        image: item,
                        width: 40,
                        height: 40,
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 40),
              // Replace the Row with a Wrap widget
              Wrap(
                alignment: WrapAlignment.center,
                children: const [
                  Text(
                    'Copyright © 2025 Worktency, Inc. All rights reserved.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87,
                      fontFamily: 'inriaSans',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
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