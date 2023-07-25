import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram/pages/home_page.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int currentIndex = 0;
  List<Widget> pages = [
    const HomePage(),
    const Text('Page 2'),
    const Text('Page 3'),
    const Text('Page 4'),
    const Text('Page 5'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pages[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.house, color: currentIndex == 0 ? Colors.black : Colors.grey,
          ),
          label: 'Home'
          ),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.magnifyingGlass, color: currentIndex == 1 ? Colors.black : Colors.grey,
          ),
          label: 'Search'
          ),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.squarePlus, color: currentIndex == 2 ? Colors.black : Colors.grey,
          ),
          label: 'Add Post'
          ),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.clapperboard, color: currentIndex == 3 ? Colors.black : Colors.grey,
          ),
          label: 'Home'
          ),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.user, color: currentIndex == 4 ? Colors.black : Colors.grey
          ),
          label: 'Profile'
          ),
        ],
      ),
    );
  }
}