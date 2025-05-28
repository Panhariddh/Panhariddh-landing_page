import 'package:flutter/material.dart';
import 'package:landing_page/widgets/home/app_bar.dart';
import 'package:landing_page/widgets/home/button_nav.dart';
import 'package:landing_page/widgets/search/result_widget.dart';
import 'package:landing_page/widgets/search/search_bar.dart';
import 'package:landing_page/widgets/search/search_result_categories.dart';
import '../widgets/footer_widget.dart';

class SearchResultScreen extends StatefulWidget {
  final String searchQuery;
  const SearchResultScreen({super.key, required this.searchQuery});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.searchQuery);

    // Show up  15 data
    for (var category in categories) {
      visibleItemsPerCategory[category] = 15;
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _handleSearch() {}

  void _handleClear() {
    _searchController.clear();
  }

  final List<String> categories = [
    'All',
    'Courses',
    'Projects',
    'sessions',
    'Lecturers'
  ];

  Map<String, int> visibleItemsPerCategory = {};

  final Map<String, List<Widget>> searchResultCategories = {
    'All': List.generate(
      20,
      (index) => const ResultWidget(
        title: 'All',
      ),
    ),
    'Courses': List.generate(
      10,
      (index) => const ResultWidget(
        title: 'Courses',
      ),
    ),
    'Projects': List.generate(
      5,
      (index) => const ResultWidget(
        title: 'Projects',
      ),
    ),
    'sessions': List.generate(
      3,
      (index) => const ResultWidget(
        title: 'sessions',
      ),
    ),
    'Lecturers': List.generate(
      2,
      (index) => const ResultWidget(
        title: 'Lecturers',
      ),
    ),
  };

  int selectedIndex = 0;
  int selectedIndexBottom = 0;
  List<int> counts = [20, 10, 5, 3, 2];
  List<String> suggestions = ['', '', 'PRO', '', ''];

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
              SearchResultCategories(
                categories: categories,
                selectedIndex: selectedIndex,
                onCategoryTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                counts: counts,
                suggestions: suggestions,
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  ...searchResultCategories[categories[selectedIndex]]!
                      .take(visibleItemsPerCategory[categories[selectedIndex]]!)
                      .toList(),
                  if (searchResultCategories[categories[selectedIndex]]!
                          .length >
                      visibleItemsPerCategory[categories[selectedIndex]]!)
                    TextButton(
                      onPressed: () {
                        setState(() {
                          visibleItemsPerCategory[categories[selectedIndex]] =
                              visibleItemsPerCategory[
                                      categories[selectedIndex]]! +
                                  15;
                        });
                      },
                      child: const Text(
                        'Load More...',
                        style: TextStyle(
                          color: Color(0xFF7B7B7B),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'inriaSans',
                        ),
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
        currentIndex: selectedIndexBottom,
        onTap: (index) {
          setState(() {
            selectedIndexBottom = index;
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