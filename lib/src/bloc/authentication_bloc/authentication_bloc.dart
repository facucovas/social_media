




import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:red_social/src/bloc/authentication_bloc/authentication_event.dart';
import 'package:red_social/src/bloc/authentication_bloc/authentication_state.dart';
import 'package:red_social/src/repository/user_repository.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;


  AuthenticationBloc({@required UserRepository userRepository})
    : assert(userRepository != null),
    _userRepository = userRepository, super(Uninitialized());

  // @override
  // AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    }
    if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    }
    if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    }
  }


  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      final isSignedIn = await _userRepository.isSignedIn();
      if (isSignedIn) {
        final fireBaseUser = await _userRepository.getUser();
        yield Authenticated(fireBaseUser);
      } 
      else {
        yield Unauthenticated();
      }
    } catch (_) {
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState() async* {
    yield Authenticated(await _userRepository.getUser());
  }

  
  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    yield Unauthenticated();
    _userRepository.signOut();
  }

}
