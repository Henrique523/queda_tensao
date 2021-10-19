import 'package:flutter/material.dart';

enum CableType {
  CUPPER,
  ALLUMINIUM,
}

class CalcData with ChangeNotifier {
  CableType _cableType = CableType.CUPPER;
  String _numberOfPhases = 'Monofásico';
  String _cableSection = '2.5';

  CableType get cableType => this._cableType;
  String get numberOfPhases => this._numberOfPhases;
  String get cableSection => this._cableSection;

  void setCableType(CableType cableType) {
    this._cableType = cableType;
    print(this._cableType);
    notifyListeners();
  }

  void setNumberOfPhases(String? value) {
    this._numberOfPhases = value ?? 'Monofásico';
    notifyListeners();
  }

  void setCableSection(String? value) {
    this._cableSection = value ?? '2.5';
  }
}
