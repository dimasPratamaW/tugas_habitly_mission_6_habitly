import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_habitly/screen/dashboard/main_dashboard.dart';
import 'package:tugas_habitly/screen/initiate_pages//dashboard_habit.dart';
import 'package:tugas_habitly/screen/initiate_pages/dashboard_time.dart';
import 'package:tugas_habitly/screen/login.dart';
import 'package:tugas_habitly/screen/register.dart';
import 'screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.urbanistTextTheme(Theme.of(context).textTheme)),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        RegisterView.routeName: (_) => const RegisterScreen(),
        DashboardHabit.routeName: (_) => const DashboardHabit(),
        DashboardTime.routeName: (_) => const DashboardTime(),
        MainDashboard.routeName: (_) => const MainDashboard()
      },
    );
  }
}
