import 'package:flutter/material.dart';
import 'package:fooderlich/models/grocery_item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class GroceryTile extends StatelessWidget {
  final Function(bool?)? onComplete;
  final GroceryItem item;
  final TextDecoration textDecoration;
  GroceryTile({super.key, this.onComplete, required this.item})
    : textDecoration =
          (item.isComplete ? TextDecoration.lineThrough : TextDecoration.none);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.00,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(width: 5.0, color: item.color),
              SizedBox(width: 16.00),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: GoogleFonts.lato(
                      decoration: textDecoration,
                      fontSize: 21.00,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.00),
                  buildDate(),
                  const SizedBox(height: 4.00),
                  buildImportance(),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                item.quantity.toString(),
                style: GoogleFonts.lato(
                  decoration: textDecoration,
                  fontSize: 21.00,
                ),
              ),
              buildCheckBox(),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildImportance() {
    if (item.importance == Importance.low) {
      return Text('Low', style: GoogleFonts.lato(decoration: textDecoration));
    } else if (item.importance == Importance.medium) {
      return Text(
        'Medium',
        style: GoogleFonts.lato(
          fontWeight: FontWeight.w800,
          decoration: textDecoration,
        ),
      );
    } else if (item.importance == Importance.high) {
      return Text(
        'High',
        style: GoogleFonts.lato(
          fontWeight: FontWeight.w900,
          decoration: textDecoration,
        ),
      );
    } else {
      throw Exception('This importance does not exist');
    }
  }

  Widget buildDate() {
    final dateFormatter = DateFormat('MMMM dd h:mm a');
    final dateString = dateFormatter.format(item.date);
    return Text(dateString, style: TextStyle(decoration: textDecoration));
  }

  Widget buildCheckBox() {
    return Checkbox(value: item.isComplete, onChanged: onComplete);
  }
}
