import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import 'discover_page.dart';
import 'home_page.dart';
import 'profile_page.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({Key? key}) : super(key: key);

  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  final List<Tuple2> _pages = [
    Tuple2('home', HomePage()),
    Tuple2('Discover', DiscoverPage()),
    Tuple2('profile', ProfilePage()),
  ];
  int _selectedPage = 0;

  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          children: _pages.map<Widget>((Tuple2 page) => page.item2).toList(),
          onPageChanged: (index) {
            setState(() {
              _selectedPage = index;
            });
          },
          controller: _pageController,
           
          ),
          bottomNavigationBar:  BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Discover',
           
          ),
         
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profile',
          
          ),
        ],
        currentIndex: _selectedPage,
        onTap: (index) {
          setState(() {
            _selectedPage = index;
          
            _pageController.animateToPage(_selectedPage,
                duration: Duration(milliseconds: 300), curve: Curves.linear);
          });
        },
),
   );
  }
}
