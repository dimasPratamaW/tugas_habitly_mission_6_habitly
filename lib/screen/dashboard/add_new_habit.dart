import 'package:flutter/material.dart';
import 'package:tugas_habitly/style/app_color.dart';
import 'package:tugas_habitly/widget/custom_field.dart';

class AddNewHabit extends StatefulWidget {
  final void Function(Map<String, dynamic>) onAdd;

  const AddNewHabit({super.key, required this.onAdd});

  @override
  State<AddNewHabit> createState() => _AddNewHabitState();
}

class _AddNewHabitState extends State<AddNewHabit> {
  final titleHabit = TextEditingController();
  final descHabit = TextEditingController();
  String timeHabit = '06:00';
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(DateTime date) async {
    setState(() {
      selectedDate = date;
    });
  }

  @override
  void dispose() {
    titleHabit.dispose();
    descHabit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    final List<String> timeOptions = [
      '06:00',
      '09:00',
      '12:00',
      '15:00',
      '18:00',
      '21:00',
    ];

    final colors = AppColors.of(context);

    return Scaffold(
      backgroundColor: colors.background,
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20,),
              CustomField(
                label: 'Habit Name',
                backgroundColor: Colors.white,
                controller: titleHabit,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'cant be empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              CustomField(
                label: 'Habit Description',
                backgroundColor: Colors.white,
                controller: descHabit,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'cant be empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 40),
                child: Card(
                  color: Color(0XFFECE6F0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        child: InputDatePickerFormField(
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2027),
                          initialDate: selectedDate,
                          onDateSubmitted: _selectDate,
                          onDateSaved: (date) {
                            selectedDate = date;
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('When we should remind you ?'),
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(vertical: 10),
                        child: DropdownMenu<String>(
                          initialSelection: timeOptions[0],
                          dropdownMenuEntries: timeOptions.map((value) {
                            return DropdownMenuEntry<String>(
                              value: value,
                              label: value,
                            );
                          }).toList(),
                          onSelected: (value) {
                            if (value != null) {
                              setState(() {
                                timeHabit = value;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsetsGeometry.directional(start: 30, end: 30),
                child: ElevatedButton(
                  //button register
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;

                    widget.onAdd({
                      'title': titleHabit.text,
                      'desc': descHabit.text,
                      'times': timeHabit,
                    });

                    // optional: clear fields after adding
                    titleHabit.clear();
                    descHabit.clear();
                    setState(() {
                      timeHabit = timeOptions[0];
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF2FB969),
                    minimumSize: const Size(double.infinity, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Save habit",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
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
