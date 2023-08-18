import 'package:arca/utils/constants.dart';
import 'package:flutter/material.dart';

import '../models/robot.dart';

class RobotInstructionsPage extends StatefulWidget {
  final Robot? robot;

  const RobotInstructionsPage({Key? key, required this.robot})
      : super(key: key);

  @override
  _RobotInstructionsPageState createState() => _RobotInstructionsPageState();
}

class _RobotInstructionsPageState extends State<RobotInstructionsPage> {
  List<String> availableInstructions = [
    'Instruction 1',
    'Instruction 2',
    'Instruction 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text('Robot Instructions',
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
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Instructions'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (String instruction in availableInstructions)
                        ListTile(
                          title: Text(instruction),
                          onTap: () {
                            setState(() {
                              widget.robot?.instructions = true;
                            });
                          },
                        ),
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Cerrar el popup
                      },
                      child: const Text('Close'),
                    ),
                  ],
                );
              },
            );
          },
          child: const Text('Show Instructions'),
        ),
      ),
    );
  }
}
