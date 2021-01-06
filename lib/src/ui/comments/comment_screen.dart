import 'package:flutter/material.dart';
import 'package:red_social/src/ui/comments/comment_moc.dart';


class CommentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.blueGrey[600]
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 12,
            child: _postComments(),
          ),          
        ],
      ),
    );
  }

  Widget _postComments() {    
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Container(
        width: double.infinity,
        height: 350.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
        ),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: postComment.length,
          itemBuilder: (context, index) => _comment(postComment[index], index),
        ),
      ),
    );
  }

  Widget _comment(PostComment comentario, int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 5, right: 5, bottom: 10),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                offset: Offset(0, 2),
                blurRadius: 6.0
              )
            ]
          ),
          child: CircleAvatar(
            child: ClipOval(
              child: Image(
                height: 50,
                width: 50,
                image: NetworkImage(
                  comentario.userImage
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: Text(
          comentario.userName,
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
          ),
        subtitle: Text(comentario.comment),
        trailing: IconButton(
          icon: Icon(Icons.favorite_border, color: Colors.grey),
          onPressed: () => {},
        ),
      ),
    );
  }
}