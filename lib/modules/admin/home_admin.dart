import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verified_devnet/modules/admin/videocall.dart';
import 'package:verified_devnet/modules/dev/dev_home.dart';

// Future getProjectCards() async {
//   List<Map<String, dynamic>> cardsListOfMap =
//       await database.query('projectCartTable');
//   return List.generate(
//     cardsListOfMap.length,
//     (index) {
//       return ProjectCard(
//         developerName: users[index]['developerName'],
//         projectName: cardsListOfMap[index]['projectName'],
//         timeRequired: cardsListOfMap[index]['timeRequired'],
//         gitLink: cardsListOfMap[index]['gitLink'],
//         techStack: cardsListOfMap[index]['techStack'],
//         type: cardsListOfMap[index]['type'],
//       );
//     },
//   );
// }

// List projectCardList = [];

// void fetchCard(setState) async {
//   setState(() {});
//   projectCardList = await getProjectCards();
// }

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  void initState() {
    super.initState();
    fetchList();
  }

  List projectCardList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(33, 17, 52, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(33, 17, 52, 1),
        leading: ClipOval(
          child: Image.asset(
            'assets/images/admin-image.jpg',
          ),
        ),
        title: Text(
          'admin',
          style: GoogleFonts.poppins(
            color: const Color.fromRGBO(235, 235, 244, 0.8),
            fontSize: 16,
          ),
        ),
        actions: const [
          Icon(
            Icons.logout,
            color: Color.fromRGBO(235, 235, 244, 0.8),
          ),
          SizedBox(
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
            height: 15,
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
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(152, 83, 206, 1),
                          Color.fromRGBO(50, 65, 224, 1)
                        ],
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          20,
                        ),
                      ),
                    ),
                    width: 350,
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Column(
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
                                  // ========= Name ============
                                  Row(
                                    children: [
                                      Text(
                                        'Developer: ',
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        projectCardList[index].developerName,
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
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
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        child: Center(
                                          child: Row(
                                            children: [
                                              Text(
                                                projectCardList[index].status,
                                                style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return Videocall(
                                                  obj: projectCardList[index],
                                                );
                                              },
                                            ),
                                          );
                                        },
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                20,
                                              ),
                                            ),
                                            color:
                                                Color.fromRGBO(42, 46, 68, 1),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                            ),
                                            child: Center(
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Verify it',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  const Icon(
                                                    Icons.forward,
                                                    color: Colors.yellow,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              ClipOval(
                                child: Image.asset(
                                  'assets/images/abhishek.jpeg',
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void fetchList() async {
    projectCardList = await getProjectCards();
  }
}
