import 'package:arca/utils/constants.dart';
import 'package:flutter/material.dart';

import '../models/robot.dart';

class GlobalInfoWidget extends StatelessWidget {
  final List<Robot> robots;

  const GlobalInfoWidget({super.key, required this.robots});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: secondaryColor,
          title: const Text('Global Info',
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
                Icons.fire_truck,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                    width: 450,
                    height: 50,
                    padding: const EdgeInsets.only(
                        left: 50, right: 50, top: 6, bottom: 6),
                    color: infoBars,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'ACTIVE ROBOTS',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(width: 60),
                        Text(
                          'BATTERY',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                width: 70,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                    width: 550,
                    height: 50,
                    padding: const EdgeInsets.only(
                        left: 35, right: 35, top: 6, bottom: 6),
                    constraints: const BoxConstraints(
                      maxHeight: 60,
                    ),
                    color: infoBars,
                    child: const Row(
                      children: <Widget>[
                        Text(
                          'INSTRUCTIONS',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(width: 60),
                        Text(
                          'WARNINGS',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(width: 60),
                        Text(
                          'ON / OFF',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    )),
              )
            ]),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                height: 500,
                child: ListView.separated(
                    itemCount: robots.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 15),
                    itemBuilder: (context, index) {
                      return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Container(
                                  height: 50,
                                  width: 450,
                                  padding: const EdgeInsets.only(
                                      left: 75, right: 110, top: 6, bottom: 6),
                                  constraints: const BoxConstraints(
                                    maxHeight: 60,
                                  ),
                                  color: selected,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        robots[index].name ?? "unknown",
                                        style: const TextStyle(
                                            color: textSelected, fontSize: 20),
                                      ),
                                      const SizedBox(width: 60),
                                      Text(
                                        "${robots[index].battery}%",
                                        style: const TextStyle(
                                            color: textSelected, fontSize: 20),
                                      ),
                                    ],
                                  )),
                            ),
                            const SizedBox(
                              width: 70,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Container(
                                  width: 550,
                                  height: 50,
                                  padding: const EdgeInsets.only(
                                      left: 35,
                                      right: defaultPadding,
                                      top: 6,
                                      bottom: 6),
                                  constraints: const BoxConstraints(
                                    maxHeight: 60,
                                  ),
                                  color: selected,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      const Text(
                                        'INSTRUCTIONS',
                                        style: TextStyle(
                                            color: textSelected, fontSize: 20),
                                      ),
                                      const SizedBox(width: 100),
                                      Icon(
                                        Icons.circle_rounded,
                                        color: robots[index].warnings
                                            ? warning
                                            : notSelected,
                                      ),
                                      const SizedBox(width: 130),
                                      Icon(
                                        Icons.circle_rounded,
                                        color: robots[index].active
                                            ? success
                                            : alert,
                                      ),
                                    ],
                                  )),
                            )
                          ]);
                    }))
          ],
        ));
  }
}
