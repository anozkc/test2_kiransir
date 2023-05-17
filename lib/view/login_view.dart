import 'package:flutter/material.dart';

import '../model/student.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> fKey = GlobalKey<FormState>();
  final fnamecontroller = TextEditingController();
  final batchcontroller = TextEditingController();
  List<Student>? lstStudent;

  @override
  void didChangeDependencies() {
    lstStudent = ModalRoute.of(context)!.settings.arguments as List<Student>?;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void login(String fname, String batch) {
    // Check if the entered sid and password exist in the list
    for (var i = 0; i < lstStudent!.length; i++) {
      if (fname == lstStudent![i].fname && batch == lstStudent![i].batch) {
        // Navigate to the batchview
        Navigator.pushNamed(
          context,
          '/batchviewrroute',
          arguments: lstStudent,
        );
        return;
      }
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Invalid fname or batch'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login Screen',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: fKey,
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                height: 400,
                width: double.infinity,
                color: Colors.black,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      controller: fnamecontroller,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                        hintText: 'Enter your first name',
                        hintStyle: TextStyle(color: Colors.white60),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: batchcontroller,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                        hintText: 'Enter your batch',
                        hintStyle: TextStyle(color: Colors.white60),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (fKey.currentState!.validate()) {
                            login(fnamecontroller.text, batchcontroller.text);
                          }
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to the signup page
                        Navigator.pushNamed(
                          context,
                          '/batchviewrroute',
                          arguments: lstStudent,
                        );
                      },
                      style: const ButtonStyle(
                        mouseCursor: MaterialStateMouseCursor.clickable,
                      ),
                      child: const Text(
                        "Don't have an account? Sign up",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
