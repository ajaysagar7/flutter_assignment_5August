import 'package:elred_assignment_2/config/app_keys.dart';
import 'package:elred_assignment_2/providers/Date/date_provider.dart';
import 'package:elred_assignment_2/providers/Designation/designation_provider.dart';
import 'package:elred_assignment_2/providers/HomeScreen/home_screen_provider.dart';
import 'package:elred_assignment_2/providers/Profession/profession_provider.dart';
import 'package:elred_assignment_2/providers/Profile/profile_provider.dart';
import 'package:elred_assignment_2/providers/Radio/radio_provider.dart';
import 'package:elred_assignment_2/providers/Validation/validation_provider.dart';
import 'package:elred_assignment_2/providers/json_provider.dart';
import 'package:elred_assignment_2/screens/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => JsonProvider()),
        ChangeNotifierProvider(create: (_) => HomeScreenProvider()),
        ChangeNotifierProvider(create: (_) => ValidationProvider()),
        ChangeNotifierProvider(create: (_) => RadioProvder()),
        ChangeNotifierProvider(create: (_) => DateProvider()),
        ChangeNotifierProvider(create: (_) => ProfessionsProvider()),
        ChangeNotifierProvider(create: (_) => DesignationProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
      ],
      child: MaterialApp(
        scaffoldMessengerKey: AppKeys.scaffoldMessaerKey,
        navigatorKey: AppKeys.globalKey,
        debugShowCheckedModeBanner: false,
        title: "Elred App",
        home: const HomeScreen(),
      ),
    );
  }
}
