import 'package:final_project/api_client/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthorizationRepository {
  static String? _token;

  static Future<String?> get token async {
    _token ??= await _getAPIToken();
    return _token;
  }

  static Future<String?> _getAPIToken() async {
    final preferences = await SharedPreferences.getInstance();
    final token = preferences.getString('token');
    return token;
  }

  static Future<String> _setAPIToken(String token) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setString('token', token);
    _token = token;
    return _token!;
  }

  static Future<String> generateTokens(String phoneNumber, String otp) async {
    APIClient client = APIClient();
    final token = await client.authentication(phoneNumber, otp);
    return _setAPIToken(token);
  }
}
