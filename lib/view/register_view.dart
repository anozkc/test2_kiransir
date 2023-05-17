import 'package:flutter/material.dart';

import '../model/student.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final gap = const SizedBox(height: 8);
  List<String> batch = ["30A", "30B", "29A", "29B"];
  List<Student> lstStudent = [];

  final fnamecontroller = TextEditingController();
  final lnamecontroller = TextEditingController();
  final agecontroller = TextEditingController();
  String? gender;
  String? selectedBatch;
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register View'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Form(
          key: key,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: fnamecontroller,
                  decoration: const InputDecoration(
                    labelText: 'first name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter fname';
                    }
                    return null;
                  },
                ),
                gap,
                TextFormField(
                  controller: lnamecontroller,
                  decoration: const InputDecoration(
                    labelText: 'last Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter last name';
                    }
                    return null;
                  },
                ),
                gap,
                TextFormField(
                  controller: agecontroller,
                  decoration: const InputDecoration(
                    labelText: 'Age',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter age';
                    }
                    return null;
                  },
                ),

                gap,
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Select gender'),
                ),
                // Create radio button for gender
                RadioListTile(
                  title: const Text('Male'),
                  value: 'Male',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('Female'),
                  value: 'Female',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('Others'),
                  value: 'Others',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
                gap,
                DropdownButtonFormField(
                  validator: (value) {
                    if (value == null) {
                      return 'Please select Batch';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Batch',
                    border: OutlineInputBorder(),
                  ),
                  items: batch
                      .map(
                        (batch) => DropdownMenuItem(
                          value: batch,
                          child: Text(batch),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedBatch = value;
                    });
                  },
                ),

                gap,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (key.currentState!.validate()) {
                        // Create a student object and add it to the list of students
                        var student = Student(
                          fname: fnamecontroller.text.trim(),
                          lname: lnamecontroller.text.trim(),
                          age: int.parse(agecontroller.text.trim()),
                          gender: gender!,
                          batch: selectedBatch!,
                        );
                        lstStudent.add(student);

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Student added successfully'),
                          ),
                        );
                      }
                    },
                    child: const Text('Add student'),
                  ),
                ),
                gap,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/loginroute',
                        arguments: lstStudent,
                      );
                    },
                    child: const Text('register'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
