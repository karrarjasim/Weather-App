import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:wather_app/api/constraints.dart';
import 'package:wather_app/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherProvider() {
    fetchData();
  }

  Weather _weather;

  Weather get allData => _weather;
  setWeather(Weather data) {
    _weather=(data);
    notifyListeners();
  }

  Future fetchData() async {
    Weather weatherData;
    var response = await http.get(
    'http://api.weatherstack.com/current?access_key=$api_key&query=fetch:ip');
    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      var weatherDecode = json.decode(response.body);
      weatherData=Weather.fromJson(weatherDecode);
      setWeather(weatherData);
      return weatherData;
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
