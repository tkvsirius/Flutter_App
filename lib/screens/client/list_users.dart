import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contract_1/models/users.dart';
import 'package:flutter_contract_1/screens/username.dart';
import 'package:flutter_contract_1/themable.dart';
import 'package:flutter_contract_1/widgets/widget_app_bar.dart';
import 'package:http/http.dart' as http;

class ListUsersScreen extends StatefulWidget {
  const ListUsersScreen({Key? key}) : super(key: key);

  @override
  _ListUsersScreenState createState() => _ListUsersScreenState();
}

class _ListUsersScreenState extends State<ListUsersScreen> with Themeable {
  Future<List<User>> fetchUsers() async {
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      return List<User>.from(
          json.decode(response.body).map((x) => User.fromJson(x)));
    } else {
      throw Exception('Ошибка загрузки');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: colorByMode(context),
      navigationBar: const MyAppBar(),
      child: SafeArea(
        child: _buildListUsers(context),
      ),
    );
  }

  ///
  /// List Users
  ///
  Widget _buildListUsers(BuildContext context) {
    return FutureBuilder(
      future: fetchUsers(),
      builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
        if (snapshot.hasData) {
          return Material(
            child: ListView(
              children: snapshot.data!.map<Widget>((User item) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => UserName(
                          username: item.username ?? '',
                          email: item.email ?? '',
                          name: item.name ?? '',
                          phone: item.phone ?? '',
                          website: item.website ?? '',
                          company: item.company,
                        ),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    child: Text(item.username!.substring(0, 1)),
                  ),
                  title: Text(item.username ?? ''),
                  subtitle: Text(item.name ?? ''),
                );
              }).toList(),
            ),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
