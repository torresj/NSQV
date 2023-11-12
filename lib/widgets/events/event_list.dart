import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nsqv/models/event_type.dart';
import 'package:nsqv/services/movies_service.dart';
import 'package:nsqv/models/event.dart';
import 'package:nsqv/services/series_service.dart';
import 'package:nsqv/widgets/events/event_card.dart';

class EventList extends StatefulWidget {
  const EventList({super.key, required this.eventType});

  final EventType eventType;

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  final MovieService _movieService = MovieService.getInstance();
  final SeriesService _seriesService = SeriesService.getInstance();

  List<Event> _events = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initMovies(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              {
                return Center(
                  child: Platform.isIOS
                      ? const CupertinoActivityIndicator()
                      : const CircularProgressIndicator(),
                );
              }
            case ConnectionState.done:
              {
                return RefreshIndicator(
                  onRefresh: _refreshEvents,
                  child: GridView.builder(
                    itemCount: _events.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200.0,
                      mainAxisExtent: 375.0,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                    ),
                    itemBuilder: (context, index) => MovieCard(
                      event: _events[index],
                    ),
                  ),
                );
              }
          }
        });
  }

  Future _refreshEvents() async {
    final events = widget.eventType == EventType.movie
        ? await _movieService.getLiveEvents()
        : await _seriesService.getLiveEvents();
    setState(() {
      _events = events;
    });
  }

  Future _initMovies() async {
    final events = widget.eventType == EventType.movie
        ? await _movieService.getLiveEvents()
        : await _seriesService.getLiveEvents();
    _events = events;
  }
}
