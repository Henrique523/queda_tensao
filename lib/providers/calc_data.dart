import 'package:flutter/material.dart';
import 'package:queda_tensao/data/cables/aluminium.dart' as alluminium;
import 'package:queda_tensao/data/cables/cupper.dart' as cupper;

enum CableType {
  CUPPER,
  ALLUMINIUM,
}

class CalcData with ChangeNotifier {
  CableType _cableType = CableType.CUPPER;
  String _numberOfPhases = 'Monofásico';
  String _cableSection = '2.5';
  double _cableLength = 0;

  double _tensionFallPercentage = 0;

  CableType get cableType => this._cableType;
  String get numberOfPhases => this._numberOfPhases;
  String get cableSection => this._cableSection;
  double get cableLength => this._cableLength;
  double get tensionFallPercentage => this._tensionFallPercentage;

  void setCableType(CableType cableType) {
    this._cableType = cableType;
    this._cableType == CableType.CUPPER ? setCableSection('2.5') : setCableSection('16');

    notifyListeners();
  }

  void setNumberOfPhases(String? value) {
    this._numberOfPhases = value ?? 'Monofásico';
    notifyListeners();
  }

  void setCableSection(String? value) {
    this._cableSection = value ?? '2.5';
    notifyListeners();
  }

  void setCableLength(String value) {
    this._cableLength = double.parse(value);
    notifyListeners();
  }

  void calculateTensionFallPercentage() {
    String _phasesNumber = numberOfPhases == 'Monofásico' ? 'twoChargedCircuits' : 'threeChargedCircuits';
    int _acValue = cableType == CableType.ALLUMINIUM
      ? alluminium.infoDiameterCables.firstWhere((element) => element['diameter'] == int.parse(cableSection))[_phasesNumber]
      : cupper.infoDiameterCables.firstWhere((element) => element['diameter'] == int.parse(cableSection))[_phasesNumber];

    final testNumber = double.tryParse(this.cableSection.toString());
    num _resistivity = cableType == CableType.ALLUMINIUM ? alluminium.alluminiumResistivity : cupper.cupperResistivity;


    print(_acValue);
  }
}
