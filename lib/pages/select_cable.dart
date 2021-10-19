import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queda_tensao/components/base_structure.dart';
import 'package:queda_tensao/providers/calc_data.dart';
import 'package:queda_tensao/utils/app_routes.dart';

class SelectCable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String _alluminiumPath = 'assets/images/cabo_aluminio.jpeg';
    final String _cupperPath = 'assets/images/cabo_cobre.jpg';

    return BaseStructure(
      bodyComponent: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Primeiro, selecione o cabo',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _cableButton(context, _alluminiumPath, CableType.ALLUMINIUM),
                _cableButton(context, _cupperPath, CableType.CUPPER),
              ],
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(14),
                ),
                onPressed: () =>
                    Navigator.of(context).pushNamed(AppRoutes.CABLE_INFO),
                child: const Text(
                  'Próximo',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cableButton(BuildContext context, String image, CableType cableType) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          cableType == CableType.ALLUMINIUM ? 'Alumínio' : 'Cobre',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Image.asset(
          image,
          width: MediaQuery.of(context).size.width * 0.35,
          height: MediaQuery.of(context).size.width * 0.35,
        ),
        Consumer<CalcData>(
          builder: (ctx, calcData, child) => TextButton.icon(
            onPressed: () => Provider.of<CalcData>(context, listen: false)
                .setCableType(cableType),
            icon: Icon(calcData.cableType == cableType
                ? Icons.check_box_outlined
                : Icons.check_box_outline_blank),
            label: const Text('Selecionar'),
            style: TextButton.styleFrom(
              primary: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
