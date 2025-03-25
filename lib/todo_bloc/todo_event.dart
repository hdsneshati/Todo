
part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class Todostarted extends TodoEvent{

}
class  AddTodo extends TodoEvent{
  final Todo todo;
  const AddTodo(this.todo);
  @override
  List<Object> get props => [];
}
class  RemoveTodo extends TodoEvent{
  final Todo todo;
  const RemoveTodo(this.todo);
  @override
  List<Object> get props => [];
}

class  AlterTodo extends TodoEvent{
  final int index;
  const AlterTodo(this.index);
  @override
  List<Object> get props => [];
}