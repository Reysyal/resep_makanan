import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resep_makanan/providers/recipe_provider.dart';
import 'package:resep_makanan/screens/recipe_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RecipeProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const RecipeScreen(),
      ),
    );
  }
}
