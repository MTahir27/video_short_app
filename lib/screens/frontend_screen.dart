import 'package:flutter/material.dart';

import '../helper/data.dart';
import '../widgets/layout/bottom_navigation_bar_widget.dart';

class FrontendScreen extends StatefulWidget {
  const FrontendScreen({super.key});

  @override
  State<FrontendScreen> createState() => _FrontendScreenState();
}

class _FrontendScreenState extends State<FrontendScreen> {
  int _currentScreenTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: frontendScreenTabsList[_currentScreenTab].page,
      bottomNavigationBar: BottomNavigationBarWidget(
        bottombarList: frontendScreenTabsList,
        onTabClick: (index) {
          setState(() {
            _currentScreenTab = index;
          });
        },
        activeTabIndex: _currentScreenTab,
      ),
    );
  }
}
