import 'package:evently_c16_online/modules/layout/pages/home_screen.dart';
import 'package:evently_c16_online/modules/layout/pages/love_screen.dart';
import 'package:evently_c16_online/modules/layout/pages/map_screen.dart';
import 'package:evently_c16_online/modules/layout/pages/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LayoutProvider extends ChangeNotifier{
  List<Widget> screens = [
    HomeScreen(),
    MapScreen(),
    LoveScreen(),
    ProfileScreen(),
  ];

  User get user => FirebaseAuth.instance.currentUser!;

  int navIndex = 0;

  void onNavTap(int index){
    navIndex = index;
    notifyListeners();
  }
}