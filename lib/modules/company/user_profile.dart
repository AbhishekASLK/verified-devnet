import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:verified_devnet/main.dart';
import 'package:verified_devnet/modules/dev/dev_home.dart';
import 'package:verified_devnet/modules/dev/dev_signin.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

String? userEmail = '';

void getUserEmail() async {
  List<Map<String, dynamic>> developersCredentialsList =
      await getDeveloperLoginInfo();
  for (var element in developersCredentialsList) {
    print(element['username']);
    print(globalLoggedUser);
    if (element['username'] == globalLoggedUser) {
      print('$globalLoggedUser 0)))))))))))))))');
      userEmail = element['email'];
      print(userEmail);
      // setState(() {});
    }
  }
}

class _UserProfileState extends State<UserProfile> {
  Future<void> launchEmailApp(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch email app';
    }
  }

  @override
  Widget build(BuildContext context) {
    print('build of userprofile');
    getUserEmail();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(33, 17, 52, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset('assets/others/rectangle.png'),
                Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 170,
                      ),
                      ClipOval(
                        child: Image.asset(
                          'assets/images/abhishek.jpeg',
                          height: 130,
                          width: 130,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'AbhishekASLK',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Frontend Developer',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '${projectCardList.length}',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Total Projects',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    String email = userEmail!;
                    launchEmailApp(email);
                  },
                  child: Container(
                    height: 40,
                    width: 125,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(36, 39, 96, 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          13,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Connect',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 125,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(36, 39, 96, 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        13,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Github',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(
                    'About',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(65, 34, 102, 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        20,
                      ),
                    ),
                  ),
                  child: Text(
                    "Passionate Frontend and UI Designer dedicated to crafting engaging digital experiences. Expertise in user-centric design, transforming concepts into visually stunning interfaces. Let's connect!",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
