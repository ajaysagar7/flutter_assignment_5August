import 'dart:developer';

import 'package:elred_assignment_2/models/Profile/profile_post_model.dart';
import 'package:elred_assignment_2/services/remote/Profile/profile_services.dart';
import 'package:elred_assignment_2/services/setup/error_model.dart';
import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier {
  final profileServices = ProfileServices();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> post(
      {required ProfilePostModel profilePostModel,
      required VoidCallback successCallback}) async {
    ProfileServices().posttoServer();
    _isLoading = true;
    notifyListeners();
    ApiResponseModel apiResponseModel = await profileServices.postDataToServer(
        profilePostModel: profilePostModel);

    if (apiResponseModel.response != null) {
      if (apiResponseModel.response!.statusCode == 200) {
        _isLoading = false;
        notifyListeners();
        successCallback();
      } else {
        _isLoading = false;
        notifyListeners();
        log(apiResponseModel.error!.response.toString());
      }
    } else {
      _isLoading = false;
      notifyListeners();
      log(apiResponseModel.error!.response.toString());
    }
  }
}
