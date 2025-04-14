import 'package:flutter/material.dart';
import '../main.dart'; // Import the MyApp class to access setLocale method

class LanguageSwitcher extends StatefulWidget {
  @override
  _LanguageSwitcherState createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<LanguageSwitcher> {
  Locale _locale = Locale('en');

  void _changeLanguage(String languageCode) {
    setState(() {
      _locale = Locale(languageCode);
      // Notify the rest of the app about the language change.
      MyApp.setLocale(context, _locale);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _locale.languageCode,
      items: [
        DropdownMenuItem(child: Text('English'), value: 'en'),
        DropdownMenuItem(child: Text('Tamil'), value: 'ta'),
      ],
      onChanged: (value) {
        if (value != null) {
          _changeLanguage(value);
        }
      },
    );
  }
}
