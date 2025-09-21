import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently_c16_online/core/provider/app_provider.dart';
import 'package:evently_c16_online/core/widgets/custom_btn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../core/routes/app_route_name.dart';
import '../../../core/theme/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Spacer(),
            Center(
                child: Hero(
                    tag: "logo",
                    child: Image.asset("assets/logo/app_logo.png"))),
            Hero(
              tag: "appName",
              child: Material(
                elevation: 0,
                color: Colors.transparent,
                child: Text(
                  "Evently",
                  style: GoogleFonts.jockeyOne(
                      color: AppColors.primaryColor, fontSize: 36),
                ),
              ),
            ),
            Spacer(),

            TextFormField(
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              decoration:  InputDecoration(
                  prefixIcon: Icon(Icons.person), hintText: locale.name),
            ),
            const SizedBox(
              height: 12,
            ), TextFormField(
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              decoration:  InputDecoration(
                  prefixIcon: Icon(Icons.mail), hintText: locale.email),
            ),
            const SizedBox(
              height: 12,
            ),
            StatefulBuilder(
              builder: (context, setState) {
                return TextFormField(
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  obscureText: isShowPassword,
                  // obscuringCharacter: "\$",
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: locale.password,
                      suffixIcon: InkWell(
                        onTap: () {
                          isShowPassword = !isShowPassword;
                          setState(() {});
                        },
                        child: Icon(isShowPassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                      )),
                );
              },
            ),
            const SizedBox(
              height: 12,
            ),
            StatefulBuilder(
              builder: (context, setState) {
                return TextFormField(
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  obscureText: isShowPassword,
                  // obscuringCharacter: "\$",
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: locale.rePassword,
                      suffixIcon: InkWell(
                        onTap: () {
                          isShowPassword = !isShowPassword;
                          setState(() {});
                        },
                        child: Icon(isShowPassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                      )),
                );
              },
            ),

            Spacer(),

            CustomBtn(isExpanded: true, onTap: ()async {
              try {
                final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: "ahmed@gmail.com",
                  password: "password",
                );
              } on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                  print('The password provided is too weak.');
                } else if (e.code == 'email-already-in-use') {
                  print('The account already exists for that email.');
                }
              } catch (e) {
                print(e);
              }
            }, text: locale.createAccount),
            Spacer(),

            Text.rich(TextSpan(text: locale.haveAccount, children: [
              TextSpan(
                text: locale.login,
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
                  recognizer: TapGestureRecognizer()..onTap = (){
                    Navigator.pushReplacementNamed(context, RouteName.login);
                  }
              )
            ])),
            Spacer(),
            AnimatedToggleSwitch<String>.rolling(

              indicatorIconScale: 1.2,
              current: provider.local,
              values: const ["en", "ar"],
              iconList: [
                Image.asset("assets/icons/en.png"),
                Image.asset("assets/icons/ar.png"),
              ],
              onChanged: (value) {
                provider.changeLanguage(value);
              },
              style: ToggleStyle(
                backgroundColor: Colors.transparent,
                indicatorColor: AppColors.primaryColor,
                borderColor: AppColors.primaryColor,
              ),
              textDirection: TextDirection.ltr,

            ),

            Spacer(),
          ],
        ),
      ),
    );
  }
}
