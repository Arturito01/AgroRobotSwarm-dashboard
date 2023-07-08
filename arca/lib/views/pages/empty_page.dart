import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Center(
            child: Text(
              'WELCOME TO ARCA',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Positioned(
            bottom: 80,
            right: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'Add your first Robot!',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                const SizedBox(height: 10),
                Transform.rotate(
                  angle: 45 * 3.14 / 180,
                  child: const Icon(Icons.arrow_forward,
                      size: 40, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
