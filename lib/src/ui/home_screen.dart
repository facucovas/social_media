import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_social/src/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:red_social/src/bloc/authentication_bloc/authentication_event.dart';
import 'package:red_social/src/ui/board/board_screen.dart';
import 'package:red_social/src/ui/profile/profile_screen.dart';
import 'package:red_social/src/ui/publish/publish_screen.dart';

import 'comments/comment_screen.dart';
// import 'package:red_social/src/ui/board/board_screen.dart';
// import 'package:red_social/src/ui/main_bounce_tab_bar.dart';
// import 'package:red_social/src/ui/profile/profile_screen.dart';



class HomeScreen extends StatefulWidget {
  final String name;

  HomeScreen({Key key, @required this.name}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Icon(Icons.cloud, color: Colors.blueGrey[600]),
              SizedBox(width: 10),
              Text('My Weather', style: TextStyle(color: Colors.blueGrey[500]),),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app, color: Colors.blueGrey[500],),
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
              },
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: IndexedStack(
                index: currentIndex,
                children: [
                  BoardScreen(),
                  ProfileScreen(),                
                  PublishScreen(),
                  // HomeScreen(),
                  CommentScreen(),
                  ProfileScreen(),
                ],
              ),
            ),
            // if (currentIndex != 0)              
          ],
        ),
        bottomNavigationBar:  _SocialMediaNavigationbar(
              index: currentIndex,
              onIndexSelected: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              ),
      ),
    );
  }
}

class _SocialMediaNavigationbar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onIndexSelected;

  const _SocialMediaNavigationbar({Key key, this.index, this.onIndexSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),      
      child: DecoratedBox(        
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(1, 1),
              blurRadius: 10.0
            )
          ],
          color: Colors.white,
          border: Border.all(
              color: Colors.grey[300], width: 2),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                color: Colors.transparent,
                child: IconButton(
                    icon: Icon(Icons.apps,
                        color: index == 0 ? Colors.blueGrey[900] : Colors.grey),
                    onPressed: () => onIndexSelected(0)),
              ),
              Material(
                color: Colors.transparent,
                child: IconButton(
                    icon: Icon(Icons.search,
                        color: index == 1 ? Colors.blueGrey[900] : Colors.grey),
                    onPressed: () => onIndexSelected(1)),
              ),
              Material(
                color: Colors.transparent,
                child: CircleAvatar(
                  backgroundColor: Colors.grey[400],
                  radius: 23,
                  child: IconButton(
                      icon: Icon(Icons.add_box,
                          color: index == 2 ? Colors.blueGrey[900] : Colors.grey),
                      onPressed: () => onIndexSelected(2)),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: IconButton(
                    icon: Icon(Icons.view_carousel,
                        color: index == 3 ? Colors.blueGrey[900] : Colors.grey),
                    onPressed: () => onIndexSelected(3)),
              ),
              InkWell(
                onTap: () => onIndexSelected(4),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    'https://images.pexels.com/photos/1408196/pexels-photo-1408196.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                  ),
                  backgroundColor: Colors.blueGrey[900],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
