

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:whatsapp/models/call_list.dart';
import 'package:whatsapp/screens/call_screen.dart';

class CallTile extends StatefulWidget {
  CallTile({required this.call});
  CallList call;
  @override
  State<CallTile> createState() => _CallTileState();
}

class _CallTileState extends State<CallTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.call.name.toString()),
      subtitle: Row(
        
        children: [
          widget.call.icon=="incoming"
          ?Icon(Icons.call_received,color:Colors.blue,):Icon(Icons.call_made,color:Colors.green,),
          Text(widget.call.callType.toString()),
          Text(widget.call.callTime.toString()),
        ],
      ),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(widget.call.avatar.toString()),
      ),
      trailing: widget.call.callType == 'audio'
          ? Icon(Icons.call)
          : Icon(Icons.video_call_rounded),
    );
  }
}
