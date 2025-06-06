import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';

class Card1 extends StatelessWidget {
  const Card1({super.key});
  final String category = "Editor's Choice ";
  final String title = "The Art of Dough";
  final String description = "Learn to make the perfect bread";
  final String chef = "Danso Evans";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16),
        constraints: const BoxConstraints.expand(width: 350.00, height: 450.00),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/mag1.png"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.00)),
        ),
        child: Stack(
          children: [
            Text(category, style: FooderlichTheme.darkTextTheme.bodyLarge),
            Positioned(
              top: 20.00,
              child: Text(
                title,
                style: FooderlichTheme.darkTextTheme.headlineSmall,
              ),
            ),
            Positioned(
              bottom: 30,
              right: 0,
              child: Text(
                description,
                style: FooderlichTheme.darkTextTheme.bodyLarge,
              ),
            ),
            Positioned(
              bottom: 10,
              right: 0,
              child: Text(chef, style: FooderlichTheme.darkTextTheme.bodyLarge),
            ),
          ],
        ),
      ),
    );
  }
}
