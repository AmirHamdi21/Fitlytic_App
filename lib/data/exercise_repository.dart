import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/exercise_response.dart';

class ExerciseRepository {
  final String baseUrl = 'https://exercisedb-api.vercel.app/api/v1/exercises?offset=0&limit=10';

  Future<ExerciseResponse> fetchExercises() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      print(json);
      return ExerciseResponse.fromJson(json);
    } else {
      throw Exception('Failed to load exercises');
    }
  }
}
