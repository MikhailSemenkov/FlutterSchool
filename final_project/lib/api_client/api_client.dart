import 'package:dio/dio.dart';
import 'package:final_project/data/movies.dart';
import 'package:final_project/data/sessions.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../authorization/repository/authorization_repository.dart';
import '../data/comments.dart';
import '../data/user.dart';

class APIClient {
  static final APIClient _singletonAPIClient = APIClient._singleton();
  final Dio _dio = Dio();
  final _baseUrl = 'https://fs-mt.qwerty123.tech';

  factory APIClient() => _singletonAPIClient;

  APIClient._singleton() {
    _dio.options.baseUrl = _baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 3);
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          AuthorizationRepository.token.then(
            (token) {
              if (token != null) {
                if (options.headers.containsKey('Authorization')) {
                  options.headers['Authorization'] = 'Bearer $token';
                } else {
                  options.headers
                      .putIfAbsent('Authorization', () => 'Bearer $token');
                }
              }
            },
          );
          handler.next(options);
        },
      ),
    );
  }

  Future<int> sendOTP(String phoneNumber) async {
    final response =
        await _dio.post('/api/auth/otp', data: {'phoneNumber': phoneNumber});
    return response.statusCode!;
  }

  authentication(String phoneNumber, String otp) async {
    final response = await _dio.post('/api/auth/login', data: {
      'phoneNumber': phoneNumber,
      'otp': otp,
    });
    return response.data['data']['accessToken'];
  }

  Future<int> testRequest() async {
    final response = await _dio.get('/api/user');
    return response.statusCode!;
  }

  Future<User> currentUser() async {
    final userResponse = await _dio.get('/api/user');
    final ticketsResponse = await _dio.get('/api/user/tickets');
    return User.fromJson(userResponse.data['data'], ticketsResponse.data);
  }

  Future<int> updateUserName(String newUserName) async {
    final response = await _dio.post(
      '/api/user',
      queryParameters: {'name': newUserName},
    );
    return response.statusCode!;
  }

  Future<Movies> listOfMovies(String date, String query) async {
    final response = await _dio.get('/api/movies?date=$date&query=$query');
    return Movies.fromJson(response.data);
  }

  Future<Sessions> listOfSessions(String movieId, String date) async {
    final response =
        await _dio.get('/api/movies/sessions?movieId=$movieId&date=$date');
    return Sessions.fromJson(response.data);
  }

  Future<int> bookTickets(List<int> seats, int sessionId) async {
    final response = await _dio.post(
      '/api/movies/book',
      queryParameters: {
        'seats[]': seats,
        'sessionId': sessionId,
      },
    );

    return response.statusCode!;
  }

  Future<int> buyTickets(List<int> seats, int sessionId, String email,
      String cardNumber, String expirationDate, String cvv) async {
    final response = await _dio.post(
      '/api/movies/buy',
      queryParameters: {
        'seats[]': seats,
        'sessionId': sessionId,
        'email': email,
        'cardNumber': cardNumber.replaceAll('  ', ''),
        'expirationDate': expirationDate,
        'cvv': cvv,
      },
    );
    return response.statusCode!;
  }

  Future<Comments> listOfComments(int movieId) async {
    final response = await _dio.get('/api/movies/comments?movieId=$movieId');
    return Comments.fromJson(response.data);
  }

  Future<int> addComment(String comment, int rating, int movieId) async {
    final response = await _dio.post(
      '/api/movies/comments',
      queryParameters: {
        'content': comment,
        'rating': rating,
        'movieId': movieId,
      },
    );
    return response.statusCode!;
  }

  Future<int> removeComment(int commentId) async {
    final response = await _dio.delete('/api/movies/comments/$commentId');
    return response.statusCode!;
  }
}
