import 'package:fixhome/src/models/establishment_model.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

class EstablecimientoService {
  EstablecimientoService();
  final String _urlRoot = "https://fixhome-278cf.web.app/api/establishment";

  Future<int> postEstablecimiento(Establish establish) async {
    try {
      var url = Uri.parse(_urlRoot);
      String _establishBody = establishToMap(establish);
      final Map<String, String> _headers = {"content-type": "application/json"};
      var response =
          await http.post(url, headers: _headers, body: _establishBody);
      if (response.body.isEmpty) return 400;
      Map<String, dynamic> content = json.decode(response.body);
      int result = content["estado"];
      developer.log("Estado $result");
      return result;
    } catch (ex) {
      developer.log("Error $ex");
      return 500;
    }
  }

  Future<String> uploadImage(File image) async {
    final cloudinary = CloudinaryPublic('as&jp', 'as-jp', cache: false);
    try {
      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(image.path,
            resourceType: CloudinaryResourceType.Image),
      );
      return response.secureUrl;
    } on CloudinaryException catch (e) {
      developer.log(e.message!);
      return "";
    }
  }

  Future<List<Establish>?> getEstablishment() async {
    List<Establish> result = [];
    try {
      var url = Uri.parse('https://fixhome-278cf.web.app/api/establishment');
      var response = await http.get(url);
      if (response.body.isEmpty) return result;
      List<dynamic> listBody = json.decode(response.body);
      for (var item in listBody) {
        var establecimiento = Establish.fromJson(item);
        result.add(establecimiento);
      }
      return result;
    } catch (ex) {
      // ignore: avoid_print
      print(ex);
      return null;
    }
  }
}
