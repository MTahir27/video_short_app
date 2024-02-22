import 'package:flutter/material.dart';

import '../../config/palette.dart';
import '../../models/bottom_navigation_bar_modal.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    super.key,
    required this.bottombarList,
    required this.onTabClick,
    required this.activeTabIndex,
  });
  final List<BottomNavigationBarModal> bottombarList;
  final Function onTabClick;
  final int activeTabIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Pallete.primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: BottomNavigationBar(
        elevation: 0,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedIconTheme: const IconThemeData(color: Pallete.secondaryColor),
        selectedItemColor: Pallete.secondaryColor,
        unselectedIconTheme: const IconThemeData(
          color: Pallete.bottomBarIncativeColor,
        ),
        unselectedItemColor: Pallete.bottomBarIncativeColor,
        currentIndex: activeTabIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        onTap: (int index) => onTabClick(index),
        items: [
          ...bottombarList.map(
            (data) => data.isButton == false
                ? BottomNavigationBarItem(
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        data.icon,
                        const SizedBox(height: 4),
                        Text(
                          data.title,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: data.index == activeTabIndex
                                ? Pallete.secondaryColor
                                : Pallete.bottomBarIncativeColor,
                          ),
                        ),
                      ],
                    ),
                    label: data.title,
                  )
                : BottomNavigationBarItem(
                    icon: Container(
                      height: double.infinity,
                      width: double.infinity,
                      constraints: const BoxConstraints(
                        maxHeight: 40,
                        maxWidth: 60,
                      ),
                      decoration: BoxDecoration(
                        gradient: Pallete.primaryGradientColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        data.icon.icon,
                        color: Pallete.primaryColor,
                      ),
                    ),
                    label: '',
                  ),
          ),
        ],
      ),
    );
  }
}
