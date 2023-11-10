import 'package:flutter/material.dart';
import 'package:nsqv/models/event.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Text(event.name);
  }
}
