// import 'dart:js';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:poc/Auth/password.dart';
import 'package:poc/Verification/verification.dart';
import 'package:poc/offline.dart';
// import 'package:poc/Verification/verification.dart';
// import 'package:icici/password_page.dart';

// void main() {
//   runApp(const KYCApp());
// }

class KYCApp extends StatelessWidget {
  const KYCApp({super.key});
  @override
  Widget build(BuildContext context) {
    bool isWeb = kIsWeb;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: isWeb
              ? Text(
                  "Verification",
                  style: TextStyle(
                    color: Color.fromARGB(255, 41, 56, 132),
                  ),
                )
              : Text(
                  "Verififcation",
                  style: TextStyle(color: Colors.white),
                ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: isWeb
                        ? [Colors.white, Colors.white]
                        : <Color>[
                            const Color.fromARGB(255, 107, 15, 9),
                            Colors.red
                          ])),
          ),
          actions: isWeb
              ? [
                  const Image(image: AssetImage('assets/images/pp.jpg')),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 6,
                      ),
                      Text('Test'),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'last visited 12/01/2024 17:57 IST',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_cart_outlined))
                ]
              : [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_cart_outlined))
                ],
        ),
        drawer: Drawer(),
        body: Builder(
          builder: (BuildContext context) {
            if (kIsWeb) {
              return WebLayout();
            } else {
              return MobileLayout();
            }
          },
        ),
      ),
    );
  }
}

mixin ButtonFunctions {
  void startButton(BuildContext context) {
    Navigator.push(
      context as BuildContext,
      MaterialPageRoute(builder: (context) => VerificationPage()),
    );
  }

  void skipButton(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OfflinePage()),
    );
  }

  void backButton(BuildContext context) {
    Navigator.push(
      context as BuildContext,
      MaterialPageRoute(builder: (context) => MyHomePage()),
    );
    // Navigator.pop(context);
  }

  void continueButton() {}
}

class MobileLayout extends StatefulWidget {
  @override
  _MobileLayoutState createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> with ButtonFunctions {
  int currentScreenIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Circle Icons connected by lines
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      circleIcon(
                          Icons.account_balance_outlined,
                          // "Account Details",
                          0,
                          currentScreenIndex),
                      Expanded(child: Divider(color: Colors.orange)),
                      circleIcon(
                          Icons.account_circle_outlined,
                          // "Personal Details",
                          1,
                          currentScreenIndex),
                      Expanded(child: Divider(color: Colors.orange)),
                      circleIcon(
                          Icons.rate_review,
                          //  "Review",
                          2,
                          currentScreenIndex),
                      Expanded(child: Divider(color: Colors.orange)),
                      // circleIcon(Icons.outlined_flag_outlined, "KYC", 3,
                      // currentScreenIndex),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            child: Container(
                              width: 50,
                              // color: Color.fromARGB(255, 41, 56, 132),
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 41, 56, 132),
                              ),
                              child: Icon(Icons.outlined_flag_outlined,
                                  size: 30, color: Colors.grey),
                            ),
                          ),
                          // SizedBox(height: 5),
                          // Text(
                          //   "KYC",
                          //   style: TextStyle(
                          //     fontSize: 12,
                          //     // color: Color.fromARGB(255, 41, 56, 132),
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                  // SizedBox(height: 50),
                  // Expanded(child: Container()),
                ],
              ),
            ),
            Container(
              color: Colors.grey.shade300,
              width: double.maxFinite,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "Identity Verification",
                  style: TextStyle(
                      color: Color.fromARGB(255, 41, 56, 132),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    "Please follow the instructions carefully and complete your ONLINE VERIFICATON.\nPlease click the \"Start\" button to complete identity verification.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16),
                  ),
                  Text(
                    "The verification process is designed to confirm your identity and you will be redirected to ure third-party service provider for KYC Verification and Identification",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Test Test",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          startButton(context);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: double.minPositive,
                              horizontal: double.minPositive),
                          // minimumSize: Size(double.infinity, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          backgroundColor: Color.fromARGB(255, 41, 56, 132),
                        ),
                        child: Text(
                          'Start',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Alternatively, if you are unable to complete online identity verification or prefer in-person verification, you can skip the online identity verification by clicking \"Skip\" button and provide information by following the instruction and completing the steps on the next page to visit nearest ICICI Bank branch or Canada Post location for in-person identity verification.",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          skipButton(context);
                        },
                        child: Text(
                          "Skip",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: double.minPositive,
                              horizontal: double.minPositive),
                          // minimumSize: Size(double.infinity, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          backgroundColor: Color.fromARGB(255, 41, 56, 132),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            Container(
              child: Container(
                margin: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                        onPressed: () {
                          backButton(context);
                        },
                        child: Text(
                          "                 Back                 ",
                          style: TextStyle(
                              color: Color.fromARGB(255, 41, 56, 132)),
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: double.minPositive,
                              vertical: double.minPositive),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        )),
                    FilledButton(
                      onPressed: () {
                        continueButton();
                      },
                      child: Text(
                        "         Continue         ",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: FilledButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              vertical: double.minPositive,
                              horizontal: double.minPositive),
                          backgroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget circleIcon(
    IconData icon,
    // String label,
    int iconIndex,
    int currentScreenIndex) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: 50,
        height: 50,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.orange),
              ),
              child: Icon(icon, size: 30, color: Colors.orange),
            ),
            if (iconIndex <= currentScreenIndex)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                    border: Border.all(color: Colors.green),
                  ),
                  child: Icon(Icons.check, color: Colors.white, size: 15),
                ),
              ),
          ],
        ),
      ),
      // SizedBox(height: 5),
      // Text(
      //   label,
      //   style: TextStyle(fontSize: 12),
      // ),
    ],
  );
}

