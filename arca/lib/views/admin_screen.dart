import 'dart:async';

import 'package:arca/utils/constants.dart';
import 'package:arca/views/pages/connection_settings.dart';
import 'package:arca/views/pages/lg_settings.dart';
import 'package:flutter/material.dart';
import 'package:ssh2/ssh2.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}


class _AdminScreenState extends State<AdminScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  bool connected = false;
  SSHClient? sshClient;
  Timer? _timer;

  void _handleConnectionChanged(bool connected, SSHClient? client) {
    setState(() {
      this.connected = connected;
      sshClient = client;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text('Settings',
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
              Icons.build_rounded,
              color: Colors.white,
            ),
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: primaryColor,
          labelColor: primaryColor,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(
              icon: Icon(Icons.connected_tv_rounded),
              text: 'Connection',
            ),
            Tab(
              icon: Icon(Icons.south_america),
              text: 'Liquid Galaxy',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ConnectionSettings(onConnectionChanged: _handleConnectionChanged),
          LGSettings(connected: connected, sshClient: sshClient,),
        ],
      ),
      backgroundColor: secondaryColor,
    );
  }
}
