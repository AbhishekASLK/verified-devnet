import 'dart:async';

import 'package:flutter/material.dart';
import 'package:verified_devnet/starter/splashscreen.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

dynamic database;
List<Map<String, dynamic>> developersCredentialsList = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  database = await openDatabase(
    join(await getDatabasesPath(), 'DevnetDB2.1.db'),
    version: 1,
    onCreate: (db, version) {
      // =============== DEVELOPER LOGIN TABLE ==============

      db.execute('''
          CREATE TABLE devLoginTable(
            email TEXT,
            username TEXT PRIMARY KEY,
            password TEXT
          )
      ''');
      print('devLoginTable created');

      // =============== COMPANY LOGIN TABLE =================

      db.execute('''
          CREATE TABLE companyLoginTable(
            email TEXT,
            username TEXT PRIMARY KEY,
            password TEXT
          )
      ''');
      print('companyLoginTable created');

      // =============== ProjectCard TABLE =================

      db.execute('''
          CREATE TABLE projectCartTable(
            projectId  INTEGER PRIMARY KEY AUTOINCREMENT,
            developerName TEXT,
            projectName TEXT,
            timeRequired TEXT,
            gitLink TEXT,
            techStack TEXT,
            type TEXT
          )
      ''');
      print('projectCardTable created');
    },
  );

  runApp(const MainApp());
}

Future getDeveloperLoginInfo() async {
  print('before query');
  print(await database.query('devLoginTable'));
  developersCredentialsList = await database.query('devLoginTable');
  print('after query');
  return developersCredentialsList;
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
