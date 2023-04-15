import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../entity/api_token.dart';

class TokensRepository {
  static APIToken? _tokens;

  static Future<APIToken> get tokens {
    if (_tokens != null) {
      if (_tokens!.expireTime.isBefore(DateTime.now())) {
        log('refreshing');
        return _refreshTokens();
      }
    }
    return _getAPIToken();
  }

  static Future<APIToken> _getAPIToken() async {
    if (_tokens != null) {
      return _tokens!;
    }
    final preferences = await SharedPreferences.getInstance();
    final expireTime = preferences.getString('tokenExpireIn');
    _tokens = APIToken(
      accessToken: preferences.getString('accessToken'),
      refreshToken: preferences.getString('refreshToken'),
      expireTime: (expireTime == null)
          ? DateTime.fromMillisecondsSinceEpoch(0)
          : DateTime.parse(expireTime),
    );
    return _tokens!;
  }

  static Future<APIToken> _setTokens(
      String accessToken, String refreshToken, int expireIn) async {
    DateTime expireTime = DateTime.now();
    expireTime = expireTime.add(Duration(seconds: expireIn));
    final preferences = await SharedPreferences.getInstance();
    preferences.setString('accessToken', accessToken);
    preferences.setString('refreshToken', refreshToken);
    preferences.setString('tokenExpiresIn', expireTime.toString());
    _tokens = APIToken(
        accessToken: accessToken,
        refreshToken: refreshToken,
        expireTime: expireTime);
    return _tokens!;
  }

  static Future<APIToken> _refreshTokens() async {
    await dotenv.load(fileName: 'API.env');
    final response = await http
        .post(Uri.parse('https://accounts.spotify.com/api/token'), body: {
      'grant_type': 'refresh_token',
      'refresh_token': _tokens!.refreshToken,
    }, headers: {
      'Authorization':
          'Basic ${base64.encode(utf8.encode('${dotenv.env['id']!}:${dotenv.env['secret']!}'))}'
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return _setTokens(
          json['access_token'], _tokens!.refreshToken!, json['expires_in']);
    } else {
      throw Exception('Can not refresh tokens');
    }
  }

  static Future<APIToken> generateTokens(String url) async {
    final key = url.substring(26);
    await dotenv.load(fileName: 'API.env');
    final response = await http
        .post(Uri.parse('https://accounts.spotify.com/api/token'), body: {
      'grant_type': 'authorization_code',
      'code': key,
      'redirect_uri': 'https://example.com',
    }, headers: {
      'Authorization':
          'Basic ${base64.encode(utf8.encode('${dotenv.env['id']!}:${dotenv.env['secret']!}'))}'
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return _setTokens(
          json['access_token'], json['refresh_token'], json['expires_in']);
    } else {
      throw Exception('Can not generate tokens');
    }
  }
}
