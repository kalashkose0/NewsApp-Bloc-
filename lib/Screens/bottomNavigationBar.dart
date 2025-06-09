import 'package:flutter/material.dart';
import 'package:newsapp/Screens/exploreScreen.dart';
import 'package:newsapp/Screens/savedScreen.dart';
import 'package:newsapp/Screens/settingScreen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int currentIndex = 0;

  final List<Widget> pages = [
    // HomeScreen(),
    ExploreScreen(),
    SavedScreen(),
    SettingsScreen(),
  ];

  double _getIndicatorPosition() {
    double width = MediaQuery.of(context).size.width;
    return (width / 4) * currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    double itemWidth = MediaQuery.of(context).size.width / 4;

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: SizedBox(
        height: 63,
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              left: _getIndicatorPosition() + itemWidth / 4,
              top: 0,
              child: Container(
                width: itemWidth / 2,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Positioned.fill(
              top: 2,
              child: BottomNavigationBar(
                backgroundColor: Color(0xFFF9F9F9),
                type: BottomNavigationBarType.fixed,
                currentIndex: currentIndex,
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.grey,
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined),
                      activeIcon: Icon(Icons.home),
                      label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.explore_outlined),
                      activeIcon: Icon(Icons.explore),
                      label: 'Explore'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.bookmark_outline),
                      activeIcon: Icon(Icons.bookmark),
                      label: 'Saved'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings_outlined),
                      activeIcon: Icon(Icons.settings),
                      label: 'Settings'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
