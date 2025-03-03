
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String loginId;
  final String senderId;
  const ChatScreen({super.key,
    required this.loginId,
    required this.senderId});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String getChatDocumentId(String userId1, String userId2) {
    return int.parse(userId1) > int.parse(userId2)
        ? '$userId1,$userId2'
        : '$userId2,$userId1';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("chat"),
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('chats')
            .doc(getChatDocumentId(widget.loginId, widget.senderId))
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!['messages'].isEmpty) {
            return const Center(child: Text("No chats found"));
          }
          var chatDocs = snapshot.data!['messages'];
          return ListView.builder(
            reverse: true,
            itemCount: chatDocs.length,
            itemBuilder: (context, index) {
              var data = chatDocs[index];
              return Column(
                children: [
                  widget.loginId == data['senderId'].toString() ?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(data['text']),
                      const SizedBox(width: 10),
                      CircleAvatar(
                        child: Text(data['senderId'].toString()),
                      ),
                    ],
                  ):
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        child: Text(data['senderId'].toString()),
                      ),
                      const SizedBox(width: 10),
                      Text(data['text']),
                    ],
                  )
                ],
              );

            },
          );
        },
      )
    );
  }
}
