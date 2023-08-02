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
  double totalKg = 0;
  double totalKm = 0;

  @override
  void initState() {
    super.initState();
    selectedRobot = widget.robots.isNotEmpty ? widget.robots[0] : null;
    loadData();
  }

  void loadData() {
    double kgSum = 0;
    double kmSum = 0;

    for (Robot robot in widget.robots) {
      kgSum += robot.totalKg;
      kmSum += robot.totalDistance;
    }

    setState(() {
      totalKg = kgSum;
      totalKm = kmSum;
    });
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
        body: Stack(children: <Widget>[
          Scaffold(
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
          Positioned(
              top: 120,
              left: 90,
              child: Column(children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                      width: 450,
                      height: 50,
                      padding: const EdgeInsets.only(
                          left: 50, right: 50, top: 6, bottom: 6),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            infoBars,
                            info,
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text(
                            'ID',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          const SizedBox(width: 60),
                          Text(
                            selectedRobot?.robotId.toString() ?? "999",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                          ),
                        ],
                      )),
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                      width: 450,
                      height: 50,
                      padding: const EdgeInsets.only(
                          left: 50, right: 50, top: 6, bottom: 6),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            infoBars,
                            info,
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text(
                            'NAME',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          const SizedBox(width: 60),
                          Text(
                            selectedRobot?.name ?? 'unknown',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                          ),
                        ],
                      )),
                ),
                const SizedBox(
                  height: defaultPadding * 3 + 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                      width: 450,
                      height: 50,
                      padding: const EdgeInsets.only(
                          left: 50, right: 50, top: 6, bottom: 6),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            infoBars,
                            info,
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text(
                            'SELECTED ROBOT KG',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          const SizedBox(width: 60),
                          Text(
                            "${selectedRobot?.totalKg}",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                          ),
                        ],
                      )),
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                      width: 450,
                      height: 50,
                      padding: const EdgeInsets.only(
                          left: 50, right: 50, top: 6, bottom: 6),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            infoBars,
                            info,
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text(
                            'SELECTED ROBOT KM',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          const SizedBox(width: 60),
                          Text(
                            "${selectedRobot?.totalDistance}",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                          ),
                        ],
                      )),
                ),
              ])),
          Positioned(
              top: 120,
              left: 700,
              child: Column(children: <Widget>[
                const SizedBox(
                  height: 70 + defaultPadding + 50 + defaultPadding * 3,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                      width: 450,
                      height: 50,
                      padding: const EdgeInsets.only(
                          left: 50, right: 50, top: 6, bottom: 6),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            infoBars,
                            info,
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text(
                            'TOTAL LAND KG',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          const SizedBox(width: 60),
                          Text(
                            "$totalKg",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                          ),
                        ],
                      )),
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                      width: 450,
                      height: 50,
                      padding: const EdgeInsets.only(
                          left: 50, right: 50, top: 6, bottom: 6),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            infoBars,
                            info,
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text(
                            'TOTAL LAND KM',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          const SizedBox(width: 60),
                          Text(
                            "$totalKm",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                          ),
                        ],
                      )),
                ),
              ]))
        ]));
  }
}
