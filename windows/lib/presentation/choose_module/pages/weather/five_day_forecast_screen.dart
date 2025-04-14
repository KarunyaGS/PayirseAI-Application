import 'package:Payirseai/presentation/choose_module/pages/weather/weather.dart';
import 'package:flutter/material.dart';


class FiveDayForecastScreen extends StatelessWidget {
  final List<Forecast> forecast;

  FiveDayForecastScreen({required this.forecast});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('5-Day Forecast'),
      ),
      body: ListView.builder(
        itemCount: forecast.length,
        itemBuilder: (context, index) {
          final day = forecast[index];
          return Card(
            child: ListTile(
              leading: Image.network(
                  'http://openweathermap.org/img/wn/${day.icon}@2x.png'),
              title: Text(day.date),
              subtitle: Text('${day.temperature}°C, ${day.description}'),
            ),
          );
        },
      ),
    );
  }
}
