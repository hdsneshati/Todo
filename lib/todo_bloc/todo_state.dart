part of 'todo_bloc.dart';

enum TodoStatus {initial,loading,success,error}
class TodoState extends Equatable  {
  final TodoStatus status;
  final List<Todo> todos;

  const TodoState({
    this.status=TodoStatus.initial,

    this.todos=const <Todo>[],
    });

    TodoState copyWith({
      TodoStatus? status,
      List<Todo>? todos,
    }) {
      return TodoState(
        status: status?? this.status,
        todos: todos?? this.todos,
      );
    }
    @override
     factory TodoState.fromJson(Map<String, dynamic> json) {
      try {
        var listOfTodos=(json['todos'] as List<dynamic>).
        map((e) => Todo.fromJson(e as Map<String,dynamic>)).
        toList();
        return TodoState(
          todos: listOfTodos,
          status: TodoStatus.values.firstWhere(
            (element) => element.name.toString() == json['status']
            ),
          
        );
     }catch (e) {
      rethrow;
      }
     }
    Map<String, dynamic> toJson(){
      return {
        'status': status.name,
        'todos': todos,
      };
    }
    @override
    List<Object> get props => [ todos,status];
}