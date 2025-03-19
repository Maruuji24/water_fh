import 'package:flutter/material.dart';
import 'package:water_fh/home.dart';
import 'package:water_fh/reminder.dart';
import 'package:water_fh/profile.dart';


class Tips extends StatefulWidget {
  const Tips({super.key});

  @override
  _TipsScreen createState() => _TipsScreen();
}

class _TipsScreen extends State<Tips> {
int _selectedIndex = 2;

  void _onItemTapped(int index) {
    if(index==0){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Reminder()),
      );
    } else if(index==2){
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
      body: TipsContent(),
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

class TipsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            'Tips',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          ExpandableTipCard(
            title: 'ทำไมเราดื่มน้ำให้ครบ 8 แก้ว',
            description: 'เนื่องจากในร่างกายของคนเรามีน้ำอยู่ในร่างกายประมาณร้อยละ 60-70 และในแต่ละวันร่างกายต้องสูญเสียน้ำประมาณวันละ 2 ลิตร ซึ่งขับออกมาทางปัสสาวะ เหงื่อ หรือลมหายใจ ปริมาณน้ำที่ถูกขับออกมาจะมากหรือน้อยขึ้นอยู่กับกิจกรรมที่ทำ ช่วงอายุ และน้ำหนักของแต่ละบุคคล ดังนั้นเราจึงต้องดื่มน้ำเพื่อชดเชยน้ำที่สูญเสียไปทุกวัน อย่างน้อยวันละ 2 ลิตร ร่างกายอาจมีการสูญเสียน้ำมากกว่าปกติได้หากมีการสูญเสียน้ำทางอื่น เช่น ท้องเสีย อากาศร้อนมากจนมีการระเหยน้ำทางลมหายใจและเสียเหงื่อมากขึ้น สำหรับผู้มีโรคประจำตัวบางชนิดอาจต้องมีการจำกัดน้ำ เนื่องจากร่างกายขับน้ำส่วนเกินได้น้อย เช่น กลุ่มผู้ป่วยโรคไต โรคหัวใจ ผู้มีโรคประจำตัวควรปรึกษาแพทย์เกี่ยวกับปริมาณการบริโภคน้ำที่เหมาะสมกับตนเอง',
          ),
          SizedBox(height: 12),
          ExpandableTipCard(
            title: 'ดื่มน้ำเท่าไหร่ดีนะ ถึงจะเพียงพอกับเรา',
            description: 'จากสถาบันวิทยาศาสตร์แห่งชาติ (National Academy of sciences-NAS) และ สถาบันแพทยศาสตร์ (The Institute of Medicine-IOM) ได้ให้คำแนะนำในการดื่มน้ำ ดังนี้\nผู้หญิง ควรดื่มวันละประมาณ 2.7 ลิตรต่อวัน (ประมาณ 11.5 แก้ว)\nผู้ชาย ควรดื่มวันละประมาณ 3.7 ลิตรต่อวัน (ประมาณ 15.5 แก้ว)\n\nทริคคำนวณดื่มน้ำตามน้ำหนักตัว\n   [น้ำหนัก x 2.2 x 30/2] /1000 = ปริมาณน้ำ (ลิตร)',
          ),
          SizedBox(height: 12),
          ExpandableTipCard(
            title: 'ประโยชน์ของการดื่มน้ำให้เพียงพอ',
            description: '1.ป้องกันท้องผูก\n2.ช่วยควบคุมน้ำหนัก\n3.ลดความเครียดกังวล\n4.ป้องกันการเกิดนิ่ว\n5.พัฒนาความจำระยะสั้น\n6.อารมณ์ดีขึ้นและหลับได้ดี',
          ),
          SizedBox(height: 12),
          ExpandableTipCard(
            title: 'วิธีเลือกน้ำดื่มที่สะอาด ปลอดภัย ต่อร่างกาย',
            description: 'น้ำดื่มในปัจจุบันมีหลากหลายแบบจึงควรเลือกน้ำดื่มที่ผลิตจากบริษัทที่มีมาตรฐาน มีฉลากติดที่ขวด และมีสัญลักษณ์ ดังนี้\n1.สัญลักษณ์และหมายเลข อย.\n2.สัญลักษณ์ Good Manufacturing Practice (GMP)\n3.ตรามาตรฐาน Hazards Analysis and Critical Points (HACCP) ซึ่งเป็นมาตรฐานระดับสากล',
          ),
          SizedBox(height: 12),
          ExpandableWarningCard(
            title: 'ข้อควรระวัง',
            description: 'หากดื่มมากหรือน้อยเกินไปก็จะส่งผลต่อร่างกายได้ เมื่อร่างกายขาดน้ำ การทำงานของระบบอวัยวะจะติดขัด เมื่อร่างกายได้รับน้ำมากเกินไปจนเกิดภาวะน้ำเป็นพิษ เกิดการเสียสมดุลระหว่างน้ำในเซลล์และนอกเซลล์ ทำให้ความเข้มข้นของเลือดลดลง ร่างกายต้องขับแร่ธาตุบางชนิดออกจากเซลล์เพื่อปรับสมดุลของน้ำ อีกทั้งยังขาดความสมดุลของแร่ธาตุชนิดนั้นแทน ส่งผลให้เกิดความผิดปกติขึ้นในกระบวนการทำงานของเซลล์ ซึ่งอาจรุนแรงถึงขั้นทำให้เสียชีวิตได้',
          ),
          SizedBox(height: 12),
          ExpandableWarningCard(
            title: 'สารปนเปื้อนที่มากับน้ำไม่สะอาด มีอะไรบ้าง',
            description: '1.เหล็ก หากได้รับเข้าสู่ร่างกายในปริมาณมาก จะส่งผลกระทบต่อสุขภาพหลายทาง เช่น ระคายเคืองทางเดินอาหาร ในรายที่รุนแรงมีภาวะเลือดเป็นกรด หลอดเลือดขยายตัวทำให้ความดันเลือดลดลง การสะสมธาตุเหล็กเกินในระยะยาวส่งผลให้เกิดการบาดเจ็บของตับได้\n2.ปรอท เมื่อร่างกายมีปรอทสะสมอยู่ในปริมาณมากจะทำให้เกิดอาการปวดท้อง ท้องเสีย หรือส่งผลร้ายแรงต่อระบบประสาท เช่น ทำให้ตาพร่ามัว มองไม่ชัด ส่งผลต่อระบบประสาทด้านอารมณ์และความจำ มีภาวะสมองเสื่อมได้\n3.แมงกานีส อาจปนเปื้อนมากับน้ำดื่มที่ไม่ได้มาตรฐาน ส่งผลให้มีอาการปวดศีรษะ ระคายเคืองทางเดินอาหารในระยะยาว ส่งผลต่อการบาดเจ็บของเซลล์สมองได้\n4.ทองแดง หากร่างกายมีทองแดงสะสมเกินกว่า 100 มิลลิกรัม จะส่งผลให้ระคายเคืองทางเดินอาหาร อ่อนเพลีย เบื่ออาหาร อาเจียน ในรายที่รุนแรงอาจมีเม็ดเลือดแดงแตกและส่งผลถึงการทำงานของตับ\n5.เชื้อโรคที่ปนเปื้อนมากับน้ำไม่สะอาด โดยเฉพาะเชื้อโคลิฟอร์มแบคทีเรีย เช่น เชื้ออีโคไล ซิโตรแบคเตอร์ เคลบเซลล่า หากมีเชื้อโรคเหล่านี้อาจส่งผลให้เกิดการติดเชื้อ ทำให้มีไข้ ปวดท้อง ท้องเสีย การฆ่าเชื้อโรคกลุ่มนี้สามารถทำได้โดยกระบวนการฆ่าเชื้อ เช่น การต้มน้ำ กระบวนการพาสเจอไรซ์ หรือผ่านระบบกรองน้ำที่มีระบบฆ่าเชื้อที่มีประสิทธิภาพ',
          ),
        ],
      ),
    );
  }
}

