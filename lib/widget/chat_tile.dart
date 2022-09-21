import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:whatsapp/models/user.dart';
import 'package:whatsapp/screens/chat_detail_screen.dart';

class ChatTile extends StatefulWidget {
  ChatTile({required this.data});
  User data;
  @override
  State<ChatTile> createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetail(
              details: widget.data,
            ),
          )),
      child: ListTile(
        title: Text(widget.data.name.toString()),
        subtitle: Row(
          children: [
            Icon(
              Icons.done_all,
              color: Colors.blue,
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                widget.data.message.toString(),
              ),
            )
          ],
        ),
        trailing: Text(widget.data.updateAt!),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            widget.data.avatar == ''
                ? widget.data.isGroup == true
                    ? 'https://lh3.googleusercontent.com/ABlX4ekWIQimPjZ1HlsMLYXibPo2xiWnZ2iny1clXQm2IQTcU2RG0-4S1srWsBQmGAo'
                    : 'https://as2.ftcdn.net/v2/jpg/02/15/84/43/1000_F_215844325_ttX9YiIIyeaR7Ne6EaLLjMAmy4GvPC69.jpg'
                : widget.data.avatar.toString(),
          ),
        ),
      ),
    );
  }
}
