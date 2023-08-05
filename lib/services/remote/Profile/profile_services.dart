import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:elred_assignment_2/models/Profile/profile_post_model.dart';
import 'package:elred_assignment_2/services/setup/error_model.dart';
import 'package:http/http.dart' as http;

class ProfileServices {
  final dio = Dio();

  Future<ApiResponseModel> postDataToServer(
      {required ProfilePostModel profilePostModel}) async {
    
    try {
      final response = await dio.post(
          "https://test1.elred.io/postUserInformation",
          data: profilePostModel.toJson());
      log(response.data.toString());
      return ApiResponseModel.withSuccess(response);
    } on DioException catch (e) {
      return ApiResponseModel.withError(e);
    }
  }

  Future<void> posttoServer() async {
    var body = {
      "name": "Test",
      "gender": "Male",
      "dob": "8/2/2023,",
      "profession": "a frontend developer",
      "skills": "h"
    };
    final url = Uri.parse("https://test1.elred.io/postUserInformation");
    final response = await http.post(url, body: jsonEncode(body));
    log(response.body.toString());

    if (response.statusCode == 200) {
      log("success");
    } else {
      log("failed");
    }
  }
}
