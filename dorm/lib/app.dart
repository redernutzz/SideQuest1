import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repo/user_repository.dart';
import 'blocs/authentication_bloc/authentication_bloc_bloc.dart';

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  const MyApp(this.userRepository,{super.key});

  @override
  Widget build(BuildContext context){
    return RepositoryProvider<AuthenticationBloc>(
        create: (context) => AuthenticationBloc(
          userRepository: userRepository
        ),
        child: MyAppView(),
    );
  }

}

//55:39 continue the AUTHENTICATION BLOC