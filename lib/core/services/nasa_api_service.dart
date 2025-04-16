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

      print('APOD API Response Status: ${response.statusCode}');
      print('APOD API Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['url'] == null) {
          throw Exception('No image URL in the response');
        }
        return APOD.fromJson(data);
      } else {
        throw Exception(
          'Failed to load APOD: ${response.statusCode} - ${response.body}',
        );
      }
    } catch (e) {
      print('Error fetching APOD: $e');
      throw Exception('Failed to load APOD: $e');
    }
  }
}
