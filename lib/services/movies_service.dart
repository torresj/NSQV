import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nsqv/models/event.dart';

class MovieService {
  static final MovieService _instance = MovieService();

  static MovieService getInstance() => _instance;

  Future<List<Event>> getLiveEvents() {
    final url = Uri.https('api.tv.schedule.torresj.com', 'v1/movies/live');
    return http.get(url).then((response) {
      final List parsedList = json.decode(utf8.decode(response.bodyBytes));
      return parsedList
          .map((jsonObject) => Event.fromJson(jsonObject))
          .toList(growable: false);
    });
  }
}
