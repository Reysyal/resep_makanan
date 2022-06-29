import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resep_makanan/providers/recipe_provider.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resep'),
        centerTitle: true,
      ),
      body: Consumer<RecipeProvider>(
        builder: (context, recipeProvider, child) {
          return recipeProvider.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(32.0),
                  itemCount: recipeProvider.getRecipeCount(),
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Image.network(
                              recipeProvider.recipeModel[index].image!,
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              recipeProvider.recipeModel[index].title!,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    height: 10.0,
                  ),
                );
        },
      ),
    );
  }
}
