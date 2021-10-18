import 'package:flutter/material.dart';

class BaseStructure extends StatelessWidget {
  final Widget bodyComponent;

  BaseStructure({ required this.bodyComponent });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Queda de Tensão'),
        centerTitle: true,
      ),
      body: bodyComponent,
    );
  }
}