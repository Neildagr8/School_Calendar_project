import 'package:flutter/material.dart';

class Fp2Page extends StatefulWidget {
  @override
  _Fp2State createState() => _Fp2State();
}

class _Fp2State extends State<Fp2Page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(150),
                child: AppBar(
                    backgroundColor: Color.fromRGBO(250, 250, 250, 1),
                    elevation: 0,
                    title: Container(
                        child: Padding(
                            padding: EdgeInsets.only(
                                top: 0.0, left: 15.0, right: 15.0),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Hello',
                                            style: TextStyle(
                                              fontSize: 55,
                                              color: const Color(0xff9b8fb1),
                                              fontWeight: FontWeight.w300,
                                            )),
                                      ]),
                                  SizedBox(
                                    height: 6,
                                  )
                                ])))))));
  }
}