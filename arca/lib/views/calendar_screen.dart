import 'package:arca/utils/constants.dart';
import 'package:flutter/material.dart';

import '../models/robot.dart';

class CalendarScreen extends StatefulWidget {
  final List<Robot> robots;

  const CalendarScreen({Key? key, required this.robots}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  Robot? selectedRobot;

  @override
  void initState() {
    super.initState();
    selectedRobot = widget.robots.isNotEmpty ? widget.robots[0] : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text('History',
            style: TextStyle(color: Colors.white, fontSize: 20)),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
          splashRadius: 24,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.calendar_month,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Scaffold(
        appBar: AppBar(
          backgroundColor: secondaryColor,
          title: SizedBox(
            height: 40,
            width: 150,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: selected,
                border: Border.all(
                  color: Colors.black38,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(50),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.57),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Align(
                alignment: Alignment.center,
                child: DropdownButton<Robot>(
                  value: selectedRobot,
                  onChanged: (selectedRobot) {
                    setState(() {
                      this.selectedRobot = selectedRobot;
                    });
                  },
                  dropdownColor: selected,
                  items: widget.robots.map((robot) {
                    return DropdownMenuItem<Robot>(
                      value: robot,
                      child: Text(
                        robot.name ?? "",
                        style: const TextStyle(
                          color: textSelected,
                          fontSize: 20,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
