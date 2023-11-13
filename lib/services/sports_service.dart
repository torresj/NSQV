import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nsqv/models/event.dart';

class SportsService {
  static final SportsService _instance = SportsService();

  static SportsService getInstance() => _instance;

  Future<List<Event>> getLiveEvents() {
    final url = Uri.https('api.tv.schedule.torresj.com', 'v1/sports/live');
    return http.get(url).then((response) {
      final List parsedList = json.decode(utf8.decode(response.bodyBytes));
      return parsedList
          .map((jsonObject) => Event.fromJson(jsonObject))
          .toList(growable: false);
    });
  }
}
