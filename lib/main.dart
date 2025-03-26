import 'package:flutter/material.dart';
import 'package:flutter_application_bloc_project/home.dart';
import 'package:flutter_application_bloc_project/todo_bloc/todo_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

void main() {
  // تابع غیرهمزمان

  runApp(
     BlocProvider<TodoBloc>(
      create: (context) => TodoBloc(),
       child:const MainApp()
       ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          background: Colors.white,
          onBackground: Colors.black,
          primary: Color.fromARGB(255, 215, 122, 15),
          onPrimary: Colors.white,
          secondary: Colors.lightGreen,
          onSecondary: Colors.white,
        ),
      ),
      home:  const HomeScreen(),      
    );
  }
}
