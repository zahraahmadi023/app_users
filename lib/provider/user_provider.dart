import 'package:app_users/model/user_model2.dart';
import 'package:app_users/services/api_handler.dart';
import 'package:flutter/material.dart';

class UserController extends ChangeNotifier {
  bool isLoading = false;
  List<UserData> users = [];
  UserController() {
    fetchData();
  }
  Future<void> fetchData() async {
    isLoading = true;
    notifyListeners();
    users = await ApiHandler.fetchUsers();
    isLoading = false;
    notifyListeners();
  }
}
