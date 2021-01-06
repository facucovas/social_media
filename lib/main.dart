import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_social/src/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:red_social/src/bloc/authentication_bloc/authentication_event.dart';
import 'package:red_social/src/bloc/authentication_bloc/authentication_state.dart';
import 'package:red_social/src/bloc/authentication_bloc/simple_bloc_observer.dart';
import 'package:red_social/src/repository/user_repository.dart';
import 'package:red_social/src/ui/home_screen.dart';
import 'package:red_social/src/ui/login/login_screen.dart';
import 'package:red_social/src/ui/spash_screen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
 
  final UserRepository userRepository = UserRepository();
  
  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(userRepository: userRepository)
      ..add(AppStarted()),
      child: App(userRepository: userRepository),
    )
  );

}

class App extends StatelessWidget {
  final UserRepository _userRepository;

  App({Key key, @required userRepository})
    : assert (userRepository != null),
    _userRepository = userRepository, 
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Uninitialized) {
            return SpashScreen();
          }
          if (state is Authenticated) {
            return HomeScreen(name: state.displayName);
          }
          if (state is Unauthenticated) {
            return LoginScreen(userRepository: _userRepository,);
          }
          return Container();
        }
      )
    );
  }
}