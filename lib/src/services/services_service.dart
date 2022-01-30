import 'package:fixhome/src/models/service_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ServicioService {
  ServicioService();

  Future<List<Servicio>?> getServices() async {
    List<Servicio> result = [];
    try {
      var url = Uri.parse('https://fixhome-278cf.web.app/api/services');
      var response = await http.get(url);
      if (response.body.isEmpty) return result;
      List<dynamic> listBody = json.decode(response.body);
      for (var item in listBody) {
        var servicio = Servicio.fromJson(item);
        result.add(servicio);
      }
      return result;
    } catch (ex) {
      // ignore: avoid_print
      print(ex);
      return null;
    }
  }
}
