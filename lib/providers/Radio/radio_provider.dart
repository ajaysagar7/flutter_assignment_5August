import 'package:flutter/material.dart';

class RadioProvder with ChangeNotifier {
  String _question = "";
  String _descripTion = "";
  String get question => _question;
  String get description => _descripTion;

  setQuestioinValue({required String value}) {
    _question = value;
    notifyListeners();
  }

  setDescriptionvalue({required String value}) {
    _descripTion = value;
    notifyListeners();
  }

  List<String> _radioTitles = [];
  List<String> get radioTitles => _radioTitles;

  List<String> _radioValues = [];
  List<String> get radioValues => _radioValues;

  setRadioTitles({required String values}) {
    _radioTitles.add(values);
    // _radioTitles = values;
    notifyListeners();
  }

  setRadioValues({required String values}) {
    _radioValues.add(values);

    notifyListeners();
  }

  // int _selectedIndex = -1;
  // int get selectedIndex => _selectedIndex;

  // setSelectedIndex({required int index}) {
  //   _selectedIndex = index;
  //   notifyListeners();
  //   checkRadioScreenValidOrnOt();
  // }

  String _selectedRadioValue = "";
  String get selectedRadioValue => _selectedRadioValue;

  setRadioValue({required String value}) {
    _selectedRadioValue = value;
    notifyListeners();
    checkRadioScreenValidOrnOt();
  }

  bool _isRadioScrenValid = false;
  bool get isRadioScreenValid => _isRadioScrenValid;

  checkRadioScreenValidOrnOt() {
    if (_selectedRadioValue.isNotEmpty) {
      _isRadioScrenValid = true;
    } else {
      _isRadioScrenValid = false;
    }
    notifyListeners();
  }

  resetRadioScrenValidation() {
    _selectedRadioValue = "";
    _radioTitles = [];
    _radioValues = [];
    notifyListeners();
  }
}
