import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_social/src/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:red_social/src/bloc/authentication_bloc/bloc.dart';
import 'package:red_social/src/bloc/register_bloc/bloc.dart';
import 'package:red_social/src/ui/register/register_button.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  RegisterBloc _registerBloc;

  bool get isPopulated => 
  _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isRegisterButtonEnabled(RegisterState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.isSubmitting) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Registering'),
                    CircularProgressIndicator()
                  ],
                )
              )
            );
        }
        //si estado is success
        if (state.isSuccess) {
          BlocProvider.of<AuthenticationBloc>(context)
            .add(LoggedIn());
          Navigator.of(context).pop();
        }
        //si el estado es failure
        if (state.isFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Registration failure'),
                    Icon(Icons.error)
                  ],
                ),
                backgroundColor: Colors.red,
              )
            );
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              child: ListView(
                children: <Widget>[
                  _emailInput(state),
                  _passwordInput(state),
                  RegisterButton(
                    onPressed: isRegisterButtonEnabled(state)
                      ? _onFormSubmitted
                      : null,
                  )
                ],
              )
            ),
          );
        },
      ),
    );
  }


  Widget _emailInput(RegisterState state) {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(
        icon: Icon(Icons.email),
        labelText: 'Email'
      ),
      keyboardType: TextInputType.emailAddress,
      autovalidate: true,
      autocorrect: false,
      validator: (_) {
        return !state.isEmailValid ? 'Invalid Email' : null;
      },
    );
  }

  Widget _passwordInput(RegisterState state) {
    return TextFormField(
      controller: _passwordController,
      decoration: InputDecoration(
        icon: Icon(Icons.lock),
        labelText: 'Password'
      ),
      obscureText: true,
      autovalidate: true,
      autocorrect: false,
      validator: (_) {
        return !state.isPasswordValid? 'Invalid Password' : null;
      },
    );
  }

  void _onEmailChanged() {
    _registerBloc.add(
      EmailChanged(email: _emailController.text)
    );
  }

  void _onPasswordChanged() {
    _registerBloc.add(
      PasswordChanged(password: _passwordController.text)
    );
  }

  void _onFormSubmitted() {
    _registerBloc.add(
      Submitted(
        email: _emailController.text,
        password: _passwordController.text
      )
    );
  }

}