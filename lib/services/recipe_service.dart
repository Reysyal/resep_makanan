import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:resep_makanan/models/recipe_model.dart';
import 'package:resep_makanan/static/static_values.dart';

class RecipeService {
  Future<List<Results>> getRecipes() async {
    try {
      final response = await http.get(
        Uri.parse('https://$kApiURLDomain/$kApiEndPointRecipe?apiKey=$kApiKey'),
      );

      if (response.statusCode == 200) {
        final parsed = json.decode(response.body);
        return RecipeModel.fromJson(parsed).results!;
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception('Failed to get the recipes: $e');
    }
  }
}
