import 'package:Payirseai/presentation/choose_module/pages/chat_bot/chat_bot.dart';
import 'package:Payirseai/presentation/choose_module/pages/market_analysis/market_insights.dart';
import 'package:Payirseai/presentation/choose_module/pages/weather/five_day_forecast_screen.dart';
import 'package:Payirseai/presentation/choose_module/pages/weather/weather_provider.dart';
import 'package:Payirseai/presentation/home/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Payirseai/data/common/widgets/appbar/app_bar.dart';
import 'package:Payirseai/data/core/configs/assets/app_vectors.dart';
import 'package:Payirseai/data/core/configs/theme/app_colors.dart';
import 'package:Payirseai/presentation/choose_module/pages/yeild_prediction/prediction.dart';
import 'package:Payirseai/localizations/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _fullName= "";

  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _fullName = prefs.getString('fullName') ?? 'User';
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      drawer: DrawerPage(),
      appBar: BasicAppBar(
        hideBack: true,
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 35,
          width: 35,
        ),
        
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/appimages/abi.png'),fit: BoxFit.cover,opacity: 0.25)
        ),
        
        child: SingleChildScrollView(
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text.rich(
                  TextSpan(
                    text: 'Glad you\'re here, ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: _fullName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary
                        ),
                      ),
                      TextSpan(
                        text: '...!',
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 20),
              _homeCardOne(context, localizations),
              const SizedBox(height: 40),
              _homeCardTwo(context, localizations),
              const SizedBox(height: 40),
              _homeCardThree(context, localizations),
              const SizedBox(height: 40),
              _homeCardFour(context),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _homeCardOne(BuildContext context, AppLocalizations localizations) {
    return Center(
      child: Container(
        width: 320,
        height: 260,
        
        decoration: BoxDecoration(
          
           gradient: const LinearGradient(
            colors: [
              Color.fromARGB(180, 255, 255, 255),
              Color.fromARGB(180, 56, 120, 84),
            ],
            stops: [
              0.2,
              0.9,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
           ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
            ),
          ],
        ),
        
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>  CropPredictionForm(),
                ),
              );
            },
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                      child: Text(
                        localizations.translate('Predict Yield'), // Localize the text
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        color: AppColors.darkBackground,
                      ),
                    ),
                  ],
                ),
                
                  
                    // const Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    //   child: Text(
                    //     'Predict, plant,\nand prosper\nwith smart yield\ninsights.',
                    //     style: TextStyle(
                    //       color: Colors.black,
                    //       fontSize: 16,
                    //       fontWeight: FontWeight.w500,
                    //     ),
                    //     textAlign: TextAlign.center,
                    //   ),
                    // ),
                    Padding(
                      padding:EdgeInsets.symmetric(horizontal: 1) ,
                      child: Image(image: AssetImage('assets/appimages/yield.png'),width: 280,height: 170,fit: BoxFit.cover,),
                    )
                  ],
                
              
            ),
          ),
        
      ),
    );
  }

   Widget _homeCardTwo(BuildContext context, AppLocalizations localizations) {
    return Center(
      child: Container(
        width: 320,
        height: 260,
        decoration: BoxDecoration(
         gradient: const LinearGradient(
            colors: [
              Color.fromARGB(180, 255, 255, 255),
              Color.fromARGB(180, 56, 120, 84),
            ],
            stops: [
              0.2,
              0.9,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow:[ BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7
          ),
          ],
           
        ),
        
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const MarketInsightsPage(),
              ),
            );
          },
          child: Column(
            children: [
              const Row(
                
                children: [
                  
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18,vertical: 18),
                    
                    child: Text(
                      'Market Insights',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,                 
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40,),
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      color: AppColors.primary,
                    ),
                  )
                ],
              ),
              
                   Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1.0),
                child: Image(image: AssetImage('assets/appimages/mi.png'),width: 280,height: 170,fit: BoxFit.cover,),
              ),
            ],
          ),
          
        ),
        
      ),
    );
  }

  Widget _homeCardThree(BuildContext context, AppLocalizations localizations) {
    return Center(
      child: Container(
        width: 320,
        height: 260,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(180, 255, 255, 255),
              Color.fromARGB(180, 56, 120, 84),
            ],
            stops: [
              0.2,
              0.9,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow:[ BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7
          )] 
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const ChatBotPage(),
              ),
            );
          },
          child: Column(
            children: [
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18,vertical: 20),
                    child: Text(
                      'Farm Assist',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,                 
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:40,),
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      color: AppColors.darkBackground,
                    ),
                  )
                ],
              ),
              
                   Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1.0),
                child: Image(image: AssetImage('assets/appimages/cb.png'),width: 280,height: 170,fit: BoxFit.cover,),
                
              ),
                ],
                
              ),
              
              
             
            
          ),
        ),
      
    );
  }

 Widget _homeCardFour(BuildContext context) {
    var weatherProvider = Provider.of<WeatherProvider>(context, listen: false);
    return FutureBuilder(
      future: _determinePosition(weatherProvider),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return GestureDetector(
            onTap: () => _onContainerTap(context),
            child: Center(
              child: Container(
                width: 320,
                height: 240,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
            colors: [
              Color.fromARGB(180, 255, 255, 255),
              Color.fromARGB(180, 56, 120, 84),
            ],
            stops: [
              0.2,
              0.9,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow:[ BoxShadow(
                    color: AppColors.primary.withOpacity(0.4),
                    spreadRadius: 5,
                    blurRadius: 7
                  )] 
                ),
                child: Consumer<WeatherProvider>(
                  builder: (context, weatherProvider, child) {
                    if (weatherProvider.loading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (weatherProvider.weather != null) {
                      return Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: -10,
                            child: Container(
                              height: 140,
                              width: 160,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'http://openweathermap.org/img/wn/${weatherProvider.weather!.icon}@2x.png',
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 30,
                            bottom: 20,
                            child: Text(
                              '${weatherProvider.weather!.cityName}',
                              style: TextStyle(fontSize: 35),
                            ),
                          ),
                          Positioned(
                            right: 30,
                            top: 30,
                            child: Text(
                              '${weatherProvider.weather!.temperature}°C',
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                          Positioned(
                            right: 30,
                            top: 100,
                            child: Text(
                              '${weatherProvider.weather!.description}',
                              style: TextStyle(fontSize: 23),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Center(child: Text('No weather data available'));
                    }
                  },
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Future<void> _determinePosition(WeatherProvider weatherProvider) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: 'Please enable Your Location Service');
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'Location permissions are denied');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(
          msg: 'Location permissions are permanently denied, we cannot request permissions.');
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);



      await weatherProvider.fetchWeatherByCoordinates(
          position.latitude, position.longitude);
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: 'Error getting location: $e');
    }
  }

  void _onContainerTap(BuildContext context) {
    var weatherProvider = Provider.of<WeatherProvider>(context, listen: false);
    if (weatherProvider.weather != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FiveDayForecastScreen(
              forecast: weatherProvider.weather!.forecast),
        ),
      );
    } else {
      Fluttertoast.showToast(msg: 'No weather data available to show');
    }
  }
}


