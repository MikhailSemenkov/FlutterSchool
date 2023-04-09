import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../data/composition.dart';

class CompositionsRepository {
  String? _key;
  static final tracks = [
    '29vSs7jeLwUaeFVWf9KJVi',
    '35SVRaDt0IKWBPQdR0xREa',
    '6nWcEzyxDozQcmxMoNJtYx',
    '6BT7qiDY4A5tOyklohjQuW',
    '6fdFcQWHYuxWxWVAemX4Fh',
    '7H7SHw3YWXhb4zYqyoPNa1',
    '5FqYA8KfiwsQvyBI4IamnY',
    '1vP2JEXRsGrFbwOZ0foOQ5',
    '77f3aNeabAbOaSB32Sd5QE',
    '1hn1kCOG5dm1XgZYKpfaLR',
    '4OSBTYWVwsQhGLF9NHvIbR',
    '6dfhF1BDGmhM69fnCb6wSC',
    '1pduTu9RLjOUFz9szYKn0E',
    '7KRnJW2x33Mb84NavoKmbh',
  ];

  Future<List<Composition>> getCompositions() async {
    List<Composition> compositions = [];
    if (_key == null) {
      await _loadKey();
    }
    for (String track in tracks) {
      Composition composition = await _fetchComposition(track);
      compositions.add(composition);
    }
    return compositions;
  }

  Future<Composition> _fetchComposition(String track) async {
    final response = await http.get(
      Uri.parse('https://api.spotify.com/v1/tracks/$track'),
      headers: {'Authorization': 'Bearer ${_key!}'},
    );

    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      log('fetched');
      return Composition.fromJson(jsonDecode(response.body));
    } else {
      log('not fetched');
      throw Exception('Failed to load composition');
    }
  }

  Future<void> _loadKey() async {
    await dotenv.load(fileName: 'API.env');
    var url = Uri.https('accounts.spotify.com', 'api/token');
    var response = await http.post(
      url,
      body: {
        'grant_type': 'client_credentials',
        'client_id': dotenv.env['id'],
        'client_secret': dotenv.env['secret'],
      },
    );
    _key = await jsonDecode(response.body)['access_token'];
  }
}
