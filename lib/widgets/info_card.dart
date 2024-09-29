import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

Widget infoCard(String label, String value) {
  return Expanded(
    child: Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            const SizedBox(height: 8.0),
            Animate(
              effects:const [ FadeEffect(),  ScaleEffect()],
              child: Text(
                value,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