class WebLayout extends StatefulWidget {
  @override
  _WebLayoutState createState() => _WebLayoutState();
}

class _WebLayoutState extends State<WebLayout> with ButtonFunctions {
  int currentScreenIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // Adjust the padding based on the screen width
          double padding = constraints.maxWidth > 600 ? 100 : 20;
          if (constraints.maxWidth < 600) {
            return MobileLayout();
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(20),
                    width: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Circle Icons connected by lines
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            circleIcon(
                                Icons.account_balance_outlined,
                                // "Account Details",
                                0,
                                currentScreenIndex),
                            Expanded(child: Divider(color: Colors.orange)),
                            circleIcon(
                                Icons.account_circle_outlined,
                                // "Personal Details",
                                1,
                                currentScreenIndex),
                            Expanded(child: Divider(color: Colors.orange)),
                            circleIcon(
                                Icons.rate_review
                                // , "Review"
                                ,
                                2,
                                currentScreenIndex),
                            Expanded(child: Divider(color: Colors.orange)),
                            // circleIcon(Icons.outlined_flag_outlined, "KYC", 3,
                            // currentScreenIndex),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  child: Container(
                                    width: 50,
                                    // color: Color.fromARGB(255, 41, 56, 132),
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 41, 56, 132),
                                    ),
                                    child: Icon(Icons.outlined_flag_outlined,
                                        size: 30, color: Colors.grey),
                                  ),
                                ),
                                // SizedBox(height: 5),
                                // Text(
                                //   "KYC",
                                //   style: TextStyle(
                                //     fontSize: 12,
                                //     // color: Color.fromARGB(255, 41, 56, 132),
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),
                        // SizedBox(height: 50),
                        // Expanded(child: Container()),
                      ],
                    ),
                  ),
                  // Expanded(child: Container()),
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      // color: Colors.green,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 4,
                          offset: Offset(4, 8), // Shadow position
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: double.maxFinite,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 249, 249, 249),
                              borderRadius: BorderRadius.circular(5),
                              border: Border(
                                  bottom: BorderSide(
                                      color:
                                          Color.fromARGB(255, 231, 220, 220)))),
                          // margin: EdgeInsets.all(10),
                          child: Text(
                            "Identity Verification",
                            style: TextStyle(
                                color: Color.fromARGB(255, 41, 56, 132),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          // margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Text(
                                "Please follow the instructions carefully and complete your ONLINE VERIFICATON.Please click the \"Start\" button to complete identity verification.",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 16),
                              ),
                              Text(
                                "The verification process is designed to confirm your identity and you will be redirected to ure third-party service provider for KYC Verification and Identification",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Test Test",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      startButton(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                          vertical: double.minPositive,
                                          horizontal: double.minPositive),
                                      // minimumSize: Size(double.infinity, 0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      backgroundColor:
                                          Color.fromARGB(255, 41, 56, 132),
                                    ),
                                    child: Text(
                                      'Start',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Alternatively, if you are unable to complete online identity verification or prefer in-person verification, you can skip the online identity verification by clicking \"Skip\" button and provide information by following the instruction and completing the steps on the next page to visit nearest ICICI Bank branch or Canada Post location for in-person identity verification.",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      skipButton(context);
                                    },
                                    child: Text(
                                      "Skip",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                          vertical: double.minPositive,
                                          horizontal: double.minPositive),
                                      // minimumSize: Size(double.infinity, 0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      backgroundColor:
                                          Color.fromARGB(255, 41, 56, 132),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border: Border(
                                    top: BorderSide(
                                        color: Color.fromARGB(
                                            255, 231, 220, 220)))),
                            // margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OutlinedButton(
                                    onPressed: () {
                                      backButton(context);
                                    },
                                    child: Text(
                                      "                 Back                 ",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 41, 56, 132)),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: double.minPositive,
                                          vertical: double.minPositive),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    )),
                                FilledButton(
                                  onPressed: () {
                                    continueButton();
                                  },
                                  child: Text(
                                    "         Continue         ",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: FilledButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                          vertical: double.minPositive,
                                          horizontal: double.minPositive),
                                      backgroundColor: Colors.grey,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
