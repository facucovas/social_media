



import 'package:red_social/src/util/validators.dart';

import 'bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_social/src/bloc/register_bloc/bloc.dart';
import 'package:red_social/src/repository/user_repository.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  
  final UserRepository _userRepository;

  RegisterBloc({@required UserRepository userRepository})
    :assert(userRepository != null),
    _userRepository = userRepository, super(RegisterState.empty());


  @override
  Stream<Transition<RegisterEvent, RegisterState>> transformEvents(Stream<RegisterEvent> events, next) {
     final nonDebounceStream = events.where((event) {
        return (event is! EmailChanged && event is! PasswordChanged);
      });

      final debounceStream = events.where((event) {
        return (event is EmailChanged || event is PasswordChanged);
      }).debounceTime(Duration(milliseconds: 300));

      return super.transformEvents(nonDebounceStream.mergeWith([debounceStream]), next);
  }


  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    //tres casos
    //si el evento es emailchanged
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    }
    //si el evento es passwrodChanged
    if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    }
    //si el evento es submitted
    if (event is Submitted) {
      yield* _mapFormSubmittedToState(event.email, event.password);
    }
  }

  Stream<RegisterState> _mapEmailChangedToState(String email) async* {
    yield state.update(
      isEmailValid: Validators.isValidEmail(email)
    );
  }

  Stream<RegisterState> _mapPasswordChangedToState(String password) async* {
    yield state.update(
      isPasswordValid: Validators.isPasswordValid(password)
    );
  }

  Stream<RegisterState> _mapFormSubmittedToState(
    String email, String password
  ) async* {
    yield RegisterState.loading();
    try {
      await _userRepository.signUp(email, password);
      yield RegisterState.success();
    } catch (_) {
      yield RegisterState.failure();
    }
  }

}