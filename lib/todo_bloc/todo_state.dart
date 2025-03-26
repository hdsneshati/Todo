part of 'todo_bloc.dart';



// مجموعه‌ای از مقادیر ثابت را تعریف می‌کند.
enum TodoStatus {initial,loading,success,error}
//وضعیت فعلی
class TodoState extends Equatable  {
  final TodoStatus status;
  final List<Todo> todos;

  //سازنده
  const TodoState({
    this.status=TodoStatus.initial,

    this.todos=const <Todo>[],
    });

    TodoState copyWith({
     
      TodoStatus? status,
      List<Todo>? todos,
    }) {
      return TodoState(
         //اگر مقدار جدید داده نشود، مقدار قبلی حفظ خواهد شد
        status: status?? this.status,
        todos: todos?? this.todos,
      );
    }
     @override
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











