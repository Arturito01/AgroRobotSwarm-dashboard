import 'package:arca/entities/kml/kml_balloon.dart';
import 'package:arca/services/lg_service.dart';
import 'package:arca/services/ssh_service.dart';
import 'package:arca/utils/constants.dart';
import 'package:arca/views/robot_instructions_screen.dart';
import 'package:flutter/material.dart';

import '../../model_views/constant_view_model.dart';
import '../../models/land.dart';
import '../../models/robot.dart';

class RobotDetailPage extends StatefulWidget {
  final Robot? robot;
  final Land? land;
  final Function()? deletePressed;

  const RobotDetailPage(
      {Key? key,
      required this.robot,
      required this.land,
      required this.deletePressed})
      : super(key: key);

  @override
  State<RobotDetailPage> createState() => _RobotDetailPageState();
}

class _RobotDetailPageState extends State<RobotDetailPage> {
  final ConstantViewModel viewModel = ConstantViewModel();
  late List<Robot> robots;

  @override
  void initState() {
    super.initState();
    robots = viewModel.getRobots();
  }

  @override
  Widget build(BuildContext context) {
    final Robot? robot = widget.robot;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: secondaryColor,
          title: Text(
            widget.robot?.name ?? 'unknown',
            style: const TextStyle(color: Colors.white),
          ),
          actions: [
            Container(
                margin: EdgeInsets.only(right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      SSHService.shared.connected
                          ? "Connected"
                          : "Disconnected",
                      style: TextStyle(
                        fontSize: 20,
                        color: SSHService.shared.connected
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                    SizedBox(
                      width: defaultPadding,
                    ),
                    Icon(
                      Icons.circle,
                      color: SSHService.shared.connected
                          ? Colors.green
                          : Colors.red,
                      size: 20.0,
                    ),
                  ],
                )),
          ],
        ),
        body: body(robot, context, widget.land));
  }
}

Widget body(Robot? robot, BuildContext context, Land? land) {
  return Stack(
    children: <Widget>[
      Positioned(
        top: 40,
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
                      robot?.robotId.toString() ?? "999",
                      style: const TextStyle(color: Colors.black, fontSize: 20),
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
                      robot?.name ?? 'unknown',
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                )),
          ),
          const SizedBox(
            height: defaultPadding * 3,
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
                      'CURRENT KG',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    const SizedBox(width: 60),
                    Text(
                      "${robot?.actualKg}",
                      style: const TextStyle(color: Colors.black, fontSize: 20),
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
                      'CURRENT KM',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    const SizedBox(width: 60),
                    Text(
                      "${robot?.actualDistance}",
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                )),
          ),
          const SizedBox(
            height: defaultPadding * 3,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              width: 450,
              height: 50,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    infoBars,
                    info,
                  ],
                ),
              ),
              child: TextButton(
                child: const Center(
                  child: Text(
                    'GO TO ROBOT INSTRUCTIONS',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RobotInstructionsPage(robot: robot),
                    ),
                  );
                },
              ),
            ),
          ),
        ]),
      ),
      Positioned(
        top: 40,
        left: 700,
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
                      'CURRENT BATTERY',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    const SizedBox(width: 60),
                    Text(
                      "${robot?.battery}%",
                      style: const TextStyle(color: Colors.black, fontSize: 20),
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
                      'STATUS',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    const SizedBox(width: 60),
                    Text(
                      robot?.active == true ? "on" : "off",
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                )),
          ),
          const SizedBox(
            height: defaultPadding * 3,
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
                      'TOTAL KG',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    const SizedBox(width: 60),
                    Text(
                      "${robot?.totalKg}",
                      style: const TextStyle(color: Colors.black, fontSize: 20),
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
                      'TOTAL KM',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    const SizedBox(width: 60),
                    Text(
                      "${robot?.totalDistance}",
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                )),
          ),
          const SizedBox(
            height: defaultPadding * 3,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              width: 450,
              height: 50,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    infoBars,
                    info,
                  ],
                ),
              ),
              child: TextButton(
                child: const Center(
                  child: Text(
                    'SEND TO LG',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                onPressed: () {
                  final kml =
                      KMLBalloonEntity(name: "robot", robot: robot, land: land);
                  LGService.shared
                      ?.sendKMLToSlave(LGService.shared!.lastScreen, kml.body);
                },
              ),
            ),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
        ]),
      )
    ],
  );
}
