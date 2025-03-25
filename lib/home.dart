import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_bloc_project/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import './main.dart';
import './todo_bloc/todo_bloc.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  addTodo(Todo todo) {
    context.read<TodoBloc>().add(
      AddTodo(todo)
      );
  }
   removeTodo(Todo todo) {
    context.read<TodoBloc>().add(
      RemoveTodo(todo)
      );
  }
  alterTodo(int index) {
    context.read<TodoBloc>().add(
      AlterTodo(index)
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(//اگه رفرش کنیم و پلیسهولدر باشه یه صفحه سیاه میاره ولی تو این حالت بهتره
      
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          TextEditingController controler1= TextEditingController(); 
          TextEditingController controler2= TextEditingController(); 
          showDialog(context: context,
           builder: (context){
            return AlertDialog(
              title: Text('Add Todo'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: controler1,
                    cursorColor: Theme.of(context).colorScheme.secondary,
                    decoration: InputDecoration(
                      hintText: 'Title',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                          width: 1,
                          style: BorderStyle.solid,
                        )
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1,
                          style: BorderStyle.solid,
                        )
                      )
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ), 
              actions: [
                Padding(
                  padding:const EdgeInsets.all(15.0),
                   child: TextButton(
                    onPressed:(){
                      addTodo(
                        Todo(
                          title: controler1.text,
                          subtitle: controler2.text,                    
                        ),
                      );
                      controler1.text='';
                      controler2.text='';
                      Navigator.pop(context);
                    }, 
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      foregroundColor: Theme.of(context).colorScheme.secondary,

                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width ,
                      child: const Icon(
                        CupertinoIcons.check_mark,
                        color: Colors.green,
                       
                      ),
                    ),
                  ),
                   )
              ],                      
            );
           }
          );
        },
        backgroundColor: Theme.of(context).colorScheme.background,
        child: const Icon(
             CupertinoIcons.add,
             color: Colors.black,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(  context).colorScheme.primary,
        elevation: 0, // حذف سایه‌ی AppBar
        title: Text(
          'my app todo',
          style: TextStyle(
            color: Theme.of(  context).colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
            ),
        ),
      ),
      body:Padding(
        padding: const EdgeInsets.all(0.8),
          child:BlocBuilder<TodoBloc,TodoState>(
            builder:(context, state) {
              if(state.status == TodoStatus.success){
                return Container();
            }else if(state.status == TodoStatus.initial){
              return const Center(child: CircularProgressIndicator());    
            }
            else{
              return Container();
            }
            },
          )
        ),
      );
    
  }
}