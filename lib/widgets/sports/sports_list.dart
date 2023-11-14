import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nsqv/models/event.dart';
import 'package:nsqv/services/sports_service.dart';
import 'package:nsqv/widgets/sports/sport_card.dart';

class SportsList extends StatefulWidget {
  const SportsList({super.key, required this.filter});

  final String filter;

  @override
  State<SportsList> createState() => _SportsListState();
}

class _SportsListState extends State<SportsList> {
  final SportsService _sportsService = SportsService.getInstance();

  List<Event> _events = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initEvents(),
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
                      mainAxisExtent: 220.0,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                    ),
                    itemBuilder: (context, index) => SportCard(
                      event: _events[index],
                    ),
                  ),
                );
              }
          }
        });
  }

  Future _refreshEvents() async {
    final events = await _sportsService.getLiveEvents();
    setState(() {
      _events = events
          .where((event) => event.channel.name.contains(widget.filter))
          .toList();
    });
  }

  Future _initEvents() async {
    final events = await _sportsService.getLiveEvents();
    _events = events
        .where(
          (event) =>
              event.channel.name
                  .toLowerCase()
                  .contains(widget.filter.toLowerCase()) ||
              event.name.toLowerCase().contains(widget.filter.toLowerCase()),
        )
        .toList();
  }
}
