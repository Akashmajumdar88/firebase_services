
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'chatScreen.dart';

class UsernameScreen extends StatefulWidget {
  String loginId;
  UsernameScreen({super.key,required this.loginId});

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {

  void addNewUser(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection('userChats')
              .doc('${widget.loginId},buildThis')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData || snapshot.data!['userInfo'].isEmpty) {
              return const Center(child: Text("No chats found"));
            }
            var chatDocs = snapshot.data!['userInfo'];
            return ListView.builder(
              itemCount: chatDocs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${chatDocs[index]['displayName']}"),
                  subtitle: Text("receiver id : ${chatDocs[index]['uid']}"),
                  leading: const Icon(Icons.person),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => ChatScreen(
                          loginId: widget.loginId,senderId: '${chatDocs[index]['uid']}')));
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}