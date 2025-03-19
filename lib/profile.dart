import 'package:flutter/material.dart';
import 'package:water_fh/home.dart';
import 'package:water_fh/reminder.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();

}
  class _ProfileState extends State <Profile> {
    int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Reminder()),
      );
    } else if(index==0){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
    else {
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
            icon: Icon(Icons.account_circle, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Profile()), 
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
            const SizedBox(height: 20),
            const Text(
              'Profile',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/image/doremon.jpg'),
            ),
            const SizedBox(height: 10),
            const Text(
              'AKKARAMARIN KOINTA',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text('akkaraamrin.2568@gmail.com'),
            const SizedBox(height: 20),
            Card(
              color: Colors.lightBlue,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildListTile('My Account', 'Make changes to your account',
                      Icons.account_circle, Icons.warning, true),
                  _buildSwitchTile('Face ID/ Touch ID',
                      'Manage your device security', Icons.fingerprint),
                  _buildListTile(
                      'Two-Factor Authentication',
                      'Further secure your account for safety',
                      Icons.security,
                      null,
                      false),
                  _buildSwitchTile(
                    'Notification',
                    'Manage your notification',
                    Icons.notifications,
                  ),
                  _buildListTile('Language', 'Manage your language',
                      Icons.language, null, false),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Card(
              color: Colors.lightBlue,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildListTile('Log out', '', Icons.logout, null, false),
                  _buildListTile('About App', '', Icons.info, null, false),
                  _buildListTile('Help & Support', '', Icons.help, null, false),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
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

  ListTile _buildListTile(String title, String subtitle, IconData icon,
      IconData? trailingIcon, bool showTrailingIcon) {
    return ListTile(
      leading: Icon(icon, color: Colors.white), // กำหนดสีของไอคอนให้เป็นขาว
      title: Text(title, style: TextStyle(color: Colors.white)),
      subtitle: Text(subtitle, style: TextStyle(color: Colors.white)),
      trailing: showTrailingIcon && trailingIcon != null
          ? Icon(trailingIcon, color: Colors.red)
          : null,
      onTap: () {},
    );
  }

  SwitchListTile _buildSwitchTile(
      String title, String subtitle, IconData icon) {
    return SwitchListTile(
      value: false,
      onChanged: (value) {},
      title: Text(title, style: TextStyle(color: Colors.white)),
      subtitle: Text(subtitle, style: TextStyle(color: Colors.white)),
      secondary: Icon(icon, color: Colors.white), // กำหนดสีของไอคอนให้เป็นขาว
    );
  }
  }