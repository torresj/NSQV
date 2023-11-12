import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nsqv/models/event.dart';

class SeriesService {
  static final SeriesService _instance = SeriesService();

  static SeriesService getInstance() => _instance;

  Future<List<Event>> getLiveEvents() {
    final url = Uri.https('api.tv.schedule.torresj.com', 'v1/series/live');
    return http.get(url).then((response) {
      final List parsedList = json.decode(utf8.decode(response.bodyBytes));
      return parsedList
          .map((jsonObject) => Event.fromJson(jsonObject))
          .toList(growable: false);
    });
  }
}
