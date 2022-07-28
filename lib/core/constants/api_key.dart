class ApiKeys {
  static ApiKeys? _instance;
  static ApiKeys get instance {
    _instance ??= ApiKeys._init();
    return _instance!;
  }

  ApiKeys._init();

  String newsApiKey = '3532c530c28d484094e174697d94cd24';
}
