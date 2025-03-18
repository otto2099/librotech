import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  late EnvMode m;

  static final Env _instance = Env._internal();
  Env._internal();

  factory Env(EnvMode mode) {
    _instance.m = mode;
    return _instance;
  }

  static String get fileName => ".env.development";

  String get apiBookUrl {
    final url = dotenv.env['API_ITBOOK_URL'];
    if (url == null || url.isEmpty) {
      throw Exception('API_ITBOOK_URL not defined in the environment file.');
    }
    return url;
  }
}

enum EnvMode {
  production,
  qA,
  dev,
}
