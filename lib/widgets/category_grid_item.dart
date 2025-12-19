import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category, required this.onSelectCategory});

  final Category category;
  final void Function() onSelectCategory;

  @override
  Widget build(context) {
    return InkWell(
      onTap: onSelectCategory,

      // my approach
      /*
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MealsScreen(
              title: category.title,
              meals: dummyMeals.where((meal) => meal.categories.contains(category.id)).toList(),
            ),
          ),
        );
        */
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [category.color.withValues(alpha: 0.55), category.color.withValues(alpha: 0.9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          category.title,
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
    );
  }
}
