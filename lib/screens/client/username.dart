import 'package:flutter/material.dart';
import 'package:flutter_contract_1/models/users.dart';
import 'package:flutter_contract_1/themable.dart';

class UserName extends StatefulWidget {
  /// Входные данные виджета (класса) User
  final User user;

  UserName({
    Key? key,
    required this.user,
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
              '${widget.user.username}',
            )),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Text(
                'name: ${widget.user.name}',
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
                'email: ${widget.user.email}',
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
                'phone: ${widget.user.phone}',
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
                'website: ${widget.user.website}',
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
                'Company name: ${widget.user.company?.name}',
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
                'Company bs: ${widget.user.company?.bs}',
                style: TextStyle(
                  color: colorByModeReverse(
                    context,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Adress:'),
              const SizedBox(
                height: 10,
              ),
              Text('Street: ${widget.user.address?.street}'),
              const SizedBox(
                height: 10,
              ),
              Text('Suite: ${widget.user.address?.suite}'),
              const SizedBox(
                height: 10,
              ),
              Text('City: ${widget.user.address?.city}'),
              const SizedBox(
                height: 10,
              ),
              Text('Zipcode: ${widget.user.address?.zipcode}'),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Geo: (${widget.user.address?.geo?.lat} -'
                '${widget.user.address?.geo?.lng})',
              ),
            ],
          ),
        ));
  }
}
