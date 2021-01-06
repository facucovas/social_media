import 'package:flutter/material.dart';
import 'package:red_social/src/repository/user_repository.dart';
import 'package:red_social/src/ui/register/register_screen.dart';


class CreateAccountButton extends StatelessWidget {

  final UserRepository _userRepository;

  CreateAccountButton({Key key, @required UserRepository userRepository})
    :assert(userRepository != null),
    _userRepository = userRepository,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('Crear cuenta'),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            //Volver a la pantalla de registro
            return RegisterScreen(userRepository: _userRepository,);
          })
        );
      },
    );
  }
}