import 'package:elred_assignment_2/models/Validation/validatioin_model.dart';
import 'package:flutter/material.dart';

class HomeScreenProvider with ChangeNotifier {
  String? _nameSubHeading = "";
  String? _nameHintText = "";
  String? _nameMainHeading = "";

  String? get questionText => _nameSubHeading;
  String? get hintText => _nameHintText;
  String? get mainHeading => _nameMainHeading;

  void setQuestionText({required String value}) {
    _nameSubHeading = value;
    notifyListeners();
  }

  void setHintText({required String value}) {
    _nameHintText = value;
    notifyListeners();
  }

  void setHeading({required String value}) {
    _nameMainHeading = value;
    notifyListeners();
  }

  resetValues() {
    _nameHintText = "";
    _nameMainHeading = "";
    _nameSubHeading = "";
    show();
  }

  bool _showButton = false;
  bool get showButton => _showButton;

  show() {
    _showButton = true;
    notifyListeners();
  }

  hide() {
    _showButton = false;
    notifyListeners();
  }

  //! text-field-validation
  ValidationModel _nameValidation = ValidationModel();
  ValidationModel get nameValidatioin => _nameValidation;

  onChanged({required String value}) {
    hide();
    if (value.isNotEmpty) {
      _nameValidation = ValidationModel(value: value);
    } else {
      _nameValidation = ValidationModel(error: "please enter name");
    }
    notifyListeners();
    checkHomeScreenisValidorNot();
    show();
  }

  bool _isHomeScreenValid = false;
  bool get isHomeScreenValid => _isHomeScreenValid;

  void checkHomeScreenisValidorNot() {
    if (_nameValidation.error!.isEmpty) {
      _isHomeScreenValid = true;
    } else {
      _isHomeScreenValid = false;
    }
  }
}
