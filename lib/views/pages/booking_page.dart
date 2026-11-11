import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fly_booking/views/pages/Khu_Hoi_Page.dart';
import 'package:fly_booking/views/pages/mot_chieu_page.dart';
import 'package:fly_booking/views/pages/nhieu_chang_page.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  int groupValue = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF0A192F),
                  Color(0xFF1E3A8A),
                  Color(0xFF60A5FA),
                  Color(0xFF93C5FD),
                ],
              ),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Tìm kiếm chuyến bay',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                CupertinoSegmentedControl<int>(
                  padding: EdgeInsets.all(5),
                  groupValue: groupValue,
                  selectedColor: Colors.blue,
                  unselectedColor: Colors.grey.withValues(alpha: 0.2),
                  borderColor: Colors.transparent,
                  children: {
                    0: buildSegnment('Khứ hồi'),
                    1: buildSegnment('Một chiều'),
                    2: buildSegnment('Nhiều chặng'),
                  },
                  onValueChanged: (groupValue) {
                    setState(() {
                      this.groupValue = groupValue;
                    });
                  },
                ),
                Expanded(
                  child: IndexedStack(
                    index: groupValue,
                    children: [KhuHoiPage(), MotChieuPage(), NhieuChangPage()],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    maximumSize: Size.infinite,
                  ),
                  child: Text('Tìm kiếm chuyến bay'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSegnment(String text) => Container(
    padding: EdgeInsets.all(6),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
