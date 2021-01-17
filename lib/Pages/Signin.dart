import 'package:flutter/material.dart';
import 'textFields.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import 'dart:convert';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
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
    var data = json.decode(jsonData);
    print("<<<<<<<<< parsed data >>>>>>>>>");
    print(
        data['env:Envelope']['env:Body']['ns2:ValidateUserResponse']['return']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.4),
          color: Colors.yellow[200],
          child: Column(
            children: [
              Textfields("Enter Username", "Email", 10.0, userName, false),
              Textfields("Enter Password", "Password", 10.0, userPass, true),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                color: Colors.red,
                onPressed: () {
                  validate();
                },
                child: Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
