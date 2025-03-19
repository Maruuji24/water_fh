import 'package:flutter/material.dart';
import 'package:water_fh/home.dart';
import 'package:water_fh/tips.dart';
import 'package:water_fh/profile.dart';

class Reminder extends StatefulWidget {
  const Reminder({super.key});

  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<Reminder> {
  List<Map<String, dynamic>> reminders = [];
  int _selectedIndex = 1;

  final List<int> waterAmounts = [50, 100, 200, 250, 300, 500, 750, 1000];

  Future<void> _addOrEditReminder({int? index}) async {
    TimeOfDay initialTime =
        index != null ? reminders[index]['time'] : TimeOfDay.now();
    int initialAmount = index != null ? reminders[index]['amount'] : 250;

    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    if (pickedTime != null) {
      int? selectedMl = await _selectWaterAmount(initialAmount);
      if (selectedMl != null) {
        setState(() {
          if (index != null) {
            reminders[index] = {
              'time': pickedTime,
              'amount': selectedMl,
              'enabled': reminders[index]['enabled'],
            };
          } else {
            reminders.add({
              'time': pickedTime,
              'amount': selectedMl,
              'enabled': true,
            });
          }
          reminders.sort((a, b) => _compareTime(a['time'], b['time']));
        });
      }
    }
  }

  int _compareTime(TimeOfDay a, TimeOfDay b) {
    return (a.hour * 60 + a.minute).compareTo(b.hour * 60 + b.minute);
  }

  Future<int?> _selectWaterAmount(int initialAmount) async {
    int? selectedAmount = initialAmount;
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Water Amount"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: waterAmounts.map((amount) {
              return ListTile(
                title: Text("$amount ml"),
                leading: Radio<int>(
                  value: amount,
                  groupValue: selectedAmount,
                  onChanged: (value) {
                    setState(() {
                      selectedAmount = value;
                    });
                    Navigator.pop(context, value);
                  },
                ),
              );
            }).toList(),
          ),
        );
      },
    ).then((value) => selectedAmount = value);
    return selectedAmount;
  }

  void _deleteReminder(int index) {
    setState(() {
      reminders.removeAt(index);
    });
  }

  void _toggleReminder(int index) {
    setState(() {
      reminders[index]['enabled'] = !reminders[index]['enabled'];
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
                MaterialPageRoute(
                    builder: (context) =>
                        Profile()), 
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: reminders.isEmpty
                  ? Center(
                      child: Text("No reminders yet. Tap below to add one."))
                  : ListView.builder(
                      itemCount: reminders.length,
                      itemBuilder: (context, index) {
                        var reminder = reminders[index];
                        return Card(
                          color: reminder['enabled']
                              ? Colors.white
                              : Colors.grey[300],
                          child: ListTile(
                            leading: Icon(Icons.access_time),
                            title: Text("${reminder['time'].format(context)}"),
                            subtitle: Text("${reminder['amount']} ml"),
                            onTap: () => _addOrEditReminder(index: index),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Switch(
                                  value: reminder['enabled'],
                                  onChanged: (value) => _toggleReminder(index),
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () => _deleteReminder(index),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
            ElevatedButton(
              onPressed: () => _addOrEditReminder(),
              child: Text("Add Reminder"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
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
}
