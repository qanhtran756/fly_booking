import 'package:flutter/material.dart';

bool showPriceInMoney = true;
int adults = 1;
int children = 0;
int infants = 0;
bool? isChecked = false;

class NhieuChangPage extends StatefulWidget {
  const NhieuChangPage({super.key});

  @override
  State<NhieuChangPage> createState() => _NhieuChangPageState();
}

class _NhieuChangPageState extends State<NhieuChangPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 5),
          Text(
            'CHUYẾN BAY 1',
            style: TextStyle(
              color: Colors.yellow[700],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  dateCard(label: 'ĐIỂM KHỞI HÀNH', onTap: () => {}),
                  const SizedBox(height: 26),
                  dateCard(label: 'ĐIỂM ĐẾN', onTap: () => {}),
                ],
              ),
              SizedBox(width: 60),
              Column(
                children: [dateCard(label: 'NGÀY ĐI', onTap: () => {})],
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'CHUYẾN BAY 2',
            style: TextStyle(
              color: Colors.yellow[700],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  dateCard(label: 'ĐIỂM KHỞI HÀNH', onTap: () => {}),
                  const SizedBox(height: 26),
                  dateCard(label: 'ĐIỂM ĐẾN', onTap: () => {}),
                ],
              ),
              SizedBox(width: 60),
              Column(
                children: [dateCard(label: 'NGÀY ĐI', onTap: () => {})],
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add),
              Text(
                'Thêm chuyến bay',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          Container(
            margin: EdgeInsets.all(15),
            width: 320,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey.withAlpha(80),
            ),
            child: Column(
              children: [
                Divider(color: Color(0xFF7088A1)),
                SizedBox(height: 14),
                Text(
                  'HÀNH KHÁCH',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 10),
                    Column(
                      children: [
                        Text(
                          '01 Hành khách',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '01 Người lớn',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 180),
                    Icon(Icons.arrow_downward),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: 320,
            height: 88,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey.withAlpha(80),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hạng dịch vụ',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Phổ thông',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 190),
                Icon(Icons.arrow_downward),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.all(10),
            width: 320,
            height: 88,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey.withAlpha(80),
            ),
            child: Column(
              children: [
                Text(
                  'Mã khuyến mại (nếu có)',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 15),
              Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              ),
              Text('Hiển thị loại giá được phép hoàn'),
            ],
          ),
        ],
      ),
    );
  }

  Widget dateCard({required String label, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: 132,
        height: 132,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF8296AF), width: 1.3),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, color: Colors.white, size: 32),
            SizedBox(height: 12),
            Text(
              label,
              style: const TextStyle(color: Color(0xFF9EADC0), fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
