import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class AbstractApi {
  final _urlLocalHost = 'http://localhost:3000';

  String _recurso;

  AbstractApi(this._recurso);

  Future<String> getAll() async {
    var response = await http.get(Uri.parse('$_urlLocalHost/$_recurso'));

    return response.body;
  }

  Future<String> getById(int id) async {
    var response = await http.get(Uri.parse('$_urlLocalHost/$_recurso/$id'));

    return response.body;
  }

  Future<bool> deleteById(int id) async {
    var response = await http.delete(Uri.parse('$_urlLocalHost/$_recurso/$id'));

    return response.statusCode == 200;
  }

  Future<String> post(Map<String, dynamic> json) async {
    var response = await http.post(
      Uri.parse('$_urlLocalHost/$_recurso'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(json),
    );

    return response.body;
  }

  Future<String> put(int id, Map<String, dynamic> json) async {
    var response = await http.put(
      Uri.parse('$_urlLocalHost/$_recurso/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(json),
    );
    return response.body;
  }
}
