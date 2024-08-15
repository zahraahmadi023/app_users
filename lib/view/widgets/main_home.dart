import 'package:app_users/view/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavBar(),
    );
  }
}
