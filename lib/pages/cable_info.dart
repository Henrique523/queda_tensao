import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queda_tensao/components/base_structure.dart';
import 'package:queda_tensao/components/card_result.dart';
import 'package:queda_tensao/components/custom_dropdown_button.dart';
import 'package:queda_tensao/data/cables/aluminium.dart' as alluminium;
import 'package:queda_tensao/data/cables/cupper.dart' as cupper;
import 'package:queda_tensao/providers/calc_data.dart';
import 'package:queda_tensao/utils/app_routes.dart';

class CableInfo extends StatelessWidget {
  List<String> cableSections(BuildContext context) {
    return Provider.of<CalcData>(context).cableType == CableType.CUPPER
        ? cupper.infoDiameterCables
            .map((item) => item['diameter'].toString())
            .toList()
        : alluminium.infoDiameterCables
            .map((item) => item['diameter'].toString())
            .toList();
  }

  void _calculate(BuildContext context) {
    final calcData = Provider.of<CalcData>(context, listen: false);

    if (calcData.cableLength == 0) {
      return;
    }
    
    calcData.calculateTensionFallPercentage();

    Navigator.of(context).pushNamed(AppRoutes.RESULTS_PAGE);
  }

  @override
  Widget build(BuildContext context) {
    return BaseStructure(
      bodyComponent: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
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
                  onChanged: (value) => calcData.setCableSection(value),
                ),
              ),
              const SizedBox(height: 20),
              Consumer<CalcData>(
                builder: (ctx, calcData, child) => TextFormField(
                  initialValue: calcData.cableLength == 0 ? '' : calcData.cableLength.toString(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    labelText: 'Comprimento do cabo (m)',
                    isDense: true,
                  ),
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  textInputAction: TextInputAction.done,
                  onChanged: (value) =>
                      calcData.setCableLength(value.isEmpty ? '0' : value),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(14),
                  ),
                  onPressed: () => _calculate(context),
                  child: const Text(
                    'Calcular',
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
      ),
    );
  }
}
