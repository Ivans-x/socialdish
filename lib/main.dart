import 'package:flutter/material.dart';
import 'package:fooderlich/fooderlich_theme.dart';

void main() {
  // 1
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  // 2
  const Fooderlich({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.dark();
    // TODO: Apply Home widget
    // 3
    return MaterialApp(
      // TODO: Add theme
      title: 'Fooderlich',
      // 4
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // TODO: Style the title
        appBar: AppBar(
          title: Text('Fooderlich', style: theme.textTheme.titleLarge),
          centerTitle: true,
        ),
        // TODO: Style the body text
        body: Center(
          child: Text(
            'Let\'s get cooking 👩‍🍳 ',
            style: theme.textTheme.displayLarge,
          ),
        ),
      ),
    );
  }
}
