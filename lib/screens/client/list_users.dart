import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contract_1/models/users.dart';
import 'package:flutter_contract_1/screens/client/username.dart';
import 'package:flutter_contract_1/themable.dart';
import 'package:flutter_contract_1/widgets/drower.dart';
import 'package:flutter_contract_1/widgets/widget_app_bar.dart';
import 'package:http/http.dart' as http;

class ListUsersScreen extends StatefulWidget {
  const ListUsersScreen({Key? key}) : super(key: key);

  @override
  _ListUsersScreenState createState() => _ListUsersScreenState();
}

class _ListUsersScreenState extends State<ListUsersScreen> with Themeable {
  ///
  Future<List<User>> fetchUsers() async {
    final http.Response response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body).map<User>((dynamic x) {
        return User.fromJson(
          Map<String, dynamic>.from(x as Map<dynamic, dynamic>),
        );
      }).toList() as List<User>;
    } else {
      throw Exception('Ошибка загрузки');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrower(),
      backgroundColor: colorByMode(context),
      appBar: const MyAppBar(),
      body: SafeArea(
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
              children: snapshot.data!.map<Widget>((User itemUser) {
                return ListTile(
                  onTap: () {
                    Navigator.push<dynamic>(
                      context,
                      CupertinoPageRoute<dynamic>(
                        builder: (context) => UserName(
                          user: itemUser,
                        ),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    child: Text(itemUser.username!.substring(0, 1)),
                  ),
                  title: Text(itemUser.username ?? ''),
                  subtitle: Text(itemUser.name ?? ''),
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