class ExpandableTipCard extends StatefulWidget {
  final String title;
  final String description;

  ExpandableTipCard({
    required this.title,
    required this.description,
  });

  @override
  _ExpandableTipCardState createState() => _ExpandableTipCardState();
}

class _ExpandableTipCardState extends State<ExpandableTipCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF2980B9),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.lightbulb_outline,
                      color: Colors.white,
                      size: 25,
                    ),
                    SizedBox(width: 8),
                    Icon(
                      isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 25,
                    ),
                  ],
                ),
              ],
            ),
            if (isExpanded) ...[
              SizedBox(height: 8),
              Text(
                widget.description,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class ExpandableWarningCard extends StatefulWidget {
  final String title;
  final String description;

  ExpandableWarningCard({
    required this.title,
    required this.description,
  });

  @override
  _ExpandableWarningCardState createState() => _ExpandableWarningCardState();
}

class _ExpandableWarningCardState extends State<ExpandableWarningCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color.from(alpha: 1, red: 1, green: 0.369, blue: 0),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.white,
                      size: 25,
                    ),
                    SizedBox(width: 8),
                    Icon(
                      isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 25,
                    ),
                  ],
                ),
              ],
            ),
            if (isExpanded) ...[
              SizedBox(height: 8),
              Text(
                widget.description,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}