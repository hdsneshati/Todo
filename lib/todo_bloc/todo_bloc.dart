import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../todo.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends HydratedBloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState()) {
    on<TodoEvent>((event, emit) {

      // TODO: implement event handler
    });
     void _onStarted(
      Todostarted event,
      Emitter<TodoState> emit,//باهاش وضعیت تغییر میدیم
    ){
      if(state.status == TodoStatus.success) return;
      emit(state.copyWith(
        todos: state.todos,
        status: TodoStatus.success,));
    }


     void _onAddTodo(
      AddTodo event,
      Emitter<TodoState> emit,
    ) {
      // ابتدا وضعیت را روی "در حال پردازش" قرار می‌دهیم
      emit(
        state.copyWith(        
        status: TodoStatus.loading,
        )
      );
      try {
        List<Todo> temp=[];// یک لیست جدید برای نگهداری تسک‌ها
        temp.addAll(state.todos);// کپی کردن تمام تسک‌های قبلی
        temp.insert(0, event.todo);// اضافه کردن تسک جدید به ابتدای لیست
       // وضعیت را به موفقیت تغییر داده و لیست جدید را ذخیره می‌کنیم
        emit(
          state.copyWith(
            todos: temp,
            status: TodoStatus.success,
          )
        );
        } catch (e) {
          // اگر خطایی رخ دهد، وضعیت را به "خطا" تغییر می‌دهیم
          emit(
            state.copyWith(
              status: TodoStatus.error,
            )
          );
    }
    
    }

     void _onRemoveTodo(
      RemoveTodo event,
      Emitter<TodoState> emit,
    ) {
      // ا��تدا وضعیت را روی "در حال پردا��ش" قرار می‌دهیم
      emit(
        state.copyWith(        
        status: TodoStatus.loading,
        )
      );
      try {
        state.todos.remove(event.todo);
        emit(
          state.copyWith(
            todos: state.todos,
            status: TodoStatus.success,
          )
        );
        } catch (e) {
          // اگر خطایی رخ دهد، وضعیت را به "خطا" تغییر می‌دهیم
          emit(
            state.copyWith(
              status: TodoStatus.error,
            )
          );
        }
    }

     void _onAlterTodo(
      AlterTodo event,
      Emitter<TodoState> emit,
    ) {
      // اکنون وضعیت را روی "در حال پردا��ش" قرار می‌دهیم
      emit(
        state.copyWith(        
        status: TodoStatus.loading,
        )
      );
      try {
        state.todos[event.index].isDone = !state.todos[event.index].isDone;
        emit(
          state.copyWith(
            todos: state.todos,
            status: TodoStatus.success,
          )
        );
        } catch (e) {
          // اگر خطایی رخ دهد، وضعیت را به "خطا" تغییر می‌دهیم
          emit(
            state.copyWith(
              status: TodoStatus.error,
            )
          );
        }
    }



    on<AlterTodo>((event, emit) {_onAlterTodo(event, emit);});
    on<RemoveTodo>((event, emit) {_onRemoveTodo(event, emit);});
    on<Todostarted>((event, emit) {_onStarted(event, emit);});
    on<AddTodo>((event, emit) {_onAddTodo(event, emit);});
 
    }

  @override
  TodoState? fromJson(Map<String, dynamic> json) {
    
    throw UnimplementedError();
  }
  
  @override
  Map<String, dynamic>? toJson(TodoState state) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
