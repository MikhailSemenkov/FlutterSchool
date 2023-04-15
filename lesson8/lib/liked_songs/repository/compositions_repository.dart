import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../authorization/repository/tokens_repository.dart';
import '../data/composition.dart';

class CompositionsRepository {
  Future<List<Composition>> getCompositions() async {
    final key = await TokensRepository.tokens;
    return _requestCompositions(key.accessToken);
  }

  Future<List<Composition>> _requestCompositions(key) async {
    final response = await http.get(
      Uri.parse('https://api.spotify.com/v1/me/tracks?limit=50&market=UA'),
      headers: {'Authorization': 'Bearer $key'},
    );
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<Composition> compositions = [];
      json['items'].forEach((v) {
        compositions.add(_fetchComposition(v['track']));
      });
      return compositions;
    } else {
      throw Exception('Failed to load composition');
    }
  }

  Composition _fetchComposition(track) {
    return Composition.fromJson(track);
  }
}
