import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyStatistics extends StatefulWidget {
  const MyStatistics({super.key});

  @override
  State<MyStatistics> createState() => _MyStatisticsState();
}

class _MyStatisticsState extends State<MyStatistics> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        height: 216,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          children: [
            Text("Statistics", style: GoogleFonts.mulish(fontSize: 20, fontWeight: FontWeight.bold)),
            const Divider(),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text("198.6 kWh", style: GoogleFonts.mulish(fontSize: 24)),
                    const SizedBox(height: 8),
                    Text("Remaining", style: GoogleFonts.mulish(fontSize: 12,)),
                  ],
                ),
                Column(
                  children: [
                    Text("3.8 kWh", style: GoogleFonts.mulish(fontSize: 24)),
                    const SizedBox(height: 8),
                    Text("Today's Usage", style: GoogleFonts.mulish(fontSize: 12,)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                "Details",
                style: GoogleFonts.mulish(),
                ),
              ),
              ),
            ),
          ],
        )
      ),
    );
  }
}