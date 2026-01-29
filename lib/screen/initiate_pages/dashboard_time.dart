import 'package:flutter/material.dart';
import 'package:tugas_habitly/screen/dashboard/dashboard_schedule.dart';
import 'package:tugas_habitly/screen/dashboard/main_dashboard.dart';
import 'package:tugas_habitly/style/app_color.dart';

class DashboardTime extends StatelessWidget {
  static const routeName = '/dashboard_time';
  const DashboardTime({super.key});

  final List<Map<String, dynamic>> listTime = const [
    {'time': '06:00', 'title': 'Morning'},
    {'time': '12:00', 'title': 'Noon'},
    {'time': '16:00', 'title': 'Afternoon'},
    {'time': '21:00', 'title': 'Evening'},
  ];

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);

    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final email = args['email'] ?? '';
    final password = args['password'] ?? '';
    final habit = args['habit'] ?? '';

    return Scaffold(
      backgroundColor: colors.background,
      body: Column(
        children: [
          const SizedBox(height: 100),
          Text.rich(
            style: TextStyle(fontWeight: FontWeight.bold),
            TextSpan(
              text: 'When you want us to remind u to do ',
              children: [
                TextSpan(
                  text: habit,
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                    decorationThickness: 3
                  ),
                ),
                const TextSpan(text: ' ?'),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text('Select One'),
          SizedBox(height: 16),


          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: listTime.length,
              itemBuilder: (context, index) {
                final time = listTime[index];

                return Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 12,
                    bottom: 24,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        MainDashboard.routeName,
                        arguments: {
                          'email': email,
                          'password': password,
                          'habit': habit,
                          'time': time['time'],
                        },
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Text(time['time'],style: TextStyle(fontSize: 50),),
                        SizedBox(height: 10),
                        Text(time['title'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
