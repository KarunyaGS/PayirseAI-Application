import 'package:Payirseai/data/core/configs/theme/app_colors.dart';
import 'package:Payirseai/presentation/choose_module/pages/chat_bot/chat_bot.dart';
import 'package:Payirseai/presentation/choose_module/pages/market_analysis/market_insights.dart';
import 'package:Payirseai/presentation/choose_module/pages/settings_provider/preferences.dart';
import 'package:Payirseai/presentation/choose_module/pages/yeild_prediction/prediction.dart';
import 'package:Payirseai/presentation/splash/pages/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';





class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/appimages/abi.png'),fit: BoxFit.cover,opacity: 0.25)
        ),
        child: Padding(
          padding: const EdgeInsets.all(.0),
          child: Column(
              children: [
                SizedBox(height: 30,),
                Container(
                  height: 220.0,
                  width: 220, 
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('assets/appimages/drawer.png'), 
                      fit: BoxFit.cover,
                      
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: 270,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(.5),
                        spreadRadius: 2,
                        blurRadius: 3
                      )
                    ]
                  ),
                  child: ListTile(
                    
                    leading: Icon(Icons.batch_prediction,color: AppColors.primary,),
                    title: Text('Predict Yield',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary
                    ),),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CropPredictionForm()),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: 270,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(.5),
                        spreadRadius: 2,
                        blurRadius: 3
                      )
                    ]
                  ),
                  child: ListTile(
                    leading: Icon(Icons.insights,color: AppColors.primary),
                    title: Text('Market Insights',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary
                    ),),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MarketInsightsPage()),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: 270,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(.5),
                        spreadRadius: 2,
                        blurRadius: 3
                      )
                    ]
                  ),
                  child: ListTile(
                    leading: Icon(Icons.message,color: AppColors.primary),
                    title: Text('Farm Assist',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary
                    ),),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatBotPage()),
                      );
                    },
                  ),
                ),
                
                
                SizedBox(height: 10,),
                Container(
                  width: 270,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(.5),
                        spreadRadius: 2,
                        blurRadius: 3
                      )
                    ]
                  ),
                  child: ListTile(
                    leading: Icon(Icons.settings,
                    color: AppColors.primary),
                    title: Text('Preference',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary
                    ),),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PreferencesPage()),
                      );
                    },
                  ),
                ),
                SizedBox(height: 170,width: 40,),
                ListTile(
                  leading: const Icon(Icons.logout,color: AppColors.darkBackground,), // Icon for logout
                  title: const Text('Logout',
                  style: TextStyle(color: Colors.red),),
                  onTap: () async {
                    await signOut(context);
                  },
                ),
              ],
              
            ),
        ),
      ),
      
    );
    
  }
  Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    // Navigate to the Splashpage or Login page after signing out
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Splashpage()),
    );
  }
}