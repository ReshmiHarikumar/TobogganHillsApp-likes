import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:toboggan_hills/src/features/authentication/profile.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key, required this.user});
  final User user;
  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        // Navigate to Search Page
      } else if (_selectedIndex == 2) {
        // Navigate to Profile Page
        _selectedIndex = 0;
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProfilePage(
                    user: widget.user,
                  )),
        );
      }
    });
  }

  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Popular',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: const Color.fromARGB(255, 0, 132, 255),
      onTap: _onItemTapped,
    );
  }
}
