import 'package:flutter/material.dart';
import '../Objects/msg_data.dart';
import 'msg_details.dart';
import 'Signin.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(203, 33, 33, 1),
          elevation: 5,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 1, child: Container()),
              Expanded(
                  flex: 2,
                  child: Container(
                      alignment: Alignment.center, child: Text('Messages'))),
              Expanded(
                  flex: 1,
                  child: Container(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.search)))
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              secondaryBackground: backgroundIcon(),
              background: Container(
                color: Colors.white,
              ),
              key: Key(messages[index].accNumber),
              child: Card(
                elevation: 3,
                margin: const EdgeInsets.only(
                    left: 10, right: 10.0, top: 5.0, bottom: 5.0),
                child: ExpansionTile(
                  title: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MessageDetails(msgDetails: messages[index])));
                    },
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                messages[index].contactName,
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Text(
                                messages[index].messageDate,
                                style: TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(
                                  messages[index].description,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                              ),
                              Text(
                                messages[index].duration,
                                style: TextStyle(fontSize: 13),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  // Trailing Icon
                  trailing: Container(
                    width: 23,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(203, 33, 33, 1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                  ),
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        children: [
                          Container(
                            height: 45,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                labels("Account Number"),
                                values(messages[index].accNumber)
                              ],
                            ),
                          ),
                          greyLine(),
                          Container(
                            height: 45,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                labels("Received"),
                                values(messages[index].receivedDate)
                              ],
                            ),
                          ),
                          greyLine(),
                          Container(
                            height: 45,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                labels("Call History"),
                                values(messages[index].receivedDate)
                              ],
                            ),
                          ),
                          greyLine(),
                          Container(
                            height: 45,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                labels("Duration"),
                                values(messages[index].duration)
                              ],
                            ),
                          ),
                          greyLine(),
                          Container(
                            height: 45,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                labels("Notes"),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  child: values(
                                    messages[index].notes,
                                    overflows: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}

Widget labels(String label) {
  return Text(label, style: TextStyle(fontWeight: FontWeight.w500));
}

Widget values(String msgValues, {overflows}) {
  return Text(msgValues,
      style: TextStyle(
        fontWeight: FontWeight.w300,
      ),
      overflow: overflows);
}

Widget backgroundIcon() {
  return Container(
    padding: const EdgeInsets.only(right: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[600],
          ),
          child: Icon(
            Icons.delete_forever,
            color: Colors.white,
            size: 30,
          ),
        )
      ],
    ),
  );
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
