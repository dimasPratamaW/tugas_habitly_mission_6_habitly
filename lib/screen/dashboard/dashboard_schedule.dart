import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas_habitly/style/app_color.dart';

class DashboardSchedule extends StatefulWidget {
  static const routeName = '/dashboard_schedule';
  final List<Map<String, dynamic>> activities;

  const DashboardSchedule({super.key, required this.activities});

  @override
  State<DashboardSchedule> createState() => _DashboardSchedule();
}

class _DashboardSchedule extends State<DashboardSchedule> {
  static const List<Map<String, String>> days = [
    {'letter': 'M', 'number': '1'},
    {'letter': 'T', 'number': '2'},
    {'letter': 'W', 'number': '3'},
    {'letter': 'T', 'number': '4'},
    {'letter': 'F', 'number': '5'},
    {'letter': 'S', 'number': '6'},
    {'letter': 'S', 'number': '7'},
  ];

  @override
  Widget build(BuildContext context) {
    final activities = widget.activities;

    final colors = AppColors.of(context);

    return Scaffold(
      backgroundColor: colors.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          SizedBox(
            // tanggal diatas
            height: 80,
            child: Padding(
              padding: EdgeInsetsGeometry.directional(start: 20),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: days.length,
                itemBuilder: (context, index) {
                  final day = days[index];
                  return Container(
                    width: 50,
                    child: Column(
                      children: [
                        Text(day['letter']!),
                        SizedBox(height: 10),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                          child: Center(child: Text(day['number']!)),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(// text title my Habit
            padding: EdgeInsetsGeometry.directional(start: 10),
            child: Text(
              'My Habit',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            // list habit yang dilakukan
            child: Padding(
              padding: const EdgeInsetsGeometry.symmetric(horizontal: 30),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  final activity = activities[index];
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black, width: 1),
                      ),
                    ),
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8,),
                        Text(activity['title']!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                        SizedBox(height: 10),
                        Text(activity['desc']!),
                        SizedBox(height: 10),
                        Text(activity['times']!),
                        SizedBox(height: 8,)
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
