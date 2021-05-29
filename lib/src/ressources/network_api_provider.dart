import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' show Client;
import 'package:http/http.dart';
import 'package:mad_immo/src/models/Authentification.dart';
import 'package:mad_immo/src/models/chasseur_response.dart';

class NetWorkApiProvider {
  final String _url = "https://localhost:3000";
  Client client = Client();
  //final Dio _dio = Dio();

  Future<ChasseurResponse> login(Authentification auth) async {
    try {
      Response response = await client.post(Uri.parse(_url),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json'
        },
        body: auth.toJson()
      );
      return ChasseurResponse.fromJson(jsonDecode(response.body));
    }catch(error, stacktrace){

    }
    /*try {
      Response response = await _dio.post(_endpoint);
      return UserResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return UserResponse.withError("$error");
    }*/
  }
  
}
