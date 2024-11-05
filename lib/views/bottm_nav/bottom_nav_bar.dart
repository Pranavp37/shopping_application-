import 'package:flutter/material.dart';
import 'package:shopping_application/views/account_screen/account_screen.dart';
import 'package:shopping_application/views/cart_screen/cart_screen.dart';
import 'package:shopping_application/views/home_screen/home_screen.dart';

class BottonNavBar extends StatefulWidget {
  const BottonNavBar({super.key});

  @override
  _BottonNavBarState createState() => _BottonNavBarState();
}

class _BottonNavBarState extends State<BottonNavBar> {
  int _currentIndex = 0;


  final List<Widget> _pages = [
    HomeScreen(),
    const CartScreen(),
    const AccountScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
