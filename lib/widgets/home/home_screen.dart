import 'package:flutter/material.dart';
import 'package:nsqv/widgets/movies/movie_list.dart';

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
      icon: Icon(Icons.format_list_numbered),
      label: 'Canales',
    ),
  ];

  final List<Widget> _screens = const [
    Text("Series"),
    MovieList(),
    Text("Canales de TV"),
  ];

  int _selectedIndex = 1;

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
          child: _screens[_selectedIndex],
        ),
      ),
    );
  }
}
