import 'package:flutter/material.dart';
import 'package:restouapp/recipe.dart';
import 'package:restouapp/recipeListScreen.dart';
import 'package:restouapp/recipeScreen.dart';
import 'package:restouapp/recipeformscreen.dart';
class  salut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        initialRoute: '/',
        onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        )
    );
  }
}
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/' :
        return MaterialPageRoute(builder: (context) => RecipeListScreen());
      case '/recipe':
        var arguments = settings.arguments;
        if (arguments != null) {
          return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  RecipeScreen(arguments as Recipe),
              transitionsBuilder: (context, animation, secondaryAnimation,
                  child) {
                animation =
                    CurvedAnimation(curve: Curves.ease, parent: animation);
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              }
          );
        } else {
          return pageNotFound();
        }
      case '/newRecipe':
        return MaterialPageRoute(builder: (context) => RecipeFormScreen());
      default:
        return pageNotFound();
    }
  }

  static MaterialPageRoute pageNotFound() {
    return MaterialPageRoute(
        builder: (context) =>
            Scaffold(
                appBar: AppBar(title: Text("Error"), centerTitle: true),
                body: Center(
                  child: Text("Page not found"),
                )
            )
    );
  }
}