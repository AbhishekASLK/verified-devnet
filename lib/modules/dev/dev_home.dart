import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sqflite/sqflite.dart';
import 'package:verified_devnet/main.dart';
import 'package:verified_devnet/starter/askmenu.dart';

class ProjectCard {
  int? projectId;
  String developerName;
  String projectName;
  String timeRequired;
  String gitLink;
  String techStack;
  String type;
  String status;

  ProjectCard({
    this.projectId,
    required this.developerName,
    required this.projectName,
    required this.timeRequired,
    required this.gitLink,
    required this.techStack,
    required this.type,
    this.status = 'Unverified',
  });

  Map<String, dynamic> toMap() {
    return {
      'projectId': projectId,
      'developerName': developerName,
      'projectName': projectName,
      'timeRequired': timeRequired,
      'gitLink': gitLink,
      'techStack': techStack,
      'type': type,
      'status': status,
    };
  }
}

class DevHome extends StatefulWidget {
  final String loggedUser;
  const DevHome({
    required this.loggedUser,
    super.key,
  });

  @override
  State<DevHome> createState() => _DevHomeState();
}

String _type = 'Individual';
List projectCardList = [];

class _DevHomeState extends State<DevHome> {
  final TextEditingController _projectNameController = TextEditingController();
  final TextEditingController _timeRequiredController = TextEditingController();
  final TextEditingController _gitLinkController = TextEditingController();
  final TextEditingController _techStackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(33, 17, 52, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(33, 17, 52, 1),
        leading: ClipOval(
          child: Image.asset(
            'assets/images/abhishek.jpeg',
          ),
        ),
        title: Text(
          widget.loggedUser,
          style: GoogleFonts.poppins(
            color: const Color.fromRGBO(235, 235, 244, 0.8),
            fontSize: 16,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const AskMenu();
                  },
                ),
              );
            },
            child: const Icon(
              Icons.logout,
              color: Color.fromRGBO(235, 235, 244, 0.8),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 47, 27, 71),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      30,
                    ),
                  ),
                ),
                height: 50,
                width: 150,
                child: Center(
                  child: Text(
                    'All Projects',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 150,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 47, 27, 71),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      30,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Search',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: projectCardList.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(156, 44, 243, 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          20,
                        ),
                      ),
                    ),
                    width: 350,
                    height: 200,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset(
                              'assets/icons/edit.png',
                              height: 30,
                              width: 30,
                            ),
                            Image.asset(
                              'assets/icons/trash.png',
                              height: 30,
                              width: 30,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // ========= Project Name ============
                                Text(
                                  projectCardList[index].projectName,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),

                                // ========= Time required ============
                                Row(
                                  children: [
                                    Text(
                                      'Time required: ',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      projectCardList[index].timeRequired,
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                // ========= Git repo ============
                                Row(
                                  children: [
                                    Text(
                                      'Github: ',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      projectCardList[index].gitLink,
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                // ========= Tech Stack ============
                                Row(
                                  children: [
                                    Text(
                                      'Tech-Stack: ',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      projectCardList[index].techStack,
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Type:  ',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      projectCardList[index].type,
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: const Color.fromRGBO(82, 170, 94, 1.0),
        onPressed: () {
          setState(() {});
          myBottomSheet();
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromRGBO(118, 70, 177, 1),
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.home,
                color: Color.fromRGBO(43, 217, 254, 1.0),
                size: 40,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person,
                color: Colors.white,
                size: 40,
              ),
            )
          ],
        ),
      ),
    );
  }

  void myBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Add project',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Project Name:',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: _projectNameController,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      30,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Time Required:',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: _timeRequiredController,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      30,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Gitlink:',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: _gitLinkController,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      30,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Tech-Stack:',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: _techStackController,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      30,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'Type:',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const BottomSheetIssue(),
                            const SizedBox(
                              height: 5,
                            ),
                            const SizedBox(height: 20),
                            Align(
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                onPressed: () async {
                                  ProjectCard obj = ProjectCard(
                                    developerName: widget.loggedUser,
                                    projectName: _projectNameController.text,
                                    timeRequired: _timeRequiredController.text,
                                    gitLink: _gitLinkController.text,
                                    techStack: _techStackController.text,
                                    type: _type,
                                  );

                                  await insertProjectCard(obj);
                                  setState(() {});
                                  print(projectCardList[0].projectId);
                                  Navigator.pop(context);
                                },
                                child: const Text('Submit'),
                              ),
                            ),
                            const SizedBox(
                              height: 19,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future insertProjectCard(ProjectCard obj) async {
    await database.insert(
      'projectCartTable',
      obj.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    projectCardList = await getProjectCards();
  }
}

Future getProjectCards() async {
  List<Map<String, dynamic>> cardsListOfMap =
      await database.query('projectCartTable');
  return List.generate(
    cardsListOfMap.length,
    (index) {
      return ProjectCard(
        projectId: cardsListOfMap[index]['projectId'],
        developerName: cardsListOfMap[index]['developerName'],
        projectName: cardsListOfMap[index]['projectName'],
        timeRequired: cardsListOfMap[index]['timeRequired'],
        gitLink: cardsListOfMap[index]['gitLink'],
        techStack: cardsListOfMap[index]['techStack'],
        type: cardsListOfMap[index]['type'],
        status: cardsListOfMap[index]['status'],
      );
    },
  );
}

class BottomSheetIssue extends StatefulWidget {
  const BottomSheetIssue({super.key});

  @override
  State<BottomSheetIssue> createState() => _BottomSheetIssueState();
}

class _BottomSheetIssueState extends State<BottomSheetIssue> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: "Individual",
          groupValue: _type,
          onChanged: (value) {
            setState(() {
              _type = value!;
            });
          },
        ),
        Text(
          'Individual',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        Radio(
          value: "Group",
          groupValue: _type,
          onChanged: (value) {
            setState(() {
              _type = value!;
            });
          },
        ),
        Text(
          'Group',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
