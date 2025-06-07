import 'package:flutter/material.dart';
import 'package:fooderlich/api/mock_fooderlich_service.dart';
import 'package:fooderlich/components/today_recipe_list_view.dart';
import 'package:fooderlich/models/models.dart';

class ExploreScreen extends StatelessWidget {
  final mockService = MockFooderlichService();
  ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final recipes = snapshot.data?.todayRecipes ?? [];
          return SizedBox(
            height:
                MediaQuery.of(context).size.height -
                88, // Account for AppBar and padding
            child: TodayRecipeListView(recipes: recipes),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
