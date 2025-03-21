import 'package:flutter/material.dart';
import 'package:water_fh/login.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xFF8DD3F7),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(  // นี่คือตัวที่ทำให้เลื่อนได้
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  height: 250,
                  margin: EdgeInsets.only(bottom: 0, top: 10),
                  child: Image.asset(
                    "assets/image/logofh.png", 
                   
                  ),
                ),
        
                Text(
                  "Register", //คำ login ล่าง logo
                  style: TextStyle(
                    color: Color(0xFF0A496A),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                SizedBox(height: 10),
        
                //ช่องสำหรับกรอก email
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
                      width: double.infinity,  //ขนาดของช่องที่พิมพ์ email ถ้าไม่พอใจเปลี่ยนได้แต่บอกด้วย
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
                      "Username",
                      style: TextStyle(
                        color: Color(0xFF0A496A),
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: double.infinity,  //ขนาดของช่องที่พิมพ์ email ถ้าไม่พอใจเปลี่ยนได้แต่บอกด้วย
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

                //สำหรับกรอก password 
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
                      width: double.infinity, //ขนาดของช่องที่พิมพ์ password ถ้าไม่พอใจเปลี่ยนได้แต่บอกด้วย
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
        
                // Register button
                Container(
                  width: double.infinity, //ขนาดของปุ่ม Register ถ้าไม่พอใจเปลี่ยนได้แต่บอกด้วย
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF5799BD),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
        
                SizedBox(height: 50), 
        
              ],
            ),
          ),
        ),
      ),
    );
  }
}
