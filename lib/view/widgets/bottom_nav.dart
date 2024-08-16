import 'package:app_users/view/home_screen.dart';
import 'package:app_users/view/profile.dart';
import 'package:app_users/view/user_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  final List<Widget> screens = const [
    HomeScreen(),
    UserScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 60,
        color: Color.fromARGB(255, 22, 121, 171),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
                icon: Icon(
                  Icons.home,
                  size: 30,
                  color: currentIndex == 0
                      ? Color.fromARGB(255, 67, 215, 255)
                      : Colors.grey.shade200,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
                icon: Icon(
                  Icons.grid_view_outlined,
                  size: 30,
                  color: currentIndex == 1
                      ? Color.fromARGB(255, 67, 215, 255)
                      : Colors.grey.shade200,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 2;
                  });
                },
                icon: Icon(
                  Icons.person,
                  size: 30,
                  color: currentIndex == 2
                      ? Color.fromARGB(255, 67, 215, 255)
                      : Colors.grey.shade200,
                ),
              ),
            ],
          ),
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
