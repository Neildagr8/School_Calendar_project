import 'package:flutter/material.dart';
import 'package:schoolcalendar/Timetables/blocks.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage() : super();
  final String title = "Settings";
  @override
  _SettingsState createState() => _SettingsState();
}

final double toolbarHeight = 100.0;
int _value = 1;

class _SettingsState extends State<SettingsPage> {
  @override
  void initState() {
    super.initState();
    getIntValuesSF();
  }

  chooser() {
    if (_value == 8) {
      return grade12();
    } else if (_value == 7) {
      return grade11();
    } else if (_value == 6) {
      return grade10();
    } else if (_value == 5) {
      return grade9();
    } else if (_value == 4) {
      return grade8();
    } else if (_value == 3) {
      return grade7();
    } else if (_value == 2) {
      return grade6();
    } else if (_value == 1) {
      return grade5();
    }
  }

  addIntToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('Value', _value);
  }

  getIntValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _value = prefs.getInt('Value') ?? 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(100),
                child: AppBar(
                  backgroundColor: Color.fromRGBO(250, 250, 250, 1),
                  elevation: 0,
                  title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Settings',
                                style: TextStyle(
                                  fontFamily: 'Protipo Compact',
                                  fontSize: 40,
                                  color: const Color(0xff9b8fb1),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ]),
                      ]),
                  toolbarHeight: toolbarHeight,
                )),
            body: 
            Container(
                child: Padding(padding: 
                                EdgeInsets.only(top: 0.0, left: 25.0, right: 25.0),
                child: 
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Choose Grade:',
                                    style: TextStyle(
                                      fontFamily: 'Protipo Compact',
                                      fontSize: 30,
                                      color: const Color(0xffbadfca),
                                      fontWeight: FontWeight.w300,
                                    )),],),
            Container(
                      child: Center(
                          child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                        InputDecorator(
                            decoration: InputDecoration(
                              labelText: 'Select Grade',
                              labelStyle: Theme.of(context)
                                  .primaryTextTheme
                                  .caption
                                  .copyWith(color: Colors.black),
                              border: const OutlineInputBorder(gapPadding: 0, 
                              borderSide: const BorderSide(width:1), 
                              borderRadius: const BorderRadius.all(Radius.circular(25.0))),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                  isExpanded: true,
                                  isDense:
                                      true, // Reduces the dropdowns height by +/- 50%
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  value: _value,
                                  items: [
                                    DropdownMenuItem(child: Text("5"), value: 1),
                                    DropdownMenuItem(child: Text("6"), value: 2),
                                    DropdownMenuItem(child: Text("7"), value: 3),
                                    DropdownMenuItem(child: Text("8"), value: 4),
                                    DropdownMenuItem(child: Text("9"), value: 5),
                                    DropdownMenuItem(child: Text("10"), value: 6),
                                    DropdownMenuItem(child: Text("11"), value: 7),
                                    DropdownMenuItem(child: Text("12"), value: 8),
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      _value = value;
                                      addIntToSF();
                                    });
                                  }),
                            )),
                        Column(
                          children: [chooser()],
                        ),
                ]))),
                    ])))));
  }
}
