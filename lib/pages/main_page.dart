import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watts_left/components/my_form.dart';
import 'package:watts_left/components/my_statistics_overview.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent[400],
        title: Text("Dashboard", style: GoogleFonts.mulish(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white,),
            onPressed: () {
    
            },
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: SafeArea(child: Column(
        children: [
          SizedBox(height: 16),
          MyStatisticsOverview(),
          MyForm(),
        ],
      )),
      ),
    );
  }
}