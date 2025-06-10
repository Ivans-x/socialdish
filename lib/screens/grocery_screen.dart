import 'package:flutter/material.dart';
import 'package:fooderlich/models/grocery_manager.dart';
import 'package:fooderlich/screens/grocery_items_screen.dart';

import 'package:provider/provider.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.green);
  }

  Widget buildGroceryScreen() {
    return Consumer<GroceryManager>(
      builder: (context, manager, child) {
        if (manager.groceryItems.isNotEmpty) {
          return Text('shi is not empty');
        } else {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                final manager = Provider.of<GroceryManager>(
                  context,
                  listen: false,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => GroceryItemsScreen(
                          onCreate: (item) {
                            manager.addItem(item);
                            Navigator.pop(context);
                          },
                          onUpdate: (item) {},
                        ),
                  ),
                );
              },
              child: const Icon(Icons.add),
            ),
            body: buildGroceryScreen(),
          );
        }
      },
    );
  }
}
