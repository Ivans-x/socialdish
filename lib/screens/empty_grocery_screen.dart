import 'package:flutter/material.dart';

class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.00),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.asset('assets/fooderlich_assets/empty_list.png'),
            ),
          ),
          const Text("NO GROCERIES", style: TextStyle(fontSize: 21.00)),
          const SizedBox(height: 16.00),
          const Text(
            'SHOPPING FOR INGREDIENTS ??\n'
            'Tap the + button to write them down',
            textAlign: TextAlign.center,
          ),
          MaterialButton(
            textColor: Colors.white,
            color: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.00),
            ),
            child: const Text('Browse Recipes'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
