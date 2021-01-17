import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import 'dart:convert';
import '../HomePage.dart';

class Signinpage extends StatefulWidget {
  @override
  _SigninpageState createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {
  TextEditingController userName = new TextEditingController();

  TextEditingController userPass = new TextEditingController();

  Xml2Json xml2json = new Xml2Json();

  var url = "https://api-devion.intelliverse.com/api/intelliconnection";

  validate() async {
    String username = userName.text.toString();
    String userpass = userPass.text.toString();
    String objbody;

    objbody = '<?xml version="1.0" encoding="utf-8"?>' +
        '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:int="http://intelliconnection.api.ion.intelliverse.com/">' +
        '<soapenv:Body>' +
        '<int:ValidateUser>' +
        '<!--Optional:-->' +
        '<ApiAuthentication>' +
        '<cust_id>103</cust_id>' +
        '<cust_name>SABER</cust_name>' +
        '<cust_pass>intelliSaber01</cust_pass>' +
        '</ApiAuthentication>' +
        '<UserAuthentication>' +
        '<loginID>$username</loginID>' +
        '<password>$userpass</password>' +
        '</UserAuthentication>' +
        '</int:ValidateUser>' +
        '</soapenv:Body>' +
        '</soapenv:Envelope>';

    final response = await http.post(url,
        body: objbody, headers: {'Content-Type': 'text/xml; charset=utf-8'});
    print(response.body);
    xml2json.parse(response.body);
    var jsonData = xml2json.toParker();
    final data = json.decode(jsonData);
    print("<<<<<<<<< parsed data >>>>>>>>>");
    print(
        data['env:Envelope']['env:Body']['ns2:ValidateUserResponse']['return']);
    if (data['env:Envelope']['env:Body']['ns2:ValidateUserResponse']
            ['return'] ==
        0) {
      return true;
    } else {
      return false;
    }
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormkey = GlobalKey<FormState>();
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Scaffold(
      backgroundColor: Colors.red,
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: screenHeight * 0.40,
              child: Text('Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30)),
            ),
            Form(
              key: globalFormkey,
              child: Container(
                height: 250,
                width: screenWidth - 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: TextFormField(
                          controller: userName,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.email,
                                color: Colors.red,
                              ),
                              hintText: "Email Address",
                              hintStyle: TextStyle(color: Colors.red),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white)))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: TextFormField(
                          controller: userPass,
                          obscureText: hidePassword,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              focusColor: Colors.red,
                              icon: Icon(
                                Icons.vpn_key,
                                color: Colors.red,
                              ),
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.red),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              suffixIcon: IconButton(
                                icon: Icon(hidePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    hidePassword = !hidePassword;
                                  });
                                },
                              ))),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    ButtonTheme(
                      minWidth: 150,
                      height: 50,
                      child: FlatButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                              (Route<dynamic> route) => false);
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.red,
                        shape: StadiumBorder(),
                      ),
                    )
                  ],
                ),
              ),
              autovalidate: true,
            ),
          ],
        ),
      ),
    );
  }
}
