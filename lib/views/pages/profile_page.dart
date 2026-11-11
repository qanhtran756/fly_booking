import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Profile'),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  Color(0xFF0A192F),
                  Color(0xFF1E3A8A),
                  Color(0xFF60A5FA),
                  Color(0xFF93C5FD),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image(
                        image: AssetImage('assets/images/user_default.png'),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Trần Duy Quang',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('0835162536'),
                    ],
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  SizedBox(
                    height: 50,
                    child: Icon(Icons.account_circle, size: 35.0),
                  ),
                  SizedBox(width: 15),
                  Text(
                    'Thông tin tài khoản',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  SizedBox(height: 50, child: Icon(Icons.history, size: 35.0)),
                  SizedBox(width: 15),
                  Text(
                    'Lịch sử chuyến bay',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
