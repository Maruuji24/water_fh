import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF8DD3F7),
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(  // เพิ่มตัวนี้กัน Overflow
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo เปลี่ยนเป็นรูป
              Container(
                width: 150,
                height: 150,
                margin: EdgeInsets.only(bottom: 30, top: 60),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  "assets/image/logofh.png",
                  fit: BoxFit.cover,
                ),
              ),

              Text(
                "Log in",
                style: TextStyle(
                  color: Color(0xFF0A496A),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: TextStyle(
                      color: Color(0xFF0A496A),
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: double.infinity, // แก้ width ตรงนี้
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Password",
                    style: TextStyle(
                      color: Color(0xFF0A496A),
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: double.infinity, // แก้ width ตรงนี้
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40),

              Container(
                width: double.infinity, // แก้ width ตรงนี้
                child: ElevatedButton(
                  onPressed: () {
                    // กด login แล้วให้ไปไหน
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0A496A),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    "Log in",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              
              SizedBox(height: 15),
              Text("Or"),
              SizedBox(height: 15),

              // Register button
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // กด register แล้วจะให้ไปไหน
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF5799BD),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 50), // เผื่อระยะขอบล่าง
            ],
          ),
        ),
      ),
    );
  }
}
