import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queda_tensao/components/base_structure.dart';
import 'package:queda_tensao/components/custom_dropdown_button.dart';
import 'package:queda_tensao/data/cables/aluminium.dart' as alluminium;
import 'package:queda_tensao/data/cables/cupper.dart' as cupper;
import 'package:queda_tensao/providers/calc_data.dart';

class CableInfo extends StatelessWidget {
  List<String> cableSections(BuildContext context) {
    return Provider.of<CalcData>(context).cableType == CableType.CUPPER
      ? alluminium.infoDiameterCables.map((item) => item['diameter'].toString()).toList()
      : cupper.infoDiameterCables.map((item) => item['diameter'].toString()).toList();
  }

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
            const SizedBox(height: 40),
            Consumer<CalcData>(
              builder: (ctx, calcData, child) => CustomDropdownButton(
                dropdownValue: calcData.numberOfPhases,
                itemsList: ['Monofásico', 'Trifásico'],
                label: 'Nº de fases',
                onChanged: calcData.setNumberOfPhases,
              ),
            ),
            const SizedBox(height: 20),
            Consumer<CalcData>(
              builder: (ctx, calcData, child) => CustomDropdownButton(
                dropdownValue: calcData.cableSection,
                itemsList: cableSections(context),
                label: 'Sessão do cabo',
                onChanged: calcData.setNumberOfPhases,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
