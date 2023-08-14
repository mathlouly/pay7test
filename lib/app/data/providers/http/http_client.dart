import 'package:http/http.dart' as http;

class HttpClient extends http.BaseClient {
  late String contentType;
  late http.Client _inner;

  HttpClient() {
    contentType = 'application/json';
    _inner = http.Client();
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Content-Type'] = contentType;
    return _inner.send(request);
  }
}
