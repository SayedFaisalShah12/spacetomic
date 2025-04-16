import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/neows.dart';

class NeoApiService {
  final String apiKey;
  final String baseUrl = 'https://api.nasa.gov/neo/rest/v1';

  NeoApiService({required this.apiKey});

  Future<Neows> getNearEarthObjects() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/neo/browse?api_key=$apiKey'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return Neows.fromJson(data);
      } else {
        throw Exception('Failed to load NEO data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching NEO data: $e');
    }
  }
}
