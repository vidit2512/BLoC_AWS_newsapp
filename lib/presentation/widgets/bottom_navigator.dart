import 'package:flutter/material.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({Key? key}) : super(key: key);

  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
//  @override
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: home',
      style: optionStyle,
    ),
    Text(
      'Index 1: search',
      style: optionStyle,
    ),
   
    Text(
      'Index 2:profile',
      style: optionStyle,
    ),
  
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return 
    
       BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
         BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'search',
           
          ),
         
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profile',
          
          ),
        
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      );
    
  }
}