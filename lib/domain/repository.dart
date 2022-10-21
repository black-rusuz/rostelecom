abstract class Repository {
  abstract final String url;

  Future<bool> testConnection();
}
