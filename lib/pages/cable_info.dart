import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queda_tensao/components/base_structure.dart';
import 'package:queda_tensao/components/custom_dropdown_button.dart';
import 'package:queda_tensao/data/cables/aluminium.dart' as alluminium;
import 'package:queda_tensao/data/cables/cupper.dart' as cupper;
import 'package:queda_tensao/providers/calc_data.dart';

class CableInfo extends StatefulWidget {
  @override
  _CableInfoState createState() => _CableInfoState();
}

class _CableInfoState extends State<CableInfo> {
  bool _isLoading = false;

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
    setState(() {
      this._isLoading = !this._isLoading;
    });

    Provider.of<CalcData>(context, listen: false).calculateTensionFallPercentage();
    return;
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
            const SizedBox(height: 20),
            Consumer<CalcData>(
              builder: (ctx, calcData, child) => TextFormField(
                initialValue: '',
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  labelText: 'Comprimento do cabo',
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
            Expanded(
              child: Container(
                child: _isLoading 
                  ? Center(
                    child: CircularProgressIndicator(),
                  ) 
                  : null,
              ),
            ),
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
    );
  }
}
