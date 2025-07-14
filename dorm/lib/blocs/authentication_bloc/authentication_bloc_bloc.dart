import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repo/user_repository.dart';

part 'authentication_bloc_event.dart';
part 'authentication_bloc_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationBlocState> {
  AuthenticationBloc() : super(AuthenticationBlocInitial()) {
    on<AuthenticationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

