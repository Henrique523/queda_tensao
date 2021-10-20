import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queda_tensao/providers/calc_data.dart';

class CardResult extends StatelessWidget {
  final int voltage;

  CardResult({
    required this.voltage
  });
  @override
  Widget build(BuildContext context) {
    return Consumer<CalcData>(
      builder: (ctx, calcData, child) => Container(
        width: double.infinity,
        height: 120,
        child: Card(
          elevation: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Queda de Tensão para ${voltage}V",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "${voltage == 127 
                      ? calcData.voltageFallPercentage127.toStringAsFixed(2) 
                      : calcData.voltageFallPercentage220.toStringAsFixed(2)}%",
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
