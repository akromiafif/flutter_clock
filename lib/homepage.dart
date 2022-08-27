import 'package:flutter/material.dart';
import 'package:flutter_clock/clock_view.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';

    if (!timezoneString.startsWith('-')) {
      offsetSign = '+';
    }

    return Scaffold(
      backgroundColor: const Color(0xFF2D2F41),
      body: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Clock',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  formattedTime,
                  style: const TextStyle(color: Colors.white, fontSize: 64),
                ),
                Text(
                  formattedDate,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                ClockView(),
                const Text(
                  'Timezone',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: <Widget>[
                    const Icon(
                      Icons.language,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      'UTC$offsetSign$timezoneString',
                      style: const TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
