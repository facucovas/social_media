import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:red_social/src/models/publicacion_model.dart';

class PublicacionesProvider {
  final String _url = 'https://redsocial-b11b1.firebaseio.com';

  Future<bool> crearPublicacion (PublicacionModel publicacion) async {
    
    final url = '$_url/publicaciones';
    
    final resp = await http.post(url, body: publicacionModelToJson(publicacion));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;

  }

}