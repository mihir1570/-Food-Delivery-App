import 'package:flutter_app/data/api/api_client.dart';
import 'package:flutter_app/utils/app_constants.dart';
import 'package:get/get_connect.dart';

class UserRepo{
  final ApiClient apiClient;
  UserRepo({required this.apiClient});

  Future<Response> getUserInfo() async {
    return await apiClient.getData(AppConstants.USER_INFO_URI);
  }
}