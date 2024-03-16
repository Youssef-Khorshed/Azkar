class Strings {
  static String baseApi({
    required String lat,
    required String long,
    required String date,
  }) =>
      'http://api.aladhan.com/v1/timings/$date?latitude=$lat&longitude=$long&method=5';
}
