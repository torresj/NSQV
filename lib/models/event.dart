import 'package:nsqv/models/channel.dart';

import 'event_type.dart';

class Event {
  EventType eventType;
  DateTime start;
  DateTime end;
  int duration;
  int progress;
  String name;
  String synopsis;
  String classification;
  String director;
  String interpreters;
  double rate;
  String imageUrl;
  String chapterName;
  Channel channel;

  Event(
      {required this.eventType,
      required this.start,
      required this.end,
      required this.duration,
      required this.progress,
      required this.name,
      required this.synopsis,
      required this.classification,
      required this.director,
      required this.interpreters,
      required this.rate,
      required this.imageUrl,
      required this.chapterName,
      required this.channel});

  factory Event.fromJson(Map<String, dynamic> parsedJson) {
    return Event(
        eventType: parsedJson['eventType'].toString() == 'MOVIE'
            ? EventType.movie
            : EventType.serie,
        start: DateTime.parse(parsedJson['start'].toString()),
        end: DateTime.parse(parsedJson['end'].toString()),
        duration: int.parse(parsedJson['duration'].toString()),
        progress: int.parse(parsedJson['progress'].toString()),
        name: parsedJson['name'].toString(),
        synopsis: parsedJson['synopsis']?.toString() ?? '',
        classification: parsedJson['classification']?.toString() ?? '',
        director: parsedJson['director']?.toString() ?? '',
        interpreters: parsedJson['interpreters']?.toString() ?? '',
        rate: parsedJson['rate'] == null
            ? 0.0
            : double.parse(parsedJson['rate'].toString()),
        imageUrl: parsedJson['imageUrl']?.toString() ?? '',
        chapterName: parsedJson['chapterName']?.toString() ?? '',
        channel: Channel.fromJson(parsedJson['channel']));
  }
}
