import 'package:flutter/material.dart';
import 'package:landing_page/widgets/auth/dark_mode_switch.dart';
import 'package:landing_page/widgets/auth/switch_languages.dart';
import 'package:landing_page/widgets/auth/text_field.dart';
import 'package:landing_page/widgets/button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = TextEditingController();

  bool isDarkMode = false;

  String selectedLang = 'en';

  Map<String, Map<String, String>> translations = {
    'en': {
      'greeting': 'Hello!',
      'username': 'Username',
      'password': 'Password',
      'login': 'Login',
      'dark_mode': 'Dark Mode',
      'light_mode': 'Light Mode',
    },
    'fr': {
      'greeting': 'Salut!',
      'username': "Nom d'utilisateur",
      'password': 'Mot de passe',
      'login': 'Connexion',
      'dark_mode': 'Mode sombre',
      'light_mode': 'Mode clair',
    },
    'kh': {
      'greeting': 'សួស្តី!',
      'username': 'ឈ្មោះអ្នកប្រើប្រាស់',
      'password': 'ពាក្យសម្ងាត់',
      'login': 'ចូល',
      'dark_mode': 'ផ្ទាំងងងឹត',
      'light_mode': 'ផ្ទាំងពន្លឺ',
    },
  };

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isDarkMode ? const Color(0xFF1A1A1D) : Colors.white;
    const primaryColor = Color(0xFFFF7A00);
    final appBarColor = backgroundColor;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leadingWidth: 200,
        elevation: 0,
        backgroundColor: appBarColor,
        iconTheme: const IconThemeData(color: primaryColor),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                translations[selectedLang]!['login']!,
                style: const TextStyle(
                  fontFamily: 'inriaSans',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: 80,
                height: 4,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            const SizedBox(
              width: 322,
              height: 55,
              child: Image(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              translations[selectedLang]!['greeting']!,
              style: const TextStyle(
                fontFamily: 'inriaSans',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 30),
            TextFieldWidget(
              hintText: translations[selectedLang]!['username']!,
              controller: controller,
              label: translations[selectedLang]!['username']!,
              isDarkMode: isDarkMode,
            ),
            TextFieldWidget(
              hintText: translations[selectedLang]!['password']!,
              controller: controller,
              label: translations[selectedLang]!['password']!,
              isPassword: true,
              isDarkMode: isDarkMode,
            ),
            const SizedBox(height: 30),
            Button(
              text: translations[selectedLang]!['login']!,
              onPressed: () {
                Navigator.pushNamed(context, '/explore');
              },
              borderRadius: 12,
              color: primaryColor,
              textColor: Colors.white,
            ),
            const SizedBox(height: 30),
            Divider(
              color:
                  isDarkMode ? Colors.grey.shade800 : const Color(0xFFD9D9D9),
              thickness: 1,
              indent: 80,
              endIndent: 80,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SwitchLanguages(
                  text: 'EN',
                  imageFlag: const AssetImage('assets/images/en.png'),
                  isSelected: selectedLang == 'en',
                  onTap: () => setState(() => selectedLang = 'en'),
                ),
                const SizedBox(width: 10),
                SwitchLanguages(
                  text: 'FR',
                  imageFlag: const AssetImage('assets/images/fr.png'),
                  isSelected: selectedLang == 'fr',
                  onTap: () => setState(() => selectedLang = 'fr'),
                ),
                const SizedBox(width: 10),
                SwitchLanguages(
                  text: 'KH',
                  imageFlag: const AssetImage('assets/images/kh.png'),
                  isSelected: selectedLang == 'kh',
                  onTap: () => setState(() => selectedLang = 'kh'),
                ),
              ],
            ),
            const Spacer(),
            DarkModeSwitch(
              isDarkMode: isDarkMode,
              onToggle: (value) {
                setState(() => isDarkMode = value);
              },
              darkText: translations[selectedLang]?['dark_mode'] ?? 'Dark Mode',
              lightText:
                  translations[selectedLang]?['light_mode'] ?? 'Light Mode',
            ),
          ],
        ),
      ),
    );
  }
}