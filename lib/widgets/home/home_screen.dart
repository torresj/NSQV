import 'package:flutter/material.dart';
import 'package:nsqv/models/event_type.dart';
import 'package:nsqv/widgets/events/event_list.dart';
import 'package:nsqv/widgets/sports/sports_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<BottomNavigationBarItem> _navItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.live_tv),
      label: 'Series',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.movie_creation_outlined),
      label: 'Películas',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_soccer_outlined),
      label: 'Deportes',
    ),
  ];

  int _selectedIndex = 1;
  String filter = '';

  void _onSearchChange(String text) {
    setState(() {
      filter = text;
    });
  }

  void _clearFilter() {
    setState(() {
      filter = '';
    });
  }

  Widget _getScreen(int index) => <Widget>[
        EventList(
          eventType: EventType.serie,
          filter: filter,
        ),
        EventList(
          eventType: EventType.movie,
          filter: filter,
        ),
        SportsList(
          filter: filter,
        ),
      ][index];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: _navItems,
        currentIndex: _selectedIndex,
        onTap: (int selected) {
          setState(() {
            _selectedIndex = selected;
          });
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                child: SearchAnchor(
                  builder: (context, controller) => SearchBar(
                    hintText: _selectedIndex == 2
                        ? "Buscar por canal y contenido"
                        : "Buscar por canal",
                    controller: controller,
                    padding: const MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                    onChanged: (_) => _onSearchChange(controller.value.text),
                    leading: const Icon(Icons.search),
                    trailing: <Widget>[
                      if (filter.isNotEmpty)
                        IconButton(
                            onPressed: () {
                              controller.clear();
                              _clearFilter();
                            },
                            icon: const Icon(Icons.close))
                    ],
                  ),
                  suggestionsBuilder: (context, controller) => [],
                ),
              ),
              Expanded(
                child: _getScreen(_selectedIndex),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
