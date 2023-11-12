import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nsqv/models/event.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (event.imageUrl.isNotEmpty)
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                event.imageUrl,
                              ),
                              fit: BoxFit.fill),
                        ),
                        width: 200,
                        height: 280,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      color: const Color.fromARGB(180, 0, 0, 0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            Text(
                              event.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                            ),
                            if (event.chapterName.isNotEmpty)
                              Text(
                                event.chapterName,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                              ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      event.channel.logoUrl,
                      scale: 1.3,
                    ),
                    Text(
                      '${DateFormat('HH:mm').format(event.start)} - ${DateFormat('HH:mm').format(event.end)}',
                      style: const TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: LinearProgressIndicator(
                        value: event.progress / 100,
                        minHeight: 6,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text('${event.progress}%'),
                  )
                ],
              ),
            ],
          ),
          if (event.rate > 0)
            Container(
              color: const Color.fromARGB(180, 0, 0, 0),
              width: 40,
              height: 40,
              child: Center(
                child: Text(
                  event.rate.toStringAsFixed(1),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
