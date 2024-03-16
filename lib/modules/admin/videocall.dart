import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verified_devnet/main.dart';
import 'package:verified_devnet/modules/admin/home_admin.dart';
import 'package:verified_devnet/modules/dev/dev_home.dart';

class Videocall extends StatefulWidget {
  final ProjectCard? obj;
  const Videocall({this.obj, super.key});

  @override
  State<Videocall> createState() => _VideocallState();
}

class _VideocallState extends State<Videocall> {
  @override
  Widget build(BuildContext context) {
    print(widget.obj!.projectId);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/elon.png",
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name Surname",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "20.10",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w200,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 60,
                ),
                // Adjust the spacing between name and image
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset(
                    "assets/images/akshay-sir.png",
                    // height: 300,
                    // width: 150,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20, // Adjust this value according to your needs
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Circular container 1
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        updateFlagToList(widget.obj!);
                        setState(() {});
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return AdminHome();
                            },
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        height: 30,
                        width: 80,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color.fromARGB(255, 36, 190, 41),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Verify",
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                            const Icon(
                              Icons.arrow_outward,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.mic_off,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

                // Circular container 2
                Container(
                  margin: const EdgeInsets.only(top: 45),
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.cameraswitch,
                    color: Colors.white,
                  ),
                ),

                // Circular container 3
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      height: 30,
                      width: 80,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color.fromARGB(255, 243, 10, 10)),
                      child: Row(
                        children: [
                          Text(
                            "Reject",
                            style: GoogleFonts.poppins(color: Colors.white),
                          ),
                          const Icon(
                            Icons.arrow_outward,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void updateFlagToList(ProjectCard obj) async {
    print('${obj.projectId} ***************');
    ProjectCard newObj = ProjectCard(
      projectId: obj.projectId,
      developerName: obj.developerName,
      projectName: obj.projectName,
      timeRequired: obj.timeRequired,
      gitLink: obj.gitLink,
      techStack: obj.techStack,
      type: obj.type,
      status: 'Verified',
    );
    await updateFlag(newObj);
    projectCardList = await getProjectCards();
    setState(() {});
    print(projectCardList[0].status);
  }
}
