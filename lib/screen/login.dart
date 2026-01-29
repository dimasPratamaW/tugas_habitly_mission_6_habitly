import 'package:flutter/material.dart';
import 'package:tugas_habitly/screen/initiate_pages/dashboard_habit.dart';
import 'package:tugas_habitly/screen/register.dart';
import 'package:tugas_habitly/widget/custom_field.dart';

import '../style/app_color.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';

  Future<void> goToRegister() async {
    final registeredAccount = await Navigator.pushNamed(
      context,
      RegisterView.routeName,
    );

    if (!mounted) return;
    if (registeredAccount != null) {
      final data = registeredAccount as Map<String, dynamic>;

      setState(() {
        email = data['email'];
        password = data['password'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoginView(goRegister: goToRegister);
  }
}

class LoginView extends StatefulWidget {
  final VoidCallback goRegister;

  const LoginView({super.key, required this.goRegister});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);

    return Scaffold(
      backgroundColor: colors.background,
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/logo_app.png', height: 320, width: 320),
              CustomField(
                // INSERT EMAIL HERE
                label: "email@domain.com",
                controller: emailController,
                backgroundColor: Colors.white,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Email can’t be empty';
                  }
                  return null;
                },
              ),

              CustomField(
                // INSERT PASSWORD
                label: "password",
                controller: passwordController,
                backgroundColor: Colors.white,
                obsecure: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Password can’t be empty';
                  }
                  return null;
                },
              ),

              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: const Size(double.infinity, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;

                    Navigator.pushReplacementNamed(
                      context,
                      DashboardHabit.routeName,
                      arguments: {
                        'email': emailController.text,
                        'password': passwordController.text,
                      },
                    );
                  },
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Expanded(child: Divider(thickness: 2)),
                    Text(' or ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    Expanded(child: Divider(thickness: 2)),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    minimumSize: const Size(double.infinity, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                  onPressed: widget.goRegister,
                  child: const Text(
                    "Register Account",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
