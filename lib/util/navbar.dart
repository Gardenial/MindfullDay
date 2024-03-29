// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mindfullday_v1/login_page.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(118, 8, 4, 27),

      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('Nome do Usuario'),
                accountEmail: Text('Email do Usuario'),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 125, 63, 240),
                  backgroundColor: Color.fromARGB(0, 202, 190, 255),
                  side: BorderSide.none, // This will remove the borders
                ),
                child: Text('Logout'),
              )
            ],
          ),
        ),
      ),
    );
  }
}