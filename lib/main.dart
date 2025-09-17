import 'package:evently_c16_online/core/provider/app_provider.dart';
import 'package:evently_c16_online/core/theme/app_colors.dart';
import 'package:evently_c16_online/core/theme/app_theme.dart';
import 'package:evently_c16_online/modules/splash/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: provider.themeMode,
      home: SplashScreen(),
    );
  }
}
