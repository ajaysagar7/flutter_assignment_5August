import 'package:flutter/material.dart';

import '../../models/widget_model.dart';

class ProfessionsProvider with ChangeNotifier {
  String? _appbarTitle = "";
  String? _question = "";

  String? get appbarTitle => _appbarTitle;
  String? get question => _question;

  // Setter methods
  void setAppbarTitle(String value) {
    _appbarTitle = value;
  }

  void setQuestion(String value) {
    _question = value;
  }

  // Method to reset all values
  void resetAllValues() {
    _appbarTitle = "";
    _question = "";
    _selectedRadioValue = "";
    _isScreenValid = false;
  }

  List<Options> _option = [];
  List<Options> get options => _option;

  setOption({required List<Options> value}) {
    _option = value;

    notifyListeners();
  }

  String? _selectedRadioValue = "";
  String? get selectedRadioValue => _selectedRadioValue;

  setRadioValue({required String value}) {
    _selectedRadioValue = value;
    checkIsScreenValidOrNot();
    notifyListeners();
  }

  bool _isScreenValid = false;
  bool get isScreenValid => _isScreenValid;
  checkIsScreenValidOrNot() {
    if (_selectedRadioValue!.isNotEmpty) {
      _isScreenValid = true;
    } else {
      _isScreenValid = false;
    }
    notifyListeners();
  }
}
