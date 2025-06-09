import 'package:flutter/material.dart';
import 'package:fooderlich/models/models.dart';

class RecipeThumbnail extends StatelessWidget {
  final SimpleRecipe recipe;
  const RecipeThumbnail({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.00),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              child: Image.asset(recipe.dishImage, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            recipe.title,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            recipe.duration,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
