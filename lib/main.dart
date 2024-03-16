import 'package:flutter/material.dart';
import 'package:verified_devnet/starter/splashscreen.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

dynamic database;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  database = openDatabase(
    join(await getDatabasesPath(), 'DevnetDB1.db'),
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
            projectId  INTEGER PRIMARY KEY,
            devName TEXT,
            timeRequired TEXT,
            githubLink TEXT,
            techStack TEXT,
            type INTEGER
          )
      ''');
      print('projectCardTable created');
    },
  );

  runApp(const MainApp());
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
