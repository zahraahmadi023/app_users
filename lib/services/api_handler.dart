import 'package:app_users/model/user_model2.dart';
import 'package:dio/dio.dart';

class ApiHandler {
  static var dio = Dio();

  static Future<List<UserData>> fetchUsers() async {
    try {
      var response = await dio.get("https://reqres.in/api/users");

      if (response.statusCode == 200) {
        var responseData = response.data as Map<String, dynamic>;
        final List<dynamic> dataList = responseData['data'];

        List<UserData> tempList = [];

        tempList = dataList.map((item) => UserData.fromJson(item)).toList();
        print(tempList);

        return tempList;
      } else {
        throw Exception("failed to load users");
      }
    } catch (e) {
      print("Error: $e");
      throw Exception("error to load users");
    }
  }
}
