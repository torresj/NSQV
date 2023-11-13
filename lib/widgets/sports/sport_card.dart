import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nsqv/models/event.dart';

class SportCard extends StatelessWidget {
  const SportCard({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              event.name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Image.network(
                      event.channel.logoUrl,
                      scale: 1.3,
                    ),
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
      ),
    );
  }
}
