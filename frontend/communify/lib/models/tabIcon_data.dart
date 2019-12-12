import 'package:communify/app_theme.dart';
import 'package:flutter/material.dart';

class TabIconData {
  Icon icon;
  Icon selectedIcon;

  TabIconData({
    this.icon,
    this.index = 0,
    this.selectedIcon,
    this.isSelected = false,
    this.animationController,
  });

  bool isSelected;
  int index;

  AnimationController animationController;

  static List<TabIconData> tabIconsList = <TabIconData>[
    TabIconData(
      icon: Icon(Icons.event),
      selectedIcon: Icon(
                      Icons.event,
                      color: AppTheme.nearlyBlue,),
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    TabIconData(
      icon: Icon(Icons.bubble_chart),
      selectedIcon: Icon(
                      Icons.bubble_chart,
                      color: AppTheme.nearlyBlue,),
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      icon: Icon(Icons.notifications),
      selectedIcon: Icon(
                      Icons.notifications,
                      color: AppTheme.nearlyBlue,),
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      icon: Icon(Icons.account_circle),
      selectedIcon: Icon(
                      Icons.account_circle,
                      color: AppTheme.nearlyBlue,),
      index: 3,
      isSelected: false,
      animationController: null,
    ),
  ];
}
