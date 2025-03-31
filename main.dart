import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '현재 시각',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TimeDisplayScreen(),
    );
  }
}

class TimeDisplayScreen extends StatefulWidget {
  const TimeDisplayScreen({Key? key}) : super(key: key);

  @override
  _TimeDisplayScreenState createState() => _TimeDisplayScreenState();
}

class _TimeDisplayScreenState extends State<TimeDisplayScreen> {
  late String _currentDateTime;

  @override
  void initState() {
    super.initState();
    _currentDateTime = _getCurrentDateTime();
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        _currentDateTime = _getCurrentDateTime();
      });
    });
  }

  String _getCurrentDateTime() {
    final now = DateTime.now();
    return '${now.year}년 ${now.month}월 ${now.day}일 ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('현재 시각'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          _currentDateTime,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
