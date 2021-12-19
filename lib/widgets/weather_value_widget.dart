import 'package:flutter/material.dart';

class WeatherValue extends StatelessWidget {
  final String type;
  final String value;
  final String timeStamp;
  const WeatherValue({Key? key, required this.type, required this.value, required this.timeStamp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              type+' : ',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                letterSpacing: 1,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                letterSpacing: 1,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            ('Time : ' + timeStamp).toUpperCase(),
            style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w500
            ),
          ),
        ),
      ],
    );
  }
}
