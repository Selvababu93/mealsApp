import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.onToggleFavorite, required this.availableMeals});

  final void Function(Meal meal) onToggleFavorite;

  // receiving filtered meals from tab screen (veg, gluten, vegan)
  final List<Meal> availableMeals;

  // to navigate to mealScreen
  void _selectCategory(BuildContext context, Category category) {
    // Filter the meals for selected category
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains((category.id)))
        .toList();
    // Filter the meals for selected category
    // final filteredMeals = dummyMeals
    //     .where((meal) => meal.categories.contains((category.id)))
    //     .toList();

    // Routing to other screen
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        // using for loop to map the each category items
        // availableCategories.map((category) => CategoryGridItem(category: category)).toList() // alternative approach
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          ),
      ],
    );
  }
}
