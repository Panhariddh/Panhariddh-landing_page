import 'package:flutter/material.dart';
import 'package:landing_page/screens/search_result_screen.dart';
import 'package:landing_page/widgets/footer_widget.dart';
import 'package:landing_page/widgets/home/app_bar.dart';
import 'package:landing_page/widgets/home/button_nav.dart';
import 'package:landing_page/widgets/home/card_course.dart';
import 'package:landing_page/widgets/search/search_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../widgets/search/thumbnail.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  final PageController _pageController = PageController(viewportFraction: 0.45);
  final PageController _pageController1 = PageController();
  final PageController _pageController2 = PageController();
  final PageController _pageController3 = PageController();
  final PageController _pageController4 =
      PageController(viewportFraction: 0.45);
  final PageController _pageController5 =
      PageController(viewportFraction: 0.45);

  int _currentPage1 = 0;
  int _currentPage2 = 0;
  int _currentPage3 = 0;

  int selectedIndex = 0;

  final List<ThumbnailCard> _thumbnailCards = [
    const ThumbnailCard(),
    const ThumbnailCard(),
    const ThumbnailCard(),
  ];

  final List<Widget> _courseCards = List.generate(
    5,
    (index) => const CardCourse(title: 'Microsoft Word'),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController1.dispose();
    _searchController.dispose();
    _pageController2.dispose();
    _pageController.dispose();
    _pageController3.dispose();
    _pageController4.dispose();
    _pageController5.dispose();
    super.dispose();
  }

  void _handleSearch() {
    if (_searchController.text.isNotEmpty) {
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              SearchResultScreen(searchQuery: _searchController.text),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 300),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a search term'),
        ),
      );
    }
  }

  void _handleClear() {
    _searchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: const AppBarComponent(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Column(
            children: [
              SearchBarWidget(
                onSearch: _handleSearch,
                controller: _searchController,
                onClear: _handleClear,
              ),
              const SizedBox(height: 40),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 40,
                    color: Color(0xFFFF7A00),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Explore your favorite subjects!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'inriaSans',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Thumbnail Cards
                  SizedBox(
                    height: 300,
                    child: PageView.builder(
                      controller: _pageController1,
                      itemCount: _thumbnailCards.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage1 = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: _thumbnailCards[index],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  // SmoothPageIndicator
                  SmoothPageIndicator(
                    controller: _pageController1,
                    count: _thumbnailCards.length,
                    effect: const WormEffect(
                        dotHeight: 4,
                        dotWidth: 28,
                        activeDotColor: Color(0xFFFF7A00)),
                  ),
                ],
              ),

              const SizedBox(height: 40),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 40,
                    color: Color(0xFFFF7A00),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Build your competency with us!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'inriaSans',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Thumbnail Cards
                  SizedBox(
                    height: 300,
                    child: PageView.builder(
                      controller: _pageController3,
                      itemCount: _thumbnailCards.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage3 = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: _thumbnailCards[index],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  // SmoothPageIndicator
                  SmoothPageIndicator(
                    controller: _pageController3,
                    count: _thumbnailCards.length,
                    effect: const WormEffect(
                        dotHeight: 4,
                        dotWidth: 28,
                        activeDotColor: Color(0xFFFF7A00)),
                  ),
                ],
              ),

              const SizedBox(height: 40),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 40,
                    color: Color(0xFFFF7A00),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Best recommended for you!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'inriaSans',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Thumbnail Cards
                  SizedBox(
                    height: 300,
                    child: PageView.builder(
                      controller: _pageController2,
                      itemCount: _thumbnailCards.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage2 = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: _thumbnailCards[index],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  // SmoothPageIndicator
                  SmoothPageIndicator(
                    controller: _pageController2,
                    count: _thumbnailCards.length,
                    effect: const WormEffect(
                        dotHeight: 4,
                        dotWidth: 28,
                        activeDotColor: Color(0xFFFF7A00)),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              const Divider(
                indent: 80,
                endIndent: 80,
                height: 40,
                thickness: 1,
                color: Color(0xFFD9D9D9),
              ),

              // Cyber Security
              const SizedBox(height: 40),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Cyber Security",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'inriaSans',
                  ),
                ),
              ),

              const SizedBox(height: 10),
              Column(
                children: [
                  SizedBox(
                    height: 300,
                    child: PageView.builder(
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      itemCount: _courseCards.length,
                      padEnds: false, // Ensure no padding at the ends
                      itemBuilder: (context, index) {
                        return SizedBox(
                          child: _courseCards[index],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: _courseCards.length,
                    effect: const WormEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      activeDotColor: Color(0xFFFF7A00),
                    ),
                  ),
                ],
              ),

              // Network Administrator
              const SizedBox(height: 40),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Network Administrator",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'inriaSans',
                  ),
                ),
              ),

              const SizedBox(height: 10),
              Column(
                children: [
                  SizedBox(
                    height: 300,
                    child: PageView.builder(
                      controller: _pageController4,
                      scrollDirection: Axis.horizontal,
                      itemCount: _courseCards.length,
                      padEnds: false, // Ensure no padding at the ends
                      itemBuilder: (context, index) {
                        return SizedBox(
                          child: _courseCards[index],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  SmoothPageIndicator(
                    controller: _pageController4,
                    count: _courseCards.length,
                    effect: const WormEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      activeDotColor: Color(0xFFFF7A00),
                    ),
                  ),
                ],
              ),

              // Cryptography
              const SizedBox(height: 40),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Cryptography",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'inriaSans',
                  ),
                ),
              ),

              Column(
                children: [
                  SizedBox(
                    height: 300,
                    child: PageView.builder(
                      controller: _pageController5,
                      scrollDirection: Axis.horizontal,
                      itemCount: _courseCards.length,
                      padEnds: false, // Ensure no padding at the ends
                      itemBuilder: (context, index) {
                        return SizedBox(
                          child: _courseCards[index],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  SmoothPageIndicator(
                    controller: _pageController5,
                    count: _courseCards.length,
                    effect: const WormEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      activeDotColor: Color(0xFFFF7A00),
                    ),
                  ),
                ],
              ),

              // Footer
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
              FooterWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ButtonNavigate(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
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
        },
      ),
    );
  }
}