import 'package:flutter/material.dart';
import 'package:verified_devnet/modules/admin/admin_login.dart';
import 'package:verified_devnet/modules/company/clogin.dart';
import 'package:verified_devnet/modules/dev/dev_signin.dart';

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
                  child: const Text(
                    "Admin",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 200, left: 20, right: 20),
              child: Column(
                children: [
                  const Text(
                    "Who are you?",
                    style: TextStyle(
                        fontSize: 40.33,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  const Text(
                    "Choose your identity!",
                    style: TextStyle(
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
                        stops: [0.1, 0.5],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(
                          Icons.business_outlined,
                          color: Colors.white,
                          size: 40,
                        ),
                        const Text(
                          "Company",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(42, 46, 68, 1),
                              fixedSize: const Size.fromWidth(120)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const ComLogin();
                                },
                              ),
                            );
                          },
                          child: const Row(
                            children: [
                              Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
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
                        const Text(
                          "Developer",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(42, 46, 68, 1),
                            fixedSize: const Size.fromWidth(120),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const DevSignIn();
                                },
                              ),
                            );
                          },
                          child: const Row(
                            children: [
                              Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
