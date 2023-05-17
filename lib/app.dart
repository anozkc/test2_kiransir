import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:studentbatch/view/batch_view.dart';
import 'package:studentbatch/view/dashboard_view.dart';
import 'package:studentbatch/view/login_view.dart';
import 'package:studentbatch/view/register_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes:{
        '/': (context)=> const DashboardView(),
        '/loginroute': (context)=> const LoginView(),
        '/registerroute': (context)=> const RegisterView(),
        '/batchviewrroute': (context)=> const BatchView()

      },
    
    );
  }
}