import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String? menuItem = 'e1';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Setting'),
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
              Text('Quốc gia/Vùng'),
              DropdownButton(
                isExpanded: true,
                value: menuItem,
                items: [
                  DropdownMenuItem(value: 'e1', child: Text('Vietnam')),
                  DropdownMenuItem(value: 'e2', child: Text('England')),
                  DropdownMenuItem(value: 'e3', child: Text('Germany')),
                  DropdownMenuItem(value: 'e4', child: Text('China')),
                  DropdownMenuItem(value: 'e5', child: Text('Japan')),
                ],
                onChanged: (String? value) {
                  setState(() {
                    menuItem = value;
                  });
                },
              ),
              SizedBox(height: 5.0),
              Text('Ngôn ngữ'),
              DropdownButton(
                isExpanded: true,
                value: menuItem,
                items: [
                  DropdownMenuItem(value: 'e1', child: Text('Vietnam')),
                  DropdownMenuItem(value: 'e2', child: Text('England')),
                  DropdownMenuItem(value: 'e3', child: Text('Germany')),
                  DropdownMenuItem(value: 'e4', child: Text('China')),
                  DropdownMenuItem(value: 'e5', child: Text('Japan')),
                ],
                onChanged: (String? value) {
                  setState(() {
                    menuItem = value;
                  });
                },
              ),
              SizedBox(height: 5.0),
              Row(
                children: [
                  Text('Loại tiền thanh toán'),
                  Spacer(),
                  Text(
                    'VND',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
