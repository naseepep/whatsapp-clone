// To parse this JSON data, do
//
//     final message = messageFromJson(jsonString);

import 'dart:convert';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Message {
  Message({
    this.message,
    this.time,
    this.isSend,
    this.isReaded,
  });

  String? message;
  String? time;
  bool? isSend;
  bool? isReaded;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        message: json["message"],
        time: json["time"],
        isSend: json["isSend"],
        isReaded: json["isReaded"],
 
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "time": time,
        "isSend": isSend,
        "isReaded":isReaded,
      };
}
