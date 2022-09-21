import 'dart:convert';

CallList callListFromJson(String str) => CallList.fromJson(json.decode(str));

String callListToJson(CallList data) => json.encode(data.toJson());

class CallList {
    CallList({
        this.avatar,
        this.name,
        this.icon,
        this.callTime,
        this.callType,
    });

    String? avatar;
    String? name;
    String? icon;
    String? callTime;
    String? callType;

    factory CallList.fromJson(Map<String, dynamic> json) => CallList(
        avatar: json["avatar"],
        name: json["name "],
        icon: json["icon"],
        callTime: json["call_time"],
        callType: json["call_type"],
    );

    Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "name ": name,
        "icon": icon,
        "call_time": callTime,
        "call_type": callType,
    };
}
