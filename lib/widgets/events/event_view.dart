import 'package:flutter/material.dart';
import 'package:nsqv/models/event.dart';
import 'package:nsqv/models/event_type.dart';

class EventView extends StatelessWidget {
  const EventView({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: ListView(
        children: [
          Center(
            child: event.imageUrl.isNotEmpty
                ? Stack(
                    children: [
                      Image.network(
                        event.imageUrl,
                      ),
                      Container(
                        color: const Color.fromARGB(180, 0, 0, 0),
                        height: 50,
                        width: 50,
                        child: Center(
                          child: Text(
                            event.rate.toStringAsFixed(1),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onPrimary),
                          ),
                        ),
                      )
                    ],
                  )
                : Container(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    width: double.infinity,
                    height: 300,
                    child: const Center(
                      child: Text(
                        "No hay imagen",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 30,
              right: 30,
            ),
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
              event.chapterName,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
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
          if (event.eventType == EventType.movie)
            ..._movieView(context)
          else
            ..._serieView(context)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.arrow_back,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  List<Widget> _movieView(BuildContext context) => [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          width: double.infinity,
          child: Text(
            'Director: ${event.director.substring(0, event.director.length - 2)}',
            textAlign: TextAlign.justify,
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
            'Intérpretes: ${event.interpreters}',
            textAlign: TextAlign.justify,
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
            'Sinopsis: ${event.synopsis}',
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(
          height: 100,
        ),
      ];

  List<Widget> _serieView(BuildContext context) => [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          width: double.infinity,
          child: Text(
            'Sinopsis: ${event.synopsis}',
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(
          height: 100,
        ),
      ];
}
