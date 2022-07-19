import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app_01/constants.dart';
import 'package:grocery_app_01/pages/mainPage.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20),
          ClipPath(
            clipper: ClipPathOnBoard(),
            child: Container(
              color: backgroundOnboard,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6 - 20,
              child: Image.asset(
                'assets/woman_vegetable.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Buy Groceries\nEasily With Us',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Listen podcast and open your\nworld with this application',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                ),
                FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainPage()));
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 40),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: kPrimaryGradientColor),
                        child: Text(
                          'Get Started',
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: Colors.white),
                        )))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ClipPathOnBoard extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 50, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
