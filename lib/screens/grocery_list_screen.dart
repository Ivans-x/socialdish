import 'package:flutter/material.dart';
import 'package:fooderlich/components/grocery_tile.dart';
import 'package:fooderlich/models/models.dart';

class GroceryListScreen extends StatelessWidget {
  final GroceryManager manager;
  const GroceryListScreen({super.key, required this.manager});

  @override
  Widget build(BuildContext context) {
    final groceryItems = manager.groceryItems;
    return Padding(
      padding: const EdgeInsets.all(16.00),
      child: ListView.separated(
        itemBuilder: (context, int index) {
          final item = groceryItems[index];
          return GroceryTile(
            key: Key(item.id),
            item: item,
            onComplete: (change) {
              if (change != null) {
                manager.completeItem(index, change);
              }
            },
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16.0);
        },
        itemCount: groceryItems.length,
      ),
    );
  }
}
