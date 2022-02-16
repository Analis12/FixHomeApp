import 'dart:convert';

import 'package:fixhome/src/models/user_model.dart';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;

class UsuarioService {
  UsuarioService();

  final String _urlRoot = "https://fixhome-278cf.web.app/api/registro";
  final String _firebaseAPIKey = 'AIzaSyDRNRfuL6aTiBEGjf_pBGN6uGWsezEJLCw';

  Future<Map<String, dynamic>> login(User usuario) async {
    try {
      final loginBody = {
        "email": usuario.email,
        "password": usuario.password,
        "returnSecureToken": true
      };

      final queryParams = {"key": _firebaseAPIKey};
      var uri = Uri.https("www.googleapis.com",
          "/identitytoolkit/v3/relyingparty/verifyPassword", queryParams);
      var response = await http.post(uri, body: json.encode(loginBody));

      if (response.body.isEmpty) return <String, dynamic>{};
      Map<String, dynamic> decodedResp = json.decode(response.body);
      developer.log(decodedResp.toString());
      return decodedResp;
    } catch (e) {
      developer.log(e.toString());
      return <String, dynamic>{};
    }
  }

  Future<int> postUsuario(User usuario) async {
    try {
      var uri = Uri.parse(_urlRoot);
      String usuarioBody = userToJson(usuario);
      final Map<String, String> _headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
      var response = await http.post(uri, headers: _headers, body: usuarioBody);
      if (response.body.isEmpty) return 400;
      Map<String, dynamic> content = json.decode(response.body);
      int result = content["estado1"];
      // ignore: avoid_print
      print(content);
      developer.log("Estado $result");
      return result;
    } catch (ex) {
      developer.log("Error $ex");
      return 500;
    }
  }
}
