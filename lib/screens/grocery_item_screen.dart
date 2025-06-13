// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:fooderlich/components/grocery_tile.dart';
import 'package:fooderlich/models/models.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class GroceryItemScreen extends StatefulWidget {
  final Function(GroceryItem) onCreate;
  final Function(GroceryItem) onUpdate;
  final GroceryItem? originalItem;
  final bool isUpdating;

  const GroceryItemScreen({
    super.key,
    required this.onCreate,
    required this.onUpdate,
    this.originalItem,
  }) : isUpdating = (originalItem != null);

  @override
  State<GroceryItemScreen> createState() => _GroceryItemsScreenState();
}

class _GroceryItemsScreenState extends State<GroceryItemScreen> {
  final _nameController = TextEditingController();
  String _name = '';
  Importance _importance = Importance.low;
  DateTime _dueDate = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();
  Color _currentColor = Colors.green;
  int _currentSliderValue = 0;

  @override
  void initState() {
    final originalItem = widget.originalItem;
    if (originalItem != null) {
      _nameController.text = originalItem.name;
      _name = originalItem.name;
      _currentSliderValue = originalItem.quantity;
      _importance = originalItem.importance;
      _currentColor = originalItem.color;
      final date = originalItem.date;
      _timeOfDay = TimeOfDay(hour: date.hour, minute: date.minute);
      _dueDate = date;
    }

    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              //TODO: Add a callback handler
            },
            icon: Icon(Icons.check),
          ),
        ],
        elevation: 0.00,
        title: Text(
          'Grocery Item',
          style: GoogleFonts.lato(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16.00),
        child: ListView(
          children: [
            buildNameField(),
            buildImportanceField(),
            buildDateField(context),
            buildTimeField(context),
            const SizedBox(height: 10.00),
            buildColorPicker(context),
            const SizedBox(height: 10.0),
            buildQuantityField(),
            GroceryTile(
              item: GroceryItem(
                id: 'Preview Mode',
                name: _name,
                importance: _importance,
                color: _currentColor,
                quantity: _currentSliderValue,
                date: DateTime(
                  _dueDate.year,
                  _dueDate.month,
                  _dueDate.day,
                  _dueDate.hour,
                  _dueDate.minute,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Item Name', style: GoogleFonts.lato(fontSize: 28.00)),
        TextField(
          controller: _nameController,
          cursorColor: _currentColor,
          decoration: InputDecoration(
            hintText: 'E.G Apples , Banana , Bag of salt',
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: _currentColor),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: _currentColor),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildImportanceField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Importance', style: GoogleFonts.lato(fontSize: 28.00)),
        Wrap(
          spacing: 10.00,
          children: [
            ChoiceChip(
              label: Text('Low', style: GoogleFonts.lato(color: Colors.white)),
              selected: _importance == Importance.low,
              onSelected: (selected) {
                setState(() {
                  _importance = Importance.low;
                });
              },
              selectedColor: Colors.black,
            ),
            ChoiceChip(
              label: Text('Medium', style: TextStyle(color: Colors.white)),
              selected: _importance == Importance.medium,
              onSelected: (selected) {
                setState(() {
                  _importance = Importance.medium;
                });
              },
              selectedColor: Colors.black,
            ),
            ChoiceChip(
              label: Text('High', style: GoogleFonts.lato(color: Colors.white)),
              selected: _importance == Importance.high,
              onSelected: (selected) {
                setState(() {
                  _importance = Importance.high;
                });
              },
              selectedColor: Colors.black,
            ),
          ],
        ),
      ],
    );
  }

  Widget buildDateField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Date', style: GoogleFonts.lato(fontSize: 28.00)),
            TextButton(
              onPressed: () async {
                final currentDate = DateTime.now();
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: currentDate,
                  lastDate: DateTime(currentDate.year + 5),
                );
                setState(() {
                  if (selectedDate != null) {
                    _dueDate = selectedDate;
                  }
                });
              },
              child: const Text('select'),
            ),
          ],
        ),
        Text(DateFormat('yyyy-MM-dd').format(_dueDate)),
      ],
    );
  }

  Widget buildTimeField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Time Of Day', style: GoogleFonts.lato(fontSize: 28.00)),
            TextButton(
              onPressed: () async {
                final timeOfDay = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (timeOfDay != null) {
                  setState(() {
                    _timeOfDay = timeOfDay;
                  });
                }
              },
              child: const Text('Select'),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildColorPicker(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Row(
              children: [
                Container(height: 50.00, width: 10.00, color: _currentColor),
                const SizedBox(width: 8.00),
                Text('Color', style: GoogleFonts.lato(fontSize: 28.00)),
              ],
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: BlockPicker(
                    pickerColor: Colors.white,
                    onColorChanged: (color) {
                      setState(() {
                        _currentColor = color;
                      });
                    },
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Save'),
                    ),
                  ],
                );
              },
            );
          },
          child: Text('Select'),
        ),
      ],
    );
  }

  Column buildQuantityField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text('Quantity', style: GoogleFonts.lato(fontSize: 28.00)),
            const SizedBox(width: 16.00),
            Text(
              _currentSliderValue.toString(),
              style: GoogleFonts.lato(fontSize: 18.00),
            ),
          ],
        ),
        Slider(
          value: _currentSliderValue.toDouble(),
          min: 0,
          max: 100,
          divisions: 100,
          label: _currentSliderValue.toString(),
          activeColor: _currentColor,
          inactiveColor: _currentColor.withOpacity(0.5),
          onChanged: (double newValue) {
            setState(() {
              _currentSliderValue = newValue.round();
            });
          },
        ),
      ],
    );
  }
}
