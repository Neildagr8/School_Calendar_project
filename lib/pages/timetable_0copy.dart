import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolcalendar/globals.dart' as globals;
import '../api.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class Timetable_0copyPage extends StatefulWidget {
  @override
  _Timetable_0copyState createState() => _Timetable_0copyState();
}

Future<Map<String, dynamic>>? futureTimetablepers;
Map<String, dynamic>? timetablePers = {};
String? b1, b2, b3, b4, b5, b6, b7, b8, b9;

// ignore: camel_case_types
class _Timetable_0copyState extends State<Timetable_0copyPage> {
  @override
  void initState() {
    super.initState();
    getIntValuesSF();
    futureTimetablepers = personalizedTT();
    defaultsvals();
  }

  getIntValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      globals.valueOfGrade = prefs.getInt('Value') ?? 11;
    });
  }

  blocktoprefrence(userinput) {
    if (userinput == 'B1') {
      return (b1 == "Block 1") ? b1 : "B1 $b1";
    } else if (userinput == 'B2') {
      return (b2 == "Block 2") ? b2 : "B2 $b2";
    } else if (userinput == 'B3') {
      return (b3 == "Block 3") ? b3 : "B3 $b3";
    } else if (userinput == 'B4') {
      return (b4 == "Block 4") ? b4 : "B4 $b4";
    } else if (userinput == 'B5') {
      return (b5 == "Block 5") ? b5 : "B5 $b5";
    } else if (userinput == 'B6') {
      return (b6 == "Block 6") ? b6 : "B6 $b6";
    } else if (userinput == 'B7') {
      return (b7 == "Block 7") ? b7 : "B7 $b7";
    } else if (userinput == 'B8') {
      return (b8 == "Block 8") ? b8 : "B8 $b8";
    } else if (userinput == 'B9') {
      return (b9 == "Block 9") ? b9 : "B9 $b9";
    } else {
      return userinput;
    }
  }

  defaultsvals() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (globals.valueOfGrade == 11 || globals.valueOfGrade == 12) {
      setState(() {
        b1 = prefs.getString('B1') ?? "Block 1";
        b2 = prefs.getString('B2') ?? "Block 2";
        b3 = prefs.getString('B3') ?? "Block 3";
        b4 = prefs.getString('B4') ?? "Block 4";
        b5 = prefs.getString('B5') ?? "Block 5";
        b6 = prefs.getString('B6') ?? "Block 6";
      });
    } else if (globals.valueOfGrade == 91 || globals.valueOfGrade == 92) {
      setState(() {
        b1 = prefs.getString('B1') ?? "Block 1";
        b2 = prefs.getString('B2') ?? "Block 2";
        b3 = prefs.getString('B3') ?? "Block 3";
        b4 = prefs.getString('B4') ?? "Block 4";
        b5 = prefs.getString('B5') ?? "Block 5";
        b6 = prefs.getString('B6') ?? "Block 6";
        b7 = prefs.getString('B7') ?? "Block 7";
        b8 = prefs.getString('B8') ?? "Block 8";
        b9 = prefs.getString('B9') ?? "Block 9";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder<Map<String, dynamic>>(
            future: futureTimetablepers,
            builder: (context, snapshot) {
              if (globals.day1 == "7") {
                return Container(
                    padding:
                        EdgeInsets.only(top: 10.0, left: 18.0, right: 18.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card(
                              elevation: 4,
                              color: Color.fromRGBO(252, 252, 252, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(27)),
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                child: ListTile(
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                          'No School',
                                          style: TextStyle(
                                              fontSize: globals.h3,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w300,
                                              fontFamily: "Protipo Compact"),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ))
                        ]));
              }
              if (globals.day1 == "8") {
                return Container(
                    padding:
                        EdgeInsets.only(top: 10.0, left: 18.0, right: 18.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card(
                              elevation: 4,
                              color: Color.fromRGBO(252, 252, 252, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(27)),
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                child: ListTile(
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                          'Error',
                                          style: TextStyle(
                                              fontSize: globals.h3,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w300,
                                              fontFamily: "Protipo Compact"),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ))
                        ]));
              } else {
                if (snapshot.hasData) {
                  timetablePers = snapshot.data;
                  return ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              top: 20.0, left: 18.0, right: 18.0),
                          child: Card(
                            elevation: 7.5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(27)),
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                          child: Container(
                                        child: Text(
                                          blocktoprefrence(timetablePers![
                                              '${globals.valueOfGrade}.${(index + 1)}']),
                                          style: TextStyle(
                                              fontSize: globals.h4,
                                              fontWeight: FontWeight.w300,
                                              fontFamily: "Protipo Compact"),
                                        ),
                                      ))
                                    ],
                                  ),
                                  trailing: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          timetablePers![
                                              '${globals.valueOfGrade}.${(index + 1)}_time'],
                                          style: TextStyle(color: Colors.grey),
                                        )
                                      ])),
                            ),
                          ),
                        );
                      });
                } else {
                  return ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              top: 20.0, left: 18.0, right: 18.0),
                          child: Card(
                            elevation: 7.5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(27)),
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                          child: Container(
                                        child: Text(
                                          (timetablePers!.isNotEmpty)
                                              ? blocktoprefrence(timetablePers![
                                                  '${globals.valueOfGrade}.${(index + 1)}'])
                                              : "-",
                                          style: TextStyle(
                                              fontSize: globals.h4,
                                              // color: Colors.black54,
                                              fontWeight: FontWeight.w300,
                                              fontFamily: "Protipo Compact"),
                                        ),
                                      ))
                                    ],
                                  ),
                                  trailing: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "yo",
                                          // (timetablePers!.isNotEmpty)
                                          //     ? timetablePers![
                                          //         '${globals.valueOfGrade}.${(index + 1)}_time']
                                          //     : "-",
                                          style: TextStyle(color: Colors.grey),
                                        )
                                      ])),
                            ),
                          ),
                        );
                      });
                }
              }
            }));
  }
}