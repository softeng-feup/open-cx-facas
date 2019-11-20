import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  double textHeight = 38;
  double gapHeight = 28;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Stack(
            children: [
              Positioned( //Barra de cima
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF28316C),
                  ),
                  // padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                  height: 72,
                  width: MediaQuery.of(context).size.width,
                ),
                top: 0,
              ),
              Positioned( //Contentor grande
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF28316C),
                  ),
                  // padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                  height: 432,
                  width: MediaQuery.of(context).size.width,
                ),
                top: 72,
              ),

              Positioned(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                      .push(MaterialPageRoute<Null>(builder: (BuildContext context){
                        return new MenuPage();
                      }));
                  },
                  child: Container(
                      child: Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 40.0,
                      ),                  
                    decoration: BoxDecoration(
                      color: Color(0xFF28316C),
                    ),
                    height: textHeight,
                    width: 40,
                  ),
                ),
                top: 29,
                right: 15
              ),

              Positioned(
                child: Container(
                  child: Text(
                    'Schedule',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFFFF),
                      fontSize: 20
                      ),
                    textAlign: TextAlign.left,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF28316C),
                  ),
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  height: textHeight,
                  width: MediaQuery.of(context).size.width,
                ),
                top: 72,
                left: 13,
                right: 13
              ),

              Positioned(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                      .push(MaterialPageRoute<Null>(builder: (BuildContext context){
                        return new MenuPage();
                      }));
                  },
                  child: Container(
                    child: Text(
                      'View',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 20
                        ),
                      textAlign: TextAlign.left,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF28316C),
                    ),
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    height: textHeight,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                top: 72 + textHeight,
                left: 13,
                right: 13
              ),

              Positioned(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                      .push(MaterialPageRoute<Null>(builder: (BuildContext context){
                        return new MenuPage();
                      }));
                  },
                  child: Container(
                    child: Text(
                      'All Lectures',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 20
                        ),
                      textAlign: TextAlign.left,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF28316C),
                    ),
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    height: textHeight,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                top: 72 + 2*textHeight,
                left: 13,
                right: 13
              ),

              Positioned(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                      .push(MaterialPageRoute<Null>(builder: (BuildContext context){
                        return new MenuPage();
                      }));
                  },
                  child: Container(
                    child: Text(
                      'Recommended Lectures',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 20
                        ),
                      textAlign: TextAlign.left,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF28316C),
                    ),
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    height: textHeight,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                top: 72 + 3*textHeight,
                left: 13,
                right: 13
              ),

              Positioned( //Divisao
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xA0FFFFFF),
                  ),
                  // padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                  height: 1.5,
                  width: MediaQuery.of(context).size.width,
                ),
                top: 72 + 4*textHeight + gapHeight/2,
                left: 13,
                right: 13
              ),

              Positioned(
                child: Container(
                  child: Text(
                    'Account',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFFFF),
                      fontSize: 20
                      ),
                    textAlign: TextAlign.left,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF28316C),
                  ),
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  height: textHeight,
                  width: MediaQuery.of(context).size.width,
                ),
                top: 72 + 4*textHeight + gapHeight,
                left: 13,
                right: 13
              ),

              Positioned(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                      .push(MaterialPageRoute<Null>(builder: (BuildContext context){
                        return new MenuPage();
                      }));
                  },
                  child: Container(
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 20
                        ),
                      textAlign: TextAlign.left,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF28316C),
                    ),
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    height: textHeight,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                top: 72 + 5*textHeight + gapHeight,
                left: 13,
                right: 13
              ),

              Positioned(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                      .push(MaterialPageRoute<Null>(builder: (BuildContext context){
                        return new MenuPage();
                      }));
                  },
                  child: Container(
                    child: Text(
                      'Edit Preferences',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 20
                        ),
                      textAlign: TextAlign.left,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF28316C),
                    ),
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    height: textHeight,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                top: 72 + 6*textHeight + gapHeight,
                left: 13,
                right: 13
              ),

              Positioned( //Divisao
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xA0FFFFFF),
                  ),
                  // padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                  height: 1.5,
                  width: MediaQuery.of(context).size.width,
                ),
                top: 72 + 7*textHeight + gapHeight + gapHeight/2,
                left: 13,
                right: 13
              ),

              Positioned(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                      .push(MaterialPageRoute<Null>(builder: (BuildContext context){
                        return new MenuPage();
                      }));
                  },
                  child: Container(
                    child: Stack (
                      children: [
                        Container(
                          child: Text(
                            'Settings',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFFFFFF),
                              fontSize: 20
                            ),
                            textAlign: TextAlign.left,
                          ),
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        ),

                        Positioned(
                          child: Icon(
                            Icons.settings,
                            color: Colors.white,
                            size: 40.0,
                          ),             
                          top: -1,
                          right: 0
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF28316C),
                    ),
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    height: textHeight,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                top: 72 + 7*textHeight + 2*gapHeight,
                left: 13,
                right: 13
              ),

              Positioned( //Divisao
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xA0FFFFFF),
                  ),
                  // padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                  height: 1.5,
                  width: MediaQuery.of(context).size.width,
                ),
                top: 72 + 8*textHeight + 2*gapHeight + gapHeight/2,
                left: 13,
                right: 13
              ),
              
              Positioned(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                      .push(MaterialPageRoute<Null>(builder: (BuildContext context){
                        return new MenuPage();
                      }));
                  },
                  child: Container(
                    child: Stack (
                      children: [
                        Container(
                          child: Text(
                          'Signt Out',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFFFFFF),
                            fontSize: 20
                          ),
                          textAlign: TextAlign.left,
                        ),
                        padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                        ),
                        
                        Positioned(
                            child: Icon(
                              Icons.exit_to_app,
                              color: Colors.white,
                              size: 40.0,
                            ), 
                          top: -5,
                          right: 0
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF28316C), // 0xFF28316C
                    ),
                  
                    padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                
                top: 68 + 8*textHeight + 3*gapHeight,
                left: 13,
                right: 13
              ),
              
//            Positioned(
//                 child: MaterialButton(
//                   padding: EdgeInsets.fromLTRB(13, 0, 0, 0),
//                   height: 55,
//                   color: Color(0xFF28316C), // 0xFF28316C
//                   child: SizedBox(
//                     width: MediaQuery.of(context).size.width,
//                     child: Stack(
//                       children: [
//                         Container(
//                           child: Text(
//                           'Signt Out',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFFFFFFFF),
//                             fontSize: 20
//                           ),
//                           textAlign: TextAlign.left,
//                         ),
//                         height: 30,
//                         padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
//                         ),
                        
//                         Positioned(
//                             child: Icon(
//                               Icons.exit_to_app,
//                               color: Colors.white,
//                               size: 40.0,
//                             ), 
//                           top: -5,
//                           right: 25
//                         ),
//                       ],
//                     ),
//                   ),
//                   onPressed: () {
//                   },
//                 ),
//                 top: 150 + 8*textHeight + 3*gapHeight,
//               ),

            ],
          )
        )
      )
    );
  }
}
