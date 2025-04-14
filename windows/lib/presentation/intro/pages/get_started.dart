import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Payirseai/data/common/widgets/button/basic_app_button.dart';

import 'package:Payirseai/data/core/configs/assets/app_vectors.dart';
import 'package:Payirseai/data/core/configs/theme/app_colors.dart';
import 'package:Payirseai/presentation/auth/pages/signup_or_singin.dart';
import 'package:Payirseai/localizations/app_localizations.dart';
import 'package:Payirseai/main.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  _GetStartedPageState createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  String _currentLanguage = 'en';

  void _changeLanguage(String languageCode) {
    Locale newLocale = Locale(languageCode);
    MyApp.setLocale(context, newLocale);
    setState(() {
      _currentLanguage = languageCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    double titleFontSize = _currentLanguage == 'ta' ? 19.0 : 22.0;
    double empoweringMessageFontsize = _currentLanguage == 'ta' ? 15.0 : 17.0;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/appimages/get_started.png'),
              ),
            ),
          ),
          Container(
            color: AppColors.lightBackground.withOpacity(.15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 40),
            child: Column(
              children: [
                const SizedBox(height: 40),
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(
                    AppVectors.logo,
                    height: 45,
                    width: 45,
                  ),
                ),
                SizedBox(height: 25,),
                Text(
                  localizations.translate('title'),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: titleFontSize,
                    letterSpacing: 2.0,
                  ),
                ),
                const SizedBox(height: 21),
                Text(
                  localizations.translate('empoweringMessage'),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: empoweringMessageFontsize,
                  ),
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                BasicAppButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const SignupOrSinginPage(),
                      ),
                    );
                  },
                  title: localizations.translate('getStarted'),
                ),
                const SizedBox(height: 40),
                DropdownButtonHideUnderline(
                  
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: AppColors.primary,
                            ),
                      child: DropdownButton<String>(
                        padding: EdgeInsets.symmetric(horizontal: 13),
                        value: _currentLanguage,
                        dropdownColor: AppColors.primary,
                        items: [
                          DropdownMenuItem(child: Text('English',style: TextStyle(color: Colors.white),), value: 'en',),
                          DropdownMenuItem(child: Text('Tamil',style: TextStyle(color: Colors.white),), value: 'ta'),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            _changeLanguage(value);
                          }
                        },
                        
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
