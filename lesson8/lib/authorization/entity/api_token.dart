class APIToken {
  final String? _accessToken;
  final String? _refreshToken;
  final DateTime _expireTime;

  APIToken({required accessToken, required refreshToken, required expireTime})
      : _accessToken = accessToken,
        _refreshToken = refreshToken,
        _expireTime = expireTime;

  DateTime get expireTime => _expireTime;

  String? get refreshToken => _refreshToken;

  String? get accessToken => _accessToken;
}
