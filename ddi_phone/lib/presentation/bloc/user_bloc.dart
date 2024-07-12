import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/usecases/get_user.dart';
import '../../domain/entities/user.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUser getUser;

  UserBloc(this.getUser) : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is GetUserEvent) {
      yield UserLoading();
      try {
        final user = await getUser(event.id);
        yield UserLoaded(user: user);
      } catch (_) {
        yield UserError();
      }
    }
  }
}

part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUserEvent extends UserEvent {
  final String id;
  
  const GetUserEvent(this.id);
  
  @override
  List<Object> get props => [id];
}

part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
  
  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final User user;
  
  const UserLoaded({required this.user});
  
  @override
  List<Object> get props => [user];
}

class UserError extends UserState {}
