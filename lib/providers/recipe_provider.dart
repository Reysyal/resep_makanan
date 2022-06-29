import 'package:flutter/material.dart';
import 'package:resep_makanan/models/recipe_model.dart';
import 'package:resep_makanan/services/recipe_service.dart';

class RecipeProvider extends ChangeNotifier {
  final RecipeService _resepService = RecipeService();
  late List<Results> _recipeModel;
  bool _loading = true;

  bool get loading => _loading;
  List<Results> get recipeModel => _recipeModel;

  RecipeProvider() {
    _fetchData();
    notifyListeners();
  }

  _fetchData() async {
    _recipeModel = await _resepService.getRecipes();
    toggleLoading();
    notifyListeners();
  }

  toggleLoading() {
    _loading = !_loading;
    notifyListeners();
  }

  getRecipeCount() {
    return _recipeModel.length;
  }
}
