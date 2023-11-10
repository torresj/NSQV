import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nsqv/services/movies_service.dart';
import 'package:nsqv/models/event.dart';
import 'package:nsqv/widgets/movies/movie_card.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final MovieService _movieService = MovieService.getInstance();

  List<Event> _movies = [];

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
                  onRefresh: _refreshMovies,
                  child: ListView.builder(
                    itemCount: _movies.length,
                    itemBuilder: (context, index) =>
                        MovieCard(event: _movies[index]),
                  ),
                );
              }
          }
        });
  }

  Future _refreshMovies() async {
    final events = await _movieService.getLiveEvents();
    setState(() {
      _movies = events;
    });
  }

  Future _initMovies() async {
    final events = await _movieService.getLiveEvents();
    _movies = events;
  }
}
