import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:whatsapp/models/call_list.dart';
import 'package:whatsapp/widget/call_tile.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({Key? key}) : super(key: key);
  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  List<CallList> Call = [
    CallList(
      avatar:
          "https://www.sanjayjangam.com/wp-content/uploads/2021/12/beautiful-dp-for-whatsapp.jpg",
      name: "shamna",
      callTime: "11:00",
      callType: "video",
      icon: "outgoing",
    ),
    CallList(
      avatar:
          "https://www.sanjayjangam.com/wp-content/uploads/2021/12/beautiful-dp-for-whatsapp.jpg",
      name: "hafis",
      callTime: "11:00",
      callType: "audio",
      icon: "incoming",
    ),
    CallList(
      avatar:
          "https://www.sanjayjangam.com/wp-content/uploads/2021/12/beautiful-dp-for-whatsapp.jpg",
      name: "hisham",
      callTime: "11:00",
      callType: "audio",
      icon: "incoming",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: Call.length,
          itemBuilder: (BuildContext context, int index) {
            return CallTile(call: Call[index]);
          }),
    );
  }
}