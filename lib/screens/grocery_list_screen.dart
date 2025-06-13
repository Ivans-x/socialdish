import 'package:flutter/material.dart';
import 'package:fooderlich/components/grocery_tile.dart';
import 'package:fooderlich/models/models.dart';
import 'package:fooderlich/screens/grocery_item_screen.dart';

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
          return Dismissible(
            onDismissed: (direction) {
              manager.deleteItem(index);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('${item.name} dismissed')));
            },
            key: Key(item.id),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: const Icon(
                Icons.delete_forever,
                color: Colors.white,
                size: 50.00,
              ),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return GroceryItemScreen(
                        originalItem: item,
                        onCreate: (item) {},
                        onUpdate: (item) {
                          manager.updateItem(item, index);
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                );
              },
              child: GroceryTile(
                key: Key(item.id),
                item: item,
                onComplete: (change) {
                  if (change != null) {
                    manager.completeItem(index, change);
                  }
                },
              ),
            ),
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
