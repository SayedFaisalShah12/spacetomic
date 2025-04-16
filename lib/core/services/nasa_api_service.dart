import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/apod.dart';

class NasaApiService {
  static const String _baseUrl = 'https://api.nasa.gov';
  static const String _apiKey = 'Pf2TcinqpQ73mlFDqxlfPV6Zam9TueAPFHv5hbGv';

  Future<APOD> getAstronomyPictureOfTheDay() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/planetary/apod?api_key=$_apiKey'),
      );

      if (response.statusCode == 200) {
        return APOD.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load APOD: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load APOD: $e');
    }
  }
}
