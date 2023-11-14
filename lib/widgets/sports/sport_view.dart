import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nsqv/models/event.dart';

class SportView extends StatelessWidget {
  const SportView({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.arrow_back,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Text(
              event.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              event.classification,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '${DateFormat('HH:mm').format(event.start)} - ${DateFormat('HH:mm').format(event.end)}',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Theme.of(context).colorScheme.onPrimary),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            width: double.infinity,
            child: Text(
              'Canal: ${event.channel.name}',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            width: double.infinity,
            child: Text(
              'Duración: ${event.duration} minutos',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            width: double.infinity,
            child: Text(
              event.synopsis,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
