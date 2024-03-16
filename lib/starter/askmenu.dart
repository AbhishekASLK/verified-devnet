import 'package:flutter/material.dart';
import 'package:verified_devnet/modules/admin/admin_login.dart';
import 'package:verified_devnet/modules/company/clogin.dart';
import 'package:verified_devnet/modules/dev/dev_signin.dart';
import 'package:google_fonts/google_fonts.dart';

class AskMenu extends StatefulWidget {
  const AskMenu({super.key});

  @override
  State<AskMenu> createState() => _AskMenuState();
}

class _AskMenuState extends State<AskMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(33, 17, 52, 1),
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/toplefmocs.png",
              ),
              Expanded(
                child: Image.asset(
                  "assets/images/toprigmocs.png",
                  fit: BoxFit.cover,
                  height: 300,
                  width: 800,
                ),
              ),
            ],
          ),
          Positioned.fill(
            bottom: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "assets/images/bottom.png",
                height: 310,
                width: 400,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            bottom: 0,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(42, 46, 68, 1)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const AdminLogin();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Admin",
                    style:
                        GoogleFonts.poppins(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Who are you?",
                  style: GoogleFonts.poppins(
                      fontSize: 40.33,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                Text(
                  "Choose your identity!",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(20),
                  height: 167,
                  width: 170,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(164, 49, 253, 1),
                          Color.fromRGBO(58, 73, 249, 1)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.1, 0.5]),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.business_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                      Text(
                        "Company",
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const ComLogin();
                              },
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 15),
                          height: 40,
                          width: 100,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(42, 46, 68, 1),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Login",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 18),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(20),
                  height: 167,
                  width: 170,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(164, 49, 253, 1),
                        Color.fromRGBO(58, 73, 249, 1)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.1, 0.5],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.developer_mode,
                        color: Colors.white,
                        size: 40,
                      ),
                      Text(
                        "Developer",
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const DevSignIn();
                              },
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 15),
                          height: 40,
                          width: 100,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(42, 46, 68, 1),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Login",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 18),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
