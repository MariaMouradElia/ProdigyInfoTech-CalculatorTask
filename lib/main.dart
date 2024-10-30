import 'package:calculator_version_2/constants/assets.dart';
import 'package:calculator_version_2/screens/calculator_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CalculatorScreen(),
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(AssetData.scaffBodyColor),
          appBarTheme: AppBarTheme(
            toolbarHeight: AssetData.appBarHeight,
            elevation: 0,
            backgroundColor: Color(AssetData.scaffAppBarColor),
          ),
        ),
      ),
    );
  }
}
//()