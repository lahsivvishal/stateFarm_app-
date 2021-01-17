import 'package:flutter/material.dart';

class Preferences extends StatefulWidget {
  @override
  _PreferencesState createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
  String email1 = "test@test.com";
  String email2 = "test3@test.com";
  String lang1 = "English";
  String timeout = "10 min";
  String timezone = "IST";
  String ucHour = "1:00";
  String hour = "1:00";
  String code = "1234";
  String region = "Atlanta";
  bool tutValue = false;
  bool ucValue = false;
  final _emails1 = ["test@test.com", "test2@test.com"];
  final _emails2 = ["test3@test.com", "test4@test.com"];
  final _langs = ["English", "Polish", "Dutch"];
  final _timezones = ["IST", "EST", "GMT", "PST"];
  final _timeouts = ["10 min", "15 min", "20 min"];
  final _codes = ["1234", "5555", "3123", "5225", "8888"];
  final _ctRegions = [
    "Texas",
    "Atlanta",
    "Alaska",
    "Rhode Island",
    "Philadelphia"
  ];
  final _hours = [
    "1:00",
    "2:00",
    "3:00",
    "4:00",
    "5:00",
    "6:00",
    "7:00",
    "8:00",
    "9:00",
    "10:00",
    "11:00",
    "12:00"
  ];
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('Preferences'),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(203, 33, 33, 1),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          labels("Passcode"),
                          Text("xxxxxxxxxxxxxxxx")
                        ],
                      ),
                    ),
                    greyLine(),
                    Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [labels("Email"), Text("test@test.com")],
                      ),
                    ),
                    greyLine(),
                    Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          labels("Forward to Email"),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: email1,
                              icon: Icon(
                                Icons.arrow_drop_down,
                                size: 35,
                                color: Color.fromRGBO(203, 33, 33, 1),
                              ),
                              onChanged: (String newValue1) {
                                setState(() {
                                  email1 = newValue1;
                                });
                              },
                              items: _emails1.map<DropdownMenuItem<String>>(
                                  (String value2) {
                                return DropdownMenuItem<String>(
                                  value: value2,
                                  child: Container(
                                    width: 150,
                                    child: Text(value2,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                );
                              }).toList(),
                            ),
                          )
                        ],
                      ),
                    ),
                    greyLine(),
                    Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          labels("Forward to Mailbox"),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: email2,
                              icon: Icon(
                                Icons.arrow_drop_down,
                                size: 35,
                                color: Color.fromRGBO(203, 33, 33, 1),
                              ),
                              onChanged: (String newValue3) {
                                setState(() {
                                  email2 = newValue3;
                                });
                              },
                              items: _emails2.map<DropdownMenuItem<String>>(
                                  (String value4) {
                                return DropdownMenuItem<String>(
                                  value: value4,
                                  child: Container(
                                    width: 150,
                                    child: Text(value4,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                );
                              }).toList(),
                            ),
                          )
                        ],
                      ),
                    ),
                    greyLine(),
                    Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          labels("Language"),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isDense: false,
                              elevation: 0,
                              dropdownColor: Colors.white,
                              value: lang1,
                              icon: Icon(
                                Icons.arrow_drop_down,
                                size: 35,
                                color: Color.fromRGBO(203, 33, 33, 1),
                              ),
                              onChanged: (String newValue5) {
                                setState(() {
                                  lang1 = newValue5;
                                });
                              },
                              items: _langs.map<DropdownMenuItem<String>>(
                                  (String value6) {
                                return DropdownMenuItem<String>(
                                  value: value6,
                                  child: Container(
                                    width: 150,
                                    // decoration: BoxDecoration(
                                    //     border: Border.all(color: Colors.white)),
                                    child: Text(value6,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                );
                              }).toList(),
                            ),
                          )
                        ],
                      ),
                    ),
                    greyLine(),
                    Container(
                      height: 50,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            labels("Time Zone"),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: timezone,
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  size: 35,
                                  color: Color.fromRGBO(203, 33, 33, 1),
                                ),
                                onChanged: (String newValue3) {
                                  setState(() {
                                    timezone = newValue3;
                                  });
                                },
                                items: _timezones.map<DropdownMenuItem<String>>(
                                    (String value4) {
                                  return DropdownMenuItem<String>(
                                    value: value4,
                                    child: Container(
                                      width: 150,
                                      child: Text(value4,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ]),
                    ),
                    greyLine(),
                    Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          labels("Tutorial"),
                          Checkbox(
                            focusColor: Color.fromRGBO(203, 33, 33, 1),
                            value: tutValue,
                            onChanged: (bool value) {
                              setState(() {
                                tutValue = value;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    greyLine(),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              preferenceHeader("Unified Communications", screenWidth),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          labels("UC Enable"),
                          Checkbox(
                            focusColor: Color.fromRGBO(203, 33, 33, 1),
                            value: ucValue,
                            onChanged: (bool value) {
                              setState(() {
                                ucValue = value;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    greyLine(),
                    Container(
                      height: 50,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            labels("UC Timeout"),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: timeout,
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  size: 35,
                                  color: Color.fromRGBO(203, 33, 33, 1),
                                ),
                                onChanged: (String newValue4) {
                                  setState(() {
                                    timeout = newValue4;
                                  });
                                },
                                items: _timeouts.map<DropdownMenuItem<String>>(
                                    (String value5) {
                                  return DropdownMenuItem<String>(
                                    value: value5,
                                    child: Container(
                                      width: 150,
                                      child: Text(value5,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ]),
                    ),
                    greyLine(),
                    Container(
                      height: 50,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            labels("UC Hours"),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: ucHour,
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  size: 35,
                                  color: Color.fromRGBO(203, 33, 33, 1),
                                ),
                                onChanged: (String newValue4) {
                                  setState(() {
                                    ucHour = newValue4;
                                  });
                                },
                                items: _hours.map<DropdownMenuItem<String>>(
                                    (String value6) {
                                  return DropdownMenuItem<String>(
                                    value: value6,
                                    child: Container(
                                      width: 150,
                                      child: Text(value6,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ]),
                    ),
                    greyLine(),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              preferenceHeader("Hours Information", screenWidth),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                height: 50,
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          labels("Hours"),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: hour,
                              icon: Icon(
                                Icons.arrow_drop_down,
                                size: 35,
                                color: Color.fromRGBO(203, 33, 33, 1),
                              ),
                              onChanged: (String newValue4) {
                                setState(() {
                                  hour = newValue4;
                                });
                              },
                              items: _hours.map<DropdownMenuItem<String>>(
                                  (String value7) {
                                return DropdownMenuItem<String>(
                                  value: value7,
                                  child: Container(
                                    width: 150,
                                    child: Text(value7,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ]),
                    greyLine(),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              preferenceHeader("Catastrophe Assignment", screenWidth),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            labels("Catastrophe Code"),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: code,
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  size: 35,
                                  color: Color.fromRGBO(203, 33, 33, 1),
                                ),
                                onChanged: (String newValue5) {
                                  setState(() {
                                    code = newValue5;
                                  });
                                },
                                items: _codes.map<DropdownMenuItem<String>>(
                                    (String value5) {
                                  return DropdownMenuItem<String>(
                                    value: value5,
                                    child: Container(
                                      width: 150,
                                      child: Text(value5,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ]),
                    ),
                    greyLine(),
                    Container(
                      height: 50,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            labels("Catastrophe Region"),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: region,
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  size: 35,
                                  color: Color.fromRGBO(203, 33, 33, 1),
                                ),
                                onChanged: (String newValue4) {
                                  setState(() {
                                    region = newValue4;
                                  });
                                },
                                items: _ctRegions.map<DropdownMenuItem<String>>(
                                    (String value6) {
                                  return DropdownMenuItem<String>(
                                    value: value6,
                                    child: Container(
                                      width: 150,
                                      child: Text(value6,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ]),
                    ),
                    greyLine(),
                    Container(
                      height: 50,
                      child: Row(
                        children: [labels("Catastrophe Charge Code")],
                      ),
                    ),
                    greyLine(),
                    Container(
                      height: 200,
                      width: screenWidth,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FlatButton(
                              height: 50,
                              child: Text(
                                "Save",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {},
                              color: Colors.red,
                            ),
                            FlatButton(
                              height: 50,
                              child: Text(
                                "Cancel",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {},
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

Widget labels(String label) {
  return Text(label, style: TextStyle(fontWeight: FontWeight.w600));
}

Widget values(String msgValues, {overflows}) {
  return Text(msgValues,
      style: TextStyle(
        fontWeight: FontWeight.w300,
      ),
      overflow: overflows);
}

Widget greyLine() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Container(
      alignment: Alignment.center,
      height: 2,
      color: Colors.grey[300],
    ),
  );
}

Widget preferenceHeader(String headerText, double scrWdt) {
  return Container(
    decoration: BoxDecoration(
        boxShadow: [BoxShadow(blurRadius: 2.0)], color: Colors.white),
    padding: const EdgeInsets.only(left: 25),
    alignment: Alignment.centerLeft,
    width: scrWdt,
    height: 80,
    child: Text(
      headerText,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
    ),
  );
}
