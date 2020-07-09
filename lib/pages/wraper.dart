import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tindermovies/models/user.dart';
import 'package:tindermovies/pages/auth/login_page.dart';
import 'package:tindermovies/pages/home/tinder_page.dart';

class Wraper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    //Return either Home or Auth widget according to user
    if (user == null) {
      return LoginPage();
    } else {
      return TinderPage();
    }
  }
}
