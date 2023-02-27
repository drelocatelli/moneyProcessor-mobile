class Server {

  static Uri call(String path) {
    return Uri(
      scheme: 'http',
      host: '192.168.15.5',
      port: 5500,
      path: "api/${path}"
    );
  }
  
}