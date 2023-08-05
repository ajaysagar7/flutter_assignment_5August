import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateProvider with ChangeNotifier {
  String? _mainheading = "";
  String? _queston = "";
  String? _description = "";
  String? _hintText = "";

  String? get mainheadingText => _mainheading;
  String? get question => _queston;
  String? get description => _description;
  String? get hintText => _hintText;

  setMainHeading({required String text}) {
    _mainheading = text;
    notifyListeners();
  }

  setQuestionValue({required String text}) {
    _queston = text;
    notifyListeners();
  }

  setDescriptionValue({required String text}) {
    _description = text;
    notifyListeners();
  }

  setHintText({required String text}) {
    _hintText = text;
    notifyListeners();
  }

  DateTime? _selectedDate;
  DateTime? get selectedDateTime => _selectedDate;

  final TextEditingController _dateController = TextEditingController();
  TextEditingController get dateController => _dateController;

  void pickDate({required BuildContext context}) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1800),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      _selectedDate = pickedDate;
      _dateController.text = DateFormat.yMd().format(pickedDate);
      // _dateController. = DateFormat.yMd().format(pickedDate);

      notifyListeners();
    }
    checkIsScreenValid();
  }

  resetDateTime() {
    _selectedDate = null;
    _mainheading = "";
    _queston = "";
    _description = "";
    _hintText = "";
    _dateController.text = "";
    _isScreenValid = false;

    notifyListeners();
  }

  dispostController() {
    _dateController.dispose();
    notifyListeners();
  }

  bool _isScreenValid = false;
  bool get isScreenValid => _isScreenValid;

  checkIsScreenValid() {
    if (_selectedDate != null) {
      _isScreenValid = true;
    } else {
      _isScreenValid = false;
    }
    notifyListeners();
  }
}
