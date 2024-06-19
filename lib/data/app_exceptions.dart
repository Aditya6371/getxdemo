class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  String tostring() {
    return "$_prefix $_message";
  }
}

class NoInternet extends AppExceptions {
  NoInternet([String? message]) : super(message, "No Internet");
}

class ServerTimeOut extends AppExceptions {
  ServerTimeOut([String? message]) : super(message, "Server Time Out");
}

class ServerException extends AppExceptions {
  ServerException([String? message]) : super(message, "Internal Server Error");
}