import 'dart:convert';
import 'package:Payirseai/presentation/choose_module/pages/weather/weather.dart';
import 'package:http/http.dart' as http;


class WeatherService {
  final String apiKey = '43981b6ba96676ad3b169fe7e8b024c1';
  final String baseUrl = 'https://api.openweathermap.org/data/2.5';

  Future<Weather> fetchWeatherByCoordinates(double latitude, double longitude) async {
    final url =
        '$baseUrl/weather?lat=$latitude&lon=$longitude&units=metric&appid=$apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final forecast = await fetchFiveDayForecast(latitude, longitude);
      return Weather(
        cityName: data['name'],
        temperature: data['main']['temp'],
        description: data['weather'][0]['description'],
        icon: data['weather'][0]['icon'],
        forecast: forecast,
      );
    } else {
      throw Exception('Failed to load weather data: ${response.reasonPhrase}');
    }
  }

  Future<List<Forecast>> fetchFiveDayForecast(double latitude, double longitude) async {
    final url =
        '$baseUrl/forecast?lat=$latitude&lon=$longitude&units=metric&appid=$apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<Forecast> forecast = [];

      for (var item in data['list']) {
        final date = item['dt_txt'];
        final temp = item['main']['temp'];
        final desc = item['weather'][0]['description'];
        final icon = item['weather'][0]['icon'];

        forecast.add(Forecast(
            date: date, temperature: temp, description: desc, icon: icon));
      }

      return forecast;
    } else {
      throw Exception('Failed to load forecast data: ${response.reasonPhrase}');
    }
  }
}
