import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nsqv/models/event.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie});

  final Event movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (movie.imageUrl.isNotEmpty)
            Center(
              child: Image.network(
                movie.imageUrl,
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) =>
                    child,
                loadingBuilder: (context, child, loadingProgress) =>
                    loadingProgress == null
                        ? child
                        : Container(
                            width: double.infinity,
                            height: 400,
                            color: Theme.of(context).colorScheme.secondary,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          ),
              ),
            )
          else
            Container(
              width: double.infinity,
              height: 400,
              color: Theme.of(context).colorScheme.secondary,
              child: Center(
                child: Text(
                  "No hay imagen",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 16),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Text(
              movie.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              movie.classification,
              style: const TextStyle(fontSize: 10),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Row(
              children: [
                Image.network(movie.channel.logoUrl),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    '${DateFormat('HH:mm').format(movie.start)} - ${DateFormat('HH:mm').format(movie.end)}',
                    style: const TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: LinearProgressIndicator(
                      value: movie.progress / 100,
                      minHeight: 10,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text('${movie.progress}%'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
