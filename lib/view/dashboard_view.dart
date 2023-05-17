import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/loginroute');
            }, child: const Text('Login'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/registerroute');
            }, child: const Text('register'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/batchviewrroute');
            }, child: const Text('view batch'),
          ),
        ],
      ),
    );
  }
}
