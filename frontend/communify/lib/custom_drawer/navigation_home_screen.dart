import 'package:communify/app_theme.dart';
import 'package:communify/custom_drawer/drawer_user_controller.dart';
import 'package:communify/custom_drawer/home_drawer.dart';
import 'package:communify/custom_drawer/feedback_screen.dart';
import 'package:communify/custom_drawer/help_screen.dart';
import 'package:communify/custom_drawer/invite_friend_screen.dart';
import 'package:communify/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

import '../app_screen.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> 
      with TickerProviderStateMixin {
  Widget screenView;
  DrawerIndex drawerIndex;
  AnimationController sliderAnimationController;
  AnimationController animationController;
  
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animationController.forward();
    drawerIndex = DrawerIndex.HOME;
    screenView = const AppScreen();
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            animationController: (AnimationController animationController) {
              sliderAnimationController = animationController;
            },
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
            },
            screenView: screenView,
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        animationController.reverse().then<dynamic>((data) {
          if (!mounted) {
            return;
          }
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen(animationController: animationController)),
          );Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AppScreen()),
          );Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NavigationHomeScreen()),
          );
        });
      } else if (drawerIndex == DrawerIndex.Help) {
        setState(() {
          screenView = HelpScreen();
        });
      } else if (drawerIndex == DrawerIndex.FeedBack) {
        setState(() {
          screenView = FeedbackScreen();
        });
      } else if (drawerIndex == DrawerIndex.Invite) {
        setState(() {
          screenView = InviteFriend();
        });
      } else {
        //do in your way......
      }
    }
  }
}
