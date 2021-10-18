import 'package:flutter/material.dart';

enum CableType {
  CUPPER,
  ALLUMINIUM,
}

class CalcData with ChangeNotifier {
  CableType _cableType = CableType.CUPPER;

  CableType get cableType {
    return this._cableType;
  }

  void setCableType(CableType cableType) {
    this._cableType = cableType;
    notifyListeners();
  }
}
