import 'package:flutter/material.dart';
import 'package:flutter_clock/clockview.dart';
import 'package:intl/intl.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({Key? key}) : super(key: key);

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
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

    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Text(
                'Clock',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'avenir',
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    formattedTime,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 64,
                      fontFamily: 'avenir',
                    ),
                  ),
                  Text(
                    formattedDate,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'avenir',
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: Align(
                alignment: Alignment.center,
                child: ClockView(
                  size: MediaQuery.of(context).size.height / 3,
                ),
              ),
            ),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Timezone',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'avenir',
                    ),
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
                        'UTC $offsetSign $timezoneString',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'avenir',
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
