import 'package:flutter/material.dart';
import 'package:flutter_application_bloc_project/home.dart';
import 'package:flutter_application_bloc_project/todo_bloc/todo_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
void main() async{// تابع غیرهمزمان
 WidgetsFlutterBinding.ensureInitialized();//ین خط تضمین می‌کند که  ویجت‌های فلاتر مقداردهی اولیه شده‌اند
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:  HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  runApp(const MainApp());
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
          primary: Colors.yellowAccent,
          onPrimary: Colors.white,
          secondary: Colors.lightGreen,
          onSecondary: Colors.white,
        ),        
      ),
      home: BlocProvider<TodoBloc>(
        create: (context) => TodoBloc()..add(
          Todostarted()
          ),
        child:const HomeScreen(),
      ),
    );
  }
}
