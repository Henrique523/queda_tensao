import 'package:flutter/material.dart';
import 'package:queda_tensao/components/base_structure.dart';

class CableInfo extends StatelessWidget {
  String dropdownValue = 'Monofásico';

  @override
  Widget build(BuildContext context) {
    return BaseStructure(
      bodyComponent: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text(
                'Selecione as opções para o cabo selecionado.',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: dropdownValue,
              items: ['Monofásico', 'Trifásico']
                  .map(
                    (element) => DropdownMenuItem<String>(
                      child: Text(element),
                      value: element,
                    ),
                  )
                  .toList(),
              onChanged: (value) { },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
