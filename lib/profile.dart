import 'package:flutter/material.dart';
import 'package:water_fh/home.dart';
import 'package:water_fh/login.dart';
import 'package:water_fh/reminder.dart';
import 'package:water_fh/tips.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _selectedIndex = 0;

  // ตัวแปรสำหรับเก็บสถานะของสวิตช์
  bool _isFaceIdEnabled = false;
  bool _isNotificationEnabled = false;

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Reminder()),
      );
    } else if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else if (index == 2) {
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
        automaticallyImplyLeading: false,
        backgroundColor: Colors.lightBlue[200],
        elevation: 0,
        title: Row(
          children: [
            Image.asset("assets/image/logofh.png", height: 60),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.black),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 3),
            const Text(
              'Profile',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Stack(
              alignment: Alignment.center,
              children: [
                // วงกลมสีฟ้า (ขอบ)
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue, width: 4),
                  ),
                ),
                // รูปโปรไฟล์
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/image/doremon.jpg'),
                ),
                // ไอคอนกล้อง
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.blue,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'AKKARAMARIN KOINTA',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            const Text(
              'akkaraamrin.2568@gmail.com',
              style: TextStyle(fontSize: 8),
            ),
            const SizedBox(height: 5),
            Card(
              color: Colors.lightBlue,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildListTile('My Account', 'Make changes to your account',
                        Icons.account_circle, Icons.warning, true, true),
                    _buildSwitchTile(
                        'Face ID/ Touch ID',
                        'Manage your device security',
                        Icons.fingerprint,
                        _isFaceIdEnabled, (value) {
                      setState(() {
                        _isFaceIdEnabled = value;
                      });
                    }),
                    _buildListTile(
                        'Two-Factor Authentication',
                        'Further secure your account for safety',
                        Icons.security,
                        null,
                        false,
                        true),
                    _buildSwitchTile('Notification', 'Manage your notification',
                        Icons.notifications, _isNotificationEnabled, (value) {
                      setState(() {
                        _isNotificationEnabled = value;
                      });
                    }),
                    _buildListTile('Language', 'Manage your language',
                        Icons.language, null, false, true),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              color: Colors.lightBlue,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  children: [
                    _buildListTile(
                        'Log out', '', Icons.logout, null, false, true),
                    _buildListTile(
                        'About App', '', Icons.info, null, false, true),
                    _buildListTile(
                        'Help & Support', '', Icons.help, null, false, true),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlue[200],
        selectedItemColor: Colors.black54,
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

  ListTile _buildListTile(String title, String subtitle, IconData icon,
      IconData? trailingIcon, bool showTrailingIcon, bool showArrow) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title,
          style: TextStyle(color: Colors.white, fontSize: 14, height: 1.2)),
      subtitle: Text(subtitle,
          style: TextStyle(color: Colors.white, fontSize: 9, height: 1.2)),
      trailing: showArrow
          ? Icon(Icons.arrow_forward_ios,
              color: Colors.white) // ไอคอนลูกศรชี้ขวา
          : (showTrailingIcon && trailingIcon != null
              ? Icon(trailingIcon, color: Colors.red)
              : null),
      onTap: () {
        if (title == 'Log out') {
          _showLogOutDialog(context);
        }
      },
    );
  }

  void _showLogOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ยืนยันการออกจากระบบ'),
          content: Text('คุณต้องการออกจากระบบหรือไม่?'),
          actions: <Widget>[
            TextButton(
              child: Text('ยกเลิก'),
              onPressed: () {
                Navigator.of(context).pop(); // ปิด Dialog หากผู้ใช้เลือกยกเลิก
              },
            ),
            TextButton(
              child: Text('ตกลง'),
              onPressed: () {
                Navigator.of(context).pop(); // ปิด Dialog

                // เรียกใช้ฟังก์ชันออกจากระบบ
                _logOut(context);

                // หลังจากออกจากระบบแล้วไปที่หน้า Login
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LoginScreen()), // เปลี่ยน LoginPage() ให้เป็นหน้าล็อกอินของคุณ
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _logOut(BuildContext context) {
    // ตัวอย่างการออกจากระบบ
    print("User logged out");
  }

  SwitchListTile _buildSwitchTile(String title, String subtitle, IconData icon,
      bool value, ValueChanged<bool> onChanged) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: Text(title, style: TextStyle(color: Colors.white, fontSize: 14)),
      subtitle:
          Text(subtitle, style: TextStyle(color: Colors.white, fontSize: 9)),
      secondary: Icon(icon, color: Colors.white),
    );
  }
}
