import 'package:dashboard_task/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCkLZ9CUMSR0HhoTQ1xJbVjvRbS_jNuyOs",
      projectId: "dashboard-a2ac9",
      messagingSenderId: "15944371985",
      appId: "1:15944371985:web:2834b4336cf818848246b0",
      ));
    
 return runApp(
  const MyApp()
 );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter =AppRouter();
    return  MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
      
    );
  }
}