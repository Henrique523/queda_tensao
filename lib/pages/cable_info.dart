import 'package:flutter/material.dart';
import 'package:queda_tensao/components/base_structure.dart';

class CableInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseStructure(
      bodyComponent: Center(
        child: const Text('Cabos info'),
      ),
    );
  }
}
