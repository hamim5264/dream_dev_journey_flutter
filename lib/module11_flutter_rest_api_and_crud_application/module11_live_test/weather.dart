import 'package:dream_dev_journey_flutter/module11_flutter_rest_api_and_crud_application/module11_live_test/weather_data.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      DemoWeatherApp(),
    );

class DemoWeatherApp extends StatelessWidget {
  DemoWeatherApp({super.key});

  final List<WeatherData> cities = [
    WeatherData(
      city: "New York",
      temperature: 20,
      condition: "Clear",
      humidity: 60,
      windSpeed: 5.5,
    ),
    WeatherData(
      city: "Los Angeles",
      temperature: 25,
      condition: "Sunny",
      humidity: 50,
      windSpeed: 6.8,
    ),
    WeatherData(
      city: "London",
      temperature: 15,
      condition: "Partly Cloudy",
      humidity: 70,
      windSpeed: 4.2,
    ),
    WeatherData(
      city: "Tokyo",
      temperature: 28,
      condition: "Rainy",
      humidity: 75,
      windSpeed: 8.0,
    ),
    WeatherData(
      city: "Sydney",
      temperature: 22,
      condition: "Cloudy",
      humidity: 55,
      windSpeed: 7.3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Weather Info App',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
          itemCount: cities.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(
                  "City: ${cities[index].city}",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: Text(
                  'Temperature: ${cities[index].temperature}°C\n'
                  'Condition: ${cities[index].condition}\n'
                  'Humidity: ${cities[index].humidity}%\n'
                  'Wind Speed: ${cities[index].windSpeed} km/h',
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
