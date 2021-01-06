import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',      
      home: Container(        
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://images.pexels.com/photos/1408196/pexels-photo-1408196.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Container(                    
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 70),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Facundo Covas",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35,
                                  ),
                                ),
                                RaisedButton.icon(
                                  color: Colors.green[600].withOpacity(0.5),
                                  label: Text('Seguir'),
                                  icon: Icon(Icons.beenhere),
                                  onPressed: () => {},
                                )
                              ],
                            ),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // Column(
                                  //   children: [
                                  //     Text("Siguiendo",
                                  //         style: TextStyle(
                                  //             color: Colors.white, fontSize: 20)),
                                  //     Text("256",
                                  //         style: TextStyle(
                                  //             color: Colors.white, fontSize: 20)),
                                  //   ],
                                  // ),
                                  // Column(
                                  //   children: [
                                  //     Text("Seguidores",
                                  //         style: TextStyle(
                                  //             color: Colors.white, fontSize: 20)),
                                  //     Text("512",
                                  //         style: TextStyle(
                                  //             color: Colors.white, fontSize: 20)),
                                  //   ],
                                  // ),
                                  // Column(
                                  //   children: [
                                  //     Text("Estado",
                                  //         style: TextStyle(
                                  //             color: Colors.white, fontSize: 20)),
                                  //     Icon(
                                  //       Icons.brightness_high,
                                  //       color: Colors.white,
                                  //       size: 20,
                                  //     )
                                  //   ],
                                  // )
                                ],
                              ),
                          ),
                          // Container(
                          //   width: MediaQuery.of(context).size.width,
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       Icon(
                          //         Icons.keyboard_arrow_down,
                          //         color: Colors.white,
                          //         size: 50,
                          //       ),
                          //       // Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 30,)
                          //     ],
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          
        ),
      ),
    );
  }
}
