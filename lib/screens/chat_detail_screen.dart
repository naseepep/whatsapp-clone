import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:whatsapp/models/message_model.dart';
import 'package:whatsapp/models/user.dart';
import 'package:whatsapp/widget/chat_bubble.dart';

class ChatDetail extends StatefulWidget {
  ChatDetail({Key? key, required this.details}) : super(key: key);
  User details;
  TextEditingController _msg_ctlr = TextEditingController();

  @override
  State<ChatDetail> createState() => _ChatDetailState();
}

class _ChatDetailState extends State<ChatDetail> {
  bool Show_Send = false;
  bool show_emoji = false;
  FocusNode focus_node = FocusNode();
  List<Message> messageList = [
    Message(isSend: true, message: 'hai', time: '10.00', isReaded: true),
    Message(isSend: false, message: 'hai', time: '10.01', isReaded: false),
    Message(
        isSend: true, message: 'how are you', time: '10.02', isReaded: true),
    Message(isSend: false, message: 'fine', time: '10.03', isReaded: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leadingWidth: 100,
        titleSpacing: 0,
        leading: Row(
          //  mainAxisAlignment: MainAxisAlignment.,
          children: [
            // IconButton(
            //     onPressed: () => Navigator.pop(context),
            //     icon: Icon(Icons.arrow_back)),
            GestureDetector(
              child: const Icon(Icons.arrow_back),
              onTap: () => Navigator.pop(context),
            ),

            const SizedBox(
              width: 3,
            ),
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                widget.details.avatar == ''
                    ? widget.details.isGroup == true
                        ? 'https://lh3.googleusercontent.com/ABlX4ekWIQimPjZ1HlsMLYXibPo2xiWnZ2iny1clXQm2IQTcU2RG0-4S1srWsBQmGAo'
                        : 'https://as2.ftcdn.net/v2/jpg/02/15/84/43/1000_F_215844325_ttX9YiIIyeaR7Ne6EaLLjMAmy4GvPC69.jpg'
                    : widget.details.avatar.toString(),
              ),
            ),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.details.name.toString()),
            Text(
              'last seen ${widget.details.updateAt.toString()}',
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
        actions: [
          const Icon(Icons.video_call_rounded),
          const SizedBox(
            width: 10,
          ),
          const Icon(Icons.call_end_rounded),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: widget.details.isGroup == true
                      ? const Text("Group Info")
                      : const Text('view contact'),
                ),
                PopupMenuItem(
                  child: widget.details.isGroup == true
                      ? const Text("Group media")
                      : const Text('media,links and docs'),
                ),
                const PopupMenuItem(
                  child: const Text('search'),
                ),
                const PopupMenuItem(
                  child: Text('mute notification'),
                ),
                const PopupMenuItem(
                  child: const Text('wallpaper'),
                ),
                const PopupMenuItem(
                  child: Text('more'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://i.pinimg.com/736x/8c/98/99/8c98994518b575bfd8c949e91d20548b.jpg'),
          ),
        ),
        child: Stack(
          children: [
//
            ListView.builder(
              itemCount: messageList.length,
              itemBuilder: ((context, index) => ChatBubble(
                    message: messageList[index],
                  )),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: TextField(
                        controller: widget._msg_ctlr,
                        onTap: () {
                          if (show_emoji) {
                            focus_node.unfocus();
                          }
                          //print('-----------------------');
                          //print(show_emoji);
                        },
                        focusNode: focus_node,
                        onChanged: (value) {
                          print(value.length);
                          if (value.length > 0) {
                            setState(
                              () {
                                Show_Send = true;
                              },
                            );
                          } else {
                            setState(() {
                              Show_Send = false;
                            });
                          }
                        },
                        decoration: InputDecoration(
                            prefixIconColor: Colors.grey,
                            suffixIconColor: Colors.grey,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14),
                            suffixIcon: showIcon(),
                            hintText: 'Message',
                            icon: IconButton(
                              icon: Icon(show_emoji
                                  ? Icons.keyboard
                                  : Icons.emoji_emotions_outlined),
                              onPressed: (() {
                                focus_node.unfocus();
                                setState(() {
                                  show_emoji = !show_emoji;
                                });
                                if (!show_emoji) {
                                  focus_node.requestFocus();
                                }
                              }),
                            )),
                      ),
                    ),
                    //  FloatingActionButton(onPressed: (){},
                    // child: Icon(Icons.mic),),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: InkWell(
                        onTap: () {
                          print(widget._msg_ctlr.text);
                          setState(() {
                            messageList.add(Message(
                                message: widget._msg_ctlr.text,
                                isReaded: false,
                                isSend: true,
                                time: '10.00'));
                          });
                          widget._msg_ctlr.clear;

                          print(messageList);
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.teal,
                          child: Icon(Show_Send ? Icons.send : Icons.mic),
                        ),
                      ),
                    ),
                  ],
                ),
                show_emoji ? select_emoji() : SizedBox(),
              ],
            ),
            //show_emoji ? select_emoji() : SizedBox(),
          ],
        ),
      ),
    );
  }

  Row showIcon() {
    if (Show_Send) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (builder) => menu(),
              );
            },
            icon: Icon(Icons.attach_file),
          ),
        ],
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (builder) => menu(),
              );
            },
            icon: Icon(Icons.attach_file),
          ),
          //Icon(Icons.attach_file),
          SizedBox(
            width: 5,
          ),
          Icon(Icons.camera_alt),
        ],
      );
    }
  }

  Card menu() {
    return Card(
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                iconWidget(
                    Icon(Icons.insert_drive_file), 'Documents', Colors.indigo),
                iconWidget(Icon(Icons.camera_alt), 'camera', Colors.pink),
                iconWidget(Icon(Icons.insert_photo), 'Gallery', Colors.purple),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                iconWidget(
                  Icon(Icons.headset),
                  'audio',
                  Colors.orange,
                ),
                iconWidget(Icon(Icons.location_pin), 'location', Colors.teal),
                iconWidget(
                  Icon(Icons.contact_phone),
                  'Contact',
                  Colors.blue,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector iconWidget(Icon icon, String text, Color color) {
    return GestureDetector(
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: icon,
          ),
          Text(text),
        ],
      ),
    );
  }

  Widget select_emoji() {
    return EmojiPicker(
      onEmojiSelected: (emoji, category) {
        widget._msg_ctlr.text += emoji.emoji;
      },
    );
  }
}
// ListView(
//               children: [
//                 SendMsg(
//                   sendtext: 'hello',
//                   sendtime: '12:00',
//                   isRead: true,
//                 ),
//                 //SendMsg(
//                 //sendtext: 'How are you',
//                 //  sendtime: '1:00',
//                 // isRead: false,
//                 //),
//                 RecieveMsg(recieve_text: 'hello', recieve_time: '1:05'),
// //RecieveMsg(recieve_text: 'fine', recieve_time: '1.06'),
//               ],

//               //itemCount: 10,
//               // itemBuilder: (BuildContext context, int index) {
//               //  return Text(" hai");
//             ),
