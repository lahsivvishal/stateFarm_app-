import 'package:flutter/material.dart';
import '../Objects/Message_Object.dart';

class MessageDetails extends StatelessWidget {
  final Message msgDetails;
  MessageDetails({this.msgDetails});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final pddng = screenWidth * 0.15;
    return SafeArea(
      child: Column(
        children: [
          Container(
            width: screenWidth,
            height: 50,
            color: Colors.red,
          ),
          Expanded(
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                                padding: EdgeInsets.only(left: pddng),
                                child: Text("Message Detail"))),
                      ],
                    ),
                  ],
                ),
              ),
              body: Container(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                msgDetails.contactName,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 18),
                              ),
                              Text(
                                msgDetails.messageDate,
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                msgDetails.duration,
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          Container(
                            //padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Column(
                              children: [
                                Container(
                                  height: 45,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      labels("Account Number"),
                                      values(msgDetails.accNumber)
                                    ],
                                  ),
                                ),
                                greyLine(),
                                Container(
                                  height: 45,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      labels("Received"),
                                      values(msgDetails.receivedDate)
                                    ],
                                  ),
                                ),
                                greyLine(),
                                Container(
                                  height: 45,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      labels("Call History"),
                                      values(msgDetails.receivedDate)
                                    ],
                                  ),
                                ),
                                greyLine(),
                                Container(
                                  height: 45,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      labels("Duration"),
                                      values(msgDetails.duration)
                                    ],
                                  ),
                                ),
                                greyLine(),
                                Container(
                                  height: 45,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      labels("Notes"),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        child: values(
                                          msgDetails.notes,
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget labels(String label) {
  return Text(label,
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15));
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
