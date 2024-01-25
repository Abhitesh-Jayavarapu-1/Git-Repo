// verification_page.dart

import 'package:flutter/material.dart' hide Badge;
import 'package:badges/badges.dart';
import 'package:poc/Verification/kyc.dart';
import 'package:poc/welcome.dart';

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: VerificationPage(),
//     );
//   }
// }

class VerificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color appBarDividerColor = Colors.grey[300] ?? Colors.grey;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobileView = constraints.maxWidth < 540;

          return Column(
            children: [
              // App Bar Container (Unmodified)
              Container(
                height: 100,
                color: Colors.white,
                child: Column(
                  children: [
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      leading: IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          // Add your menu functionality here
                        },
                      ),
                      title: Text('Verification',
                          style:
                              TextStyle(fontSize: 24, color: Colors.blue[900])),
                      actions: [
                        if (!isMobileView)
                          CircleAvatar(
                            child: Text('T',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            backgroundColor: Colors.orange,
                          ),
                        SizedBox(width: 10),
                        if (!isMobileView)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Test four'),
                              Text('last visited 11/01/2024 15:17 IST'),
                            ],
                          ),
                        SizedBox(width: 10),
                        // Cart with badge
                        Badge(
                          badgeContent:
                              Text('2', style: TextStyle(color: Colors.white)),
                          position: BadgePosition.topEnd(top: 0, end: 3),
                          child: IconButton(
                            icon: Icon(Icons.shopping_cart),
                            onPressed: () {
                              // Add your cart functionality here
                            },
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: Divider(
                        height: 8,
                        color: appBarDividerColor,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                      ),
                    ),
                  ],
                ),
              ),
              // New Content Container
              Container(
                // height: constraints.maxHeight * 0.79,
                width: constraints.maxWidth *
                    0.9, // Adjusted to 90% of the screen width
                // margin: EdgeInsets.only(bottom: 0, top: 20),
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: appBarDividerColor, width: 1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Digital Identity Verification',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 16),
                    Container(
                      height: 1,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: InputDecorator(
                              decoration: InputDecoration(
                                labelText: 'ID 1*',
                                border: OutlineInputBorder(),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Select',
                                      style: TextStyle(fontSize: 12)),
                                  Icon(Icons.arrow_drop_down),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                              'Please select the country from the below list'),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Text(
                              'Please select the province from the below list'),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: InputDecorator(
                                decoration: InputDecoration(
                                  labelText: 'Country*',
                                  border: OutlineInputBorder(),
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text('CANADA',
                                      style: TextStyle(fontSize: 12)),
                                )),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: 'Province*',
                              hintText: 'Enter Province',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: InputDecorator(
                              decoration: InputDecoration(
                                labelText: 'ID 2*',
                                border: OutlineInputBorder(),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Select',
                                      style: TextStyle(fontSize: 12)),
                                  Icon(Icons.arrow_drop_down),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                              'Please select the country from the below list'),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Text(
                              'Please select the province from the below list'),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: InputDecorator(
                                decoration: InputDecoration(
                                  labelText: 'Country*',
                                  border: OutlineInputBorder(),
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text('CANADA',
                                      style: TextStyle(fontSize: 12)),
                                )),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: 'Province*',
                              hintText: 'Enter Province',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      height: 1,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Back button logic
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => KYCApp()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                          child: Text('Back'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Next button logic
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WelcomePage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue[900],
                          ),
                          child: Text('Next',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
