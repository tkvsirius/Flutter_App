import 'package:flutter/material.dart';
import 'package:flutter_contract_1/models/users.dart';
import 'package:flutter_contract_1/themable.dart';

class UserName extends StatefulWidget {
  final String username;
  final String name;
  final String email;
  final String phone;
  final String website;
  final Company? company;

  UserName({
    Key? key,
    required this.username,
    required this.name,
    required this.email,
    required this.phone,
    required this.website,
    required this.company,
  }) : super(key: key);

  @override
  State<UserName> createState() => _UserNameState();
}

class _UserNameState extends State<UserName> with Themeable {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: colorByModeIndigoWhite(context),
            centerTitle: true,
            title: Text(
              '${widget.username}',
            )),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Text(
                'name: ${widget.name}',
                style: TextStyle(
                  color: colorByModeReverse(
                    context,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'email: ${widget.email}',
                style: TextStyle(
                  color: colorByModeReverse(
                    context,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'phone: ${widget.phone}',
                style: TextStyle(
                  color: colorByModeReverse(
                    context,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'website: ${widget.website}',
                style: TextStyle(
                  color: colorByModeReverse(
                    context,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Company name: ${widget.company?.name}',
                style: TextStyle(
                  color: colorByModeReverse(
                    context,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
