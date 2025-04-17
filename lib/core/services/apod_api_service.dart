import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/apod.dart';

class ApodApiService {
  final String apiKey;
  final String baseUrl = 'https://api.nasa.gov/planetary/apod';

  ApodApiService({required this.apiKey});

  Future<Apod> getApod() async {
    final response = await http.get(Uri.parse('$baseUrl?api_key=$apiKey'));

    if (response.statusCode == 200) {
      return Apod.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load APOD');
    }
  }
}
