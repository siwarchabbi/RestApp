import 'package:flutter/material.dart';
import 'package:restouapp/recipeBox.dart';
import 'package:restouapp/Login.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RecipeBox.init();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  static final String title = 'Filter & Search ListView';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        initialRoute: '/',
      home: LoginScreen (),

    );
  }
}
