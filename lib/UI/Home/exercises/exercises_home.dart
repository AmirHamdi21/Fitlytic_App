import 'package:fitlytic/UI/Home/exercises/exercises_ui.dart';
import 'package:fitlytic/constants/custom_colors.dart';
import 'package:fitlytic/constants/exercises/exercises_home_constant.dart';
import 'package:flutter/material.dart';


class CategoryCard extends StatelessWidget {
  final WorkoutCategory category;

  const CategoryCard({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to the category-specific exercise screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExerciseCategoryScreen(
              categoryTitle: category.title,
              exercises: getExercisesForCategory(category.title),
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(12), // Match container's border radius
      child: Container(
        decoration: BoxDecoration(
          gradient: MyColors.customGradient2,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: category.color,
                  width: 2,
                ),
              ),
              child: Icon(
                category.icon,
                color: category.color,
                size: 28,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              category.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}