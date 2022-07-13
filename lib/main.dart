import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';
import '../screens/tabs_screens.dart';
import '../screens/meal_detail_screen.dart';
import '../screens/category_meals_screen.dart';
import '../screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                bodyText2: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                headline5: const TextStyle(
                  fontSize: 20,
                  //fontWeight: FontWeight.bold,
                ),
                headline6: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
              ),
          accentColor: Colors.amber,
          canvasColor: const Color.fromRGBO(225, 254, 229, 1)),
      // home: const CategoriesScreen(),
      routes: {
        '/': (ctx) => TabsScreen(), // const CategoriesScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(
          builder: (ctx) => const CategoriesScreen(),
        );
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (ctx) => const CategoriesScreen(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deli Meals'),
      ),
      body: const Center(
        child: Text(
          'Navigation Time',
        ),
      ),
    );
  }
}
