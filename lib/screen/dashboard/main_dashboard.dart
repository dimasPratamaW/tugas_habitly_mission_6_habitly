import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tugas_habitly/screen/dashboard/add_new_habit.dart';
import 'package:tugas_habitly/screen/dashboard/dashboard_schedule.dart';
import 'package:tugas_habitly/screen/dashboard/user_account.dart';
import 'package:tugas_habitly/style/app_color.dart';

class MainDashboard extends StatefulWidget {
  static const routeName = '/main_dashboard';

  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  final List<Map<String, dynamic>> listActivities = [
    {
      'title': 'Run 5 Km',
      'desc': 'usually compeleted at 09:00',
      'times': '09:00',
    },
    {
      'title': 'go to gym',
      'desc': 'usually compeleted at 16:00 ',
      'times': '16:00',
    },
    {
      'title': 'reading one page',
      'desc': 'usually compeleted at 19:00',
      'times': '19:00',
    },
  ];

  int currentPages = 0;

  void addOneHabit(Map<String, dynamic> activity) {
    setState(() {
      listActivities.add(activity);
    });
  }

  String email = '';
  String password ='';

  List<Widget> pagesWidget() {
    return [
      DashboardSchedule(activities: listActivities),
      AddNewHabit(onAdd: addOneHabit),
      UserAccount(email: email, password: password)

    ];
  }

  bool _loadedFromArgs = false;

  final List<Widget> _titles = [
    Text(
      DateFormat("MMMM dd").format(DateTime.now()),
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    const Text(
      'Add New Habit',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    const Text(
      'Account',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    if (!_loadedFromArgs) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

      setState(() {
        listActivities.insert(0,{
          'title': args['habit'],
          'desc': 'first habit',
          'times': args['time'],
        });
        email = args['email'];
        password = args['password'];

      });
      _loadedFromArgs = true;
    }

    return Scaffold(
      appBar: AppBar(
        leading: Center(child: Text("Today")),
        title: Center(
          child: _titles[currentPages]
        ),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.account_circle))
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPages,
        onDestinationSelected: (int index) {
          setState(() {
            currentPages = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home_outlined, size: 20),
            label: 'home',
          ),
          NavigationDestination(
            icon: Icon(Icons.add_circle_outline_rounded, size: 40),
            label: 'Add Habit',
          ),
          NavigationDestination(
            icon: Icon(Icons.person, size: 20),
            label: 'account',
          ),
        ],
      ),
      body: IndexedStack(
          index: currentPages, children: pagesWidget()),
    );
  }
}
