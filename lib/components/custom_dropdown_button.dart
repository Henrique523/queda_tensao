import 'package:flutter/material.dart';

class CustomDropdownButton extends StatelessWidget {
  final String dropdownValue;
  final List<String> itemsList;
  final void Function(String?) onChanged;
  final String label;

  CustomDropdownButton({
    required this.dropdownValue,
    required this.itemsList,
    required this.onChanged,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: dropdownValue,
      items: itemsList
          .map(
            (element) => DropdownMenuItem<String>(
              child: Text(element),
              value: element,
            ),
          )
          .toList(),
      onChanged: this.onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelText: label,
        isDense: true,
      ),
    );
  }
}
