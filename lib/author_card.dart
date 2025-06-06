import 'package:flutter/material.dart';
import 'package:fooderlich/fooderlich_theme.dart';
import 'circle_image.dart';

class AuthorCard extends StatelessWidget {
  const AuthorCard({
    super.key,
    required this.authorName,
    required this.title,
    this.imageProvider,
  });
  final String authorName;
  final String title;
  final ImageProvider? imageProvider;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.00),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleImage(imageRadius: 28, imageProvider: imageProvider),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                authorName,
                style: FooderlichTheme.lightTextTheme.displayMedium,
              ),
              Text(title, style: FooderlichTheme.lightTextTheme.displaySmall),
            ],
          ),
          IconButton(
            onPressed: () {
              const snackBar = SnackBar(content: Text('Favorite pressed'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            iconSize: 30.00,
            icon: const Icon(Icons.favorite_border),
            color: Colors.grey[400],
          ),
        ],
      ),
    );
  }
}
