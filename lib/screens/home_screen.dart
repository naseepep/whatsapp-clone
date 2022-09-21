import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:whatsapp/models/call_list.dart';
import 'package:whatsapp/screens/call_screen.dart';
import 'package:whatsapp/screens/camera.dart';
import 'package:whatsapp/screens/chat_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tb;
  @override
  void initState() {
    super.initState();
    _tb = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        bottom: TabBar(
          tabs: [
            Tab(
              icon: Icon(
                Icons.camera_alt,
              ),
            ),
            Tab(
              text: 'Chats',
            ),
            Tab(
              text: 'Status',
            ),
            Tab(
              text: 'Calls',
            ),
          ],
          controller: _tb,
        ),
        title: Text(
          'watsapp',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        actions: [
          Icon(Icons.search),
          PopupMenuButton(itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(child: Text('New Group'), value: 1),
              PopupMenuItem(child: Text('New broadcast'), value: 2),
              PopupMenuItem(
                child: Text('Linked devices'),
                value: 3,
              ),
              PopupMenuItem(
                child: Text('Starred messages'),
                value: 4,
              ),
              PopupMenuItem(
                child: Text('Payments'),
                value: 5,
              ),
              PopupMenuItem(
                child: Text('Settings'),
                value: 6,
              ),
            ];
          })
        ],
      ),
      body: TabBarView(
        children: [
          CameraScreen(),
          chatList(),
          Text('status'),
          CallScreen(),
        ],
        controller: _tb,
      ),
    );
  }
}
