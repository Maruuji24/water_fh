import 'package:flutter/material.dart';
import 'package:water_fh/profile.dart';
import 'reminder.dart';
import 'package:water_fh/tips.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key); // เพิ่ม Key? key

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  double _currentIntake = 0;
  final double _targetIntake = 15000;
  final double _cupSize = 300;

  void _incrementWaterIntake() {
    setState(() {
      _currentIntake += _cupSize;
      if (_currentIntake > _targetIntake) _currentIntake = _targetIntake;
    });
  }

  void _onItemTapped(int index) {
    if(index == 0){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Reminder()),
      );
    } else if(index == 2){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Tips()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // ปิดปุ่ม back
        backgroundColor: Colors.lightBlue[200],
        elevation: 0,
        title: Row(
          children: [
            Image.asset("assets/image/logofh.png",
                height: 60), // เพิ่ม Image.asset แทน Text
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.black54),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ข้อความให้กำลังใจ
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "Start drinking first cup of water!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 20),

            // ตัวบ่งชี้ความคืบหน้าของปริมาณน้ำ
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: CircularProgressIndicator(
                    value: _currentIntake / _targetIntake,
                    backgroundColor: Colors.grey[300],
                    color: Colors.blue,
                    strokeWidth: 10,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "${_currentIntake.toInt()}/15000 ml",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Daily Drink Target",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            // ปุ่มยืนยันการดื่มน้ำ
            ElevatedButton.icon(
              onPressed: _incrementWaterIntake,
              icon: Icon(Icons.local_drink),
              label: Text("Confirm that you have just drunk water"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[300],
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
            SizedBox(height: 20),

            // ส่วนบันทึกประจำวัน
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Today's records",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),

            // รายการบันทึก
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: Icon(Icons.access_time, color: Colors.blue),
                title: Text("07:00 am"),
                subtitle: Text("Next time"),
                trailing: Text("300 ml",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),

      // ปุ่มนำทางด้านล่าง
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlue[200],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
          BottomNavigationBarItem(icon: Icon(Icons.alarm), label: "REMINDER"),
          BottomNavigationBarItem(icon: Icon(Icons.lightbulb), label: "TIPS"),
        ],
      ),
    );
  }
}
