import 'package:fixhome/src/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService {
  UserService();

  Future<List<User>?> getUser() async {
    List<User> result = [];
    try {
      var url = Uri.parse('https://fixhome-278cf.web.app/api/user');
      var response = await http.get(url);
      if (response.body.isEmpty) return result;
      List<dynamic> listBody = json.decode(response.body);
      for (var item in listBody) {
        var usuario = User.fromJson(item);
        result.add(usuario);
      }
      return result;
    } catch (ex) {
      // ignore: avoid_print
      print(ex);
      return null;
    }
  }
}
