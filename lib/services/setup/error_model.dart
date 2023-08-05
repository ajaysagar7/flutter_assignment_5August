import 'package:dio/dio.dart';

class ApiResponseModel {
  final Response? response;
  final DioException? error;
  // final dynamic error;

  ApiResponseModel(this.response, this.error);

  ApiResponseModel.withSuccess(Response responseValue)
      : response = responseValue,
        error = null;

  ApiResponseModel.withError(dynamic errorValue)
      : response = null,
        error = errorValue;
}
