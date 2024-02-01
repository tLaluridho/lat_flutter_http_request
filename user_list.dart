// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:lat_flutter_http_request/model/user.dart';
import 'package:lat_flutter_http_request/user_service.dart';

class UserListView extends StatefulWidget {
  const UserListView({Key? key}) : super(key: key);

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  //state
  List users = [];
  getUsers() async {
    users = await UserService().getUsers();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "UserListView",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => getUsers(),
            icon: const Icon(
              Icons.refresh,
              size: 24.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.length,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          Map<String, dynamic> item = users[index];
          User user = User.fromJson(item);
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[200],
                backgroundImage: NetworkImage(
                  item["avatar"],
                ),
              ),
              title: Text(user.firstName ?? "-"),
              subtitle: Text(user.email ?? "-"),
            ),
          );
        },
      ),
    );
  }
}
