import 'package:evently_c16_online/core/provider/app_provider.dart';
import 'package:evently_c16_online/core/theme/app_colors.dart';
import 'package:evently_c16_online/main.dart';
import 'package:evently_c16_online/modules/layout/manager/layout_provider.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appProvider = Provider.of<AppProvider>(context);
    return Consumer<LayoutProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24))),
                child: SafeArea(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Welcome Back ✨",
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                      color: theme.scaffoldBackgroundColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  provider.user.displayName?.toUpperCase() ??
                                      "",
                                  style: theme.textTheme.titleLarge!.copyWith(
                                      color: theme.scaffoldBackgroundColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            appProvider.themeMode == ThemeMode.light
                                ? "assets/icons/light.png"
                                : "assets/icons/dark.png",
                            color: Colors.white,
                            width: 36,
                            height: 36,
                          ),
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                            ),
                            child: Text(
                              appProvider.locale.toUpperCase(),
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Iconsax.location_outline,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Cairo",
                            style: theme.textTheme.bodyMedium!.copyWith(
                              color: theme.scaffoldBackgroundColor,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),

          ],
        );
      },
    );
  }
}
