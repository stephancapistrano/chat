import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {

  ChatMessage(this.data, this.mine);
  final Map<String, dynamic> data;
  final bool mine;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: <Widget>[
          !mine ?
          Padding(padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
            backgroundImage: NetworkImage(data["senderPhotoUrl"]),
            ),
          ) : Container(width: 20,),
          Expanded(
            child: Column(
              crossAxisAlignment: mine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: <Widget>[
                data["imgUrl"] != null ?
                  Image.network(data["imgUrl"], width: 250, height: 500, fit: BoxFit.cover,) 
                : 
                  Text(
                    data["text"],
                    style: TextStyle(fontSize: 17,),
                    textAlign: mine ? TextAlign.end : TextAlign.start,
                ),
                Text(
                  data["senderName"],
                  style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black26
                  ),
                )
              ],
            )
          ),
          mine ?
          Padding(padding: EdgeInsets.only(left: 16),
            child: CircleAvatar(
            backgroundImage: NetworkImage(data["senderPhotoUrl"]),
            ),
          ) : Container(width: 20,),
        ],
      ),
    );
  }
}