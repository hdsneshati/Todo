part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable{
  const TodoEvent();//سازنده کلاس

   @override
  List<Object> get props => [];
}
class Todostarted extends TodoEvent{}
///
class  AddTodo extends TodoEvent{
///final در Dart به این معنی است که بعد از مقداردهی اولیه، نمی‌توان مقدار متغیر را تغییر داد.اما شیء درون آن مقادیر فیلدهای تودو قابل تغییر است
final Todo todo;
 const AddTodo(this.todo);//سازنده
  @override
  List<Object> get props => [];
 
 }
 class  RemoveTodo extends TodoEvent{
  final Todo todo;
  const RemoveTodo(this.todo);//سازنده
  @override
  List<Object> get props => [];
}

class  AlterTodo extends TodoEvent{
  final int index;
  const AlterTodo(this.index);//سازنده
  @override
  List<Object> get props => [];
}
