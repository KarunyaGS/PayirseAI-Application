import 'package:flutter/material.dart';
import 'weather.dart';
import 'weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  final WeatherService _weatherService = WeatherService();
  Weather? _weather;
  bool _loading = false;
  String? _errorMessage;

  Weather? get weather => _weather;
  bool get loading => _loading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchWeatherByCoordinates(double latitude, double longitude) async {
    _loading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _weather = await _weatherService.fetchWeatherByCoordinates(latitude, longitude);
      print("Weather fetched: $_weather");
    } catch (e) {
      _errorMessage = e.toString();
      _weather = null;
      print("Error fetching weather: $e");
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
