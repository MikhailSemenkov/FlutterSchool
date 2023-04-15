import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:lesson9/authorization/repository/tokens_repository.dart';

import '../data/playlist.dart';

class LibraryRepository {
  Future<List<Playlist>> getPlaylists() async {
    final key = await TokensRepository.tokens;
    return _requestPlaylists(key.accessToken);
  }

  Future<List<Playlist>> _requestPlaylists(key) async {
    Response response = await http.get(
      Uri.parse('https://api.spotify.com/v1/me/playlists'),
      headers: {'Authorization': 'Bearer $key'},
    );
    log(response.statusCode.toString());
    List<Playlist> compositions = [];
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      json['items'].forEach((v) {
        compositions.add(_fetchPlaylist(v));
      });
    } else {
      throw Exception('Failed to load composition');
    }
    response = await http.get(
      Uri.parse('https://api.spotify.com/v1/me/albums'),
      headers: {'Authorization': 'Bearer $key'},
    );
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      json['items'].forEach((v) {
        compositions.add(_fetchAlbum(v['album']));
      });
    }
    return compositions;
  }

  Playlist _fetchPlaylist(playlist) {
    return Playlist.fromJson(json: playlist, isAlbum: false);
  }

  Playlist _fetchAlbum(album) {
    return Playlist.fromJson(json: album, isAlbum: true);
  }
}
