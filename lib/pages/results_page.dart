import 'package:flutter/material.dart';
import 'package:queda_tensao/components/base_structure.dart';
import 'package:queda_tensao/components/card_result.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseStructure(
      bodyComponent: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Resultados',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 160),
            CardResult(voltage: 127),
            const SizedBox(height: 20),
            CardResult(voltage: 220),
          ],
        ),
      ),
    );
  }
}
