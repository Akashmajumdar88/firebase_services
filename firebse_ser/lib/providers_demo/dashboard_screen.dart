import 'package:firebse_ser/providers_demo/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages  = [
    const HomeScreen(),
    const Center(child: Text('Purchases', style: TextStyle(fontSize: 24))),
    const Center(child: Text('EMI & Loan', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Notifications', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Profile', style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    HapticFeedback.selectionClick();
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child,animation){
          return FadeTransition(opacity: animation,child: child);
        },
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        elevation: 3,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Purchases"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: "EMI"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Notify"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile"
          )
        ],
      ),
    );
  }
}
