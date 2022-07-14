import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  //const MyWidget({Key? key}) : super(key: key);
  static const routeName = '/category-meals';

  final List<Meal> avaibleMeals;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  CategoryMealsScreen(this.avaibleMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  // final String categoryId;
  late String categoryTitle;
  late List<Meal> displayedMeals;
  //Može i bez ove provjere jer koristi -lete- ključnu riječ ispred promjenjivih
  // ignore: prefer_final_fields
  var _loadedInitData = false;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // ignore: todo
    // TODO: implement didChangeDependencies
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'] as String;
      displayedMeals = widget.avaibleMeals.where(
        (meal) {
          return meal.categories.contains(categoryId);
        },
      ).toList();
    }
    super.didChangeDependencies();
  }

  // void _removeMeal(String mealId) {
  //   setState(() {
  //     displayedMeals.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            duration: displayedMeals[index].duration,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
