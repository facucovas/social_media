import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_social/src/ui/board/board_moc.dart';
import 'package:red_social/src/ui/comments/comment_moc.dart';
import 'package:red_social/src/ui/comments/comment_screen.dart';

class BoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
        child: Scaffold(
        backgroundColor: Colors.grey[200],       
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: comments.length,
          itemBuilder: (context, index) => CommentItem(
            comment: comments[index],
            index: index
          ),
        ),      
      ),
    );
  }
} 


class CommentItem extends StatelessWidget {

  final Comment comment;
  final int index;

  const CommentItem({Key key, this.comment, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(      
      child: FittedBox(
        fit: BoxFit.none,
        // alignment: index.isOdd ? Alignment.centerLeft : Alignment.centerRight,
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(20)),    
          child: Row(
            children: <Widget>[
              _post(context),
            ],
          ),
          ),
        ),
      );
  }


  Widget _post(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => _openDialogBoxGrow(context, comment),//_tripEditModalBottomSheet(context, comment),
            child: Row(              
              children: [             
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.transparent,
                    height: 120,
                    width: MediaQuery.of(context).size.width * .2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.accessibility, 
                              size: 50,
                              color: Colors.blueGrey[200],
                            ),
                            SizedBox(width: 5),
                            Text(
                              '30',
                              style: TextStyle(
                                color: Colors.blueGrey[200],
                                fontSize: 20
                              ),
                            )
                          ],
                        ),                      
                      ],
                    ),
                  ),
                ),
                Container(   
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width * .8,
                  height: 130,
                  child: Material(
                      color: Colors.white,
                      elevation: 1.0,  
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(14), 
                        topLeft: Radius.circular(14),                     
                      ),
                      shadowColor: Colors.black,    
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        textDirection: TextDirection.ltr,          
                        children: <Widget>[            
                          _testHeaderRight(),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    _title(),
                                    _content(),
                                  ],
                                ),
                                SizedBox(width: 5),
                                Container(
                                  child: Icon(
                                    Icons.cloud,
                                    color: Colors.blueGrey[50],
                                    size: 60,
                                  ),                          
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                ),
              ],
            ),
          ),
      ),
    );
  }

  void _tripEditModalBottomSheet(BuildContext context, Comment comment) {
    // _openDialogBoxGrow(context);
    showModalBottomSheet(      
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      context: context,       
      backgroundColor: Colors.black,
      isScrollControlled: true, 
      elevation: 5,
      builder: (context) => SingleChildScrollView(
        child: Container(
            color: Color(0xFF737373),
            height: MediaQuery.of(context).size.height * .8,
            child: Container(
              decoration: new BoxDecoration(
                color: Colors.grey[200],
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(20.0),
                  topRight: const Radius.circular(20.0))
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 200.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 70,
                                height: 70,
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
                                      height: 70,
                                      width: 70,
                                      image: NetworkImage(
                                        comment.userImage
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    comment.userName, 
                                    style: TextStyle(
                                      fontSize: 20
                                    ), 
                                    textAlign: TextAlign.left),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.cancel, color: Colors.grey, size: 25,),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 30, left: 20),
                              child: Text(
                                comment.title, 
                                style: TextStyle(
                                  fontSize: 20
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: Text(comment.description, style: TextStyle(
                                fontSize: 15,
                              ),),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: _postComments(),
                    ),
                    Transform.translate(
                      offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
                        child: _createComment(context),
                    )
                  ],
                ),
              )
            )
        )
      )
    );
  }

  _openDialogBoxGrow(BuildContext context, Comment comment) {
    return showGeneralDialog(
      context: context, 
      barrierLabel: '',
      barrierDismissible: true,
      transitionDuration: Duration(milliseconds: 300),
      transitionBuilder: (context, _animation, _secondaryAnimation, _child) {
        return grow(_animation, _secondaryAnimation, _child);
      },
      pageBuilder: (_animation, _secondaryAnimation, _child) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))
          ),
          elevation: 10.0,          
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 70,
                height: 70,
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
                      height: 70,
                      width: 70,
                      image: NetworkImage(
                        comment.userImage
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    comment.userName, 
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blueGrey[800]
                    ), 
                    textAlign: TextAlign.left),
                ),
              ),
              IconButton(
                icon: Icon(Icons.cancel, color: Colors.grey, size: 25,),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ), 
          content: Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30, left: 20),
                    child: Text(
                      comment.title, 
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blueGrey[700]
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      comment.description, 
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.blueGrey[500]
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5, bottom: 10, top: 20, right: 20,
                  ),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => CommentScreen()))},
                              icon: Icon(
                                Icons.comment,
                                color: Colors.blueGrey[600],
                              ),
                            ),
                            Text(
                              '30',
                              style: TextStyle(
                                color: Colors.blueGrey[600]
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () => {},
                              icon: Icon(
                                Icons.share,
                                color: Colors.blueGrey[600],
                              ),
                            ),
                            Text(
                              '10',
                              style: TextStyle(
                                color: Colors.blueGrey[600]
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () => {},
                              icon: Icon(
                                Icons.accessibility,
                                color: Colors.blueGrey[600],
                              ),
                            ),
                            Text(
                              '26',
                              style: TextStyle(
                                color: Colors.blueGrey[600]
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child:  _createComment(context),
                )
                // Transform.translate(
                //   offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
                //     child: _createComment(context),
                // )
              ],
            ),
          ),
          // actions: [
          //   RaisedButton(
          //     onPressed: () => Navigator.pop(context), 
          //     child: Text('Ok'),
          //   )
          // ],
        );
      }
    );
  }

  grow(Animation<double> _animation, Animation<double> _secondaryAnimation, Widget _child) {
    return ScaleTransition(
      child: _child,
      scale: Tween<double>(end: 1.0, begin: 0.0)
        .animate(CurvedAnimation(parent: _animation, curve: Interval(0.50, 1.0, curve: Curves.linear))),
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

  Widget _createComment(BuildContext context) {
    return Container(
        height: 66,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(1, 1),
              blurRadius: 6.0 
            )
          ],
          color: Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.grey)
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.grey)
              ),
              contentPadding: EdgeInsets.all(10.0),
              hintText: 'Agregar comentario',
              prefixIcon: Container(
                // margin: EdgeInsets.all(1.0),
                width: 55,
                height: 55,
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
                      height: 40,
                      width: 40,
                      image: NetworkImage(
                        'https://images.pexels.com/photos/906052/pexels-photo-906052.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              suffixIcon: Container(
                margin: EdgeInsets.only(right: 1.0),
                width: 50.0,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  ),
                  color: Color(0xFF737373),
                  onPressed: () => print("Post"),
                  child: Icon(
                    Icons.send,
                    size: 25.0,
                    color: Colors.white,
                  ),
                ),
              )
            ),
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

  Widget _testHeaderRight() {
     return Row( 
      // crossAxisAlignment: CrossAxisAlignment.end,
      // textDirection: index.isOdd ?  TextDirection.rtl : TextDirection.ltr, //invierte todo. Lo necesito para el header y para el footer.          
      children: <Widget>[
        Container(
          // transform: index.isOdd ? Matrix4.translationValues(6, -4, 0) : Matrix4.translationValues(-6, -4, 0),
          transform: Matrix4.translationValues(-6, -4, 0),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                offset: Offset(0, 5),
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
                    comment.userImage
                  ),
                  fit: BoxFit.cover,
                ),
              ),
          ),
            // Container(
            //   decoration: BoxDecoration(                    
            //     borderRadius: BorderRadius.circular(30),
            //     image: DecorationImage(
            //       image: NetworkImage(comment.userImage),
            //       fit: BoxFit.cover
            //     )
            //   ),
            // ),
          ),
        ),              
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            // padding: index.isOdd ? const EdgeInsets.only(left: 70.0) : const EdgeInsets.only(left: 10.0),
            child: Text(
              comment.userName,    
              style: TextStyle(
                color: Colors.blueGrey[700],
                fontWeight: FontWeight.bold,
                fontSize: 14,
                letterSpacing: 1.0
              ),                
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(                
            comment.timePosted,                
            style: TextStyle(                  
              color: Colors.blueGrey[200],
              fontWeight: FontWeight.bold,
              fontSize: 12
            ),
          ),
        )
      ],
    );
  }

  Widget _title() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: index.isOdd ?  TextDirection.rtl : TextDirection.ltr, //invierte todo. Lo necesito para el header y para el footer.                  
        children: <Widget>[
          Text(
            comment.title,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.blueGrey[800]
            ),
          ),          
        ]      
      ),
    );
  }

  Widget _content() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: index.isOdd ?  TextDirection.rtl : TextDirection.ltr, //invierte todo. Lo necesito para el header y para el footer.                  
        children: <Widget>[
          Text(      
            comment.description.length > 23 ? comment.description.substring(0, 20) + '...' : comment.description,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.blueGrey[500],
              // fontStyle: FontStyle.italic,
              fontWeight: FontWeight.normal,
              fontSize: 13,                  
            ),
          ),      
        ]      
      ),
      margin: EdgeInsets.only(top: 10),      
    );
  }


}



class StaggeredDualView extends StatelessWidget {
  
  const StaggeredDualView({
    Key key, 
    @required this.itemBuilder, 
    @required this.itemCount, 
    this.spacing = 0, 
    this.aspectRatio = 0.5,
  }) : super(key: key);

  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final double spacing;
  final double aspectRatio;
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final itemHeight = (width * 0.5) / aspectRatio;
        final height = constraints.maxHeight + itemHeight;
        return OverflowBox(
            maxWidth: width,
            maxHeight: height,
            minWidth: width,
            minHeight: height,
            child: GridView.builder(
            padding: EdgeInsets.only(top: itemHeight / 2, bottom: itemHeight),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: aspectRatio,
              crossAxisSpacing: spacing,
              mainAxisSpacing: spacing
            ),
            itemCount: itemCount,
            itemBuilder: (context, index) {
              return Transform.translate(
                offset:  Offset(0.0, index.isOdd ? itemHeight * 0.5 : 0.0),
                child: itemBuilder(context, index),
              );
            }
          ),
        );
      },
    );
  }
}