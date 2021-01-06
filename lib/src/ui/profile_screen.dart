

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_social/src/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:red_social/src/bloc/authentication_bloc/authentication_event.dart';

class ProfileScreen extends StatelessWidget {
  final String name;

  ProfileScreen({Key key, @required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Profile'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
            },            
          )
        ],
      ),
      body: Text('body profile screen'),
    );
  }


} 