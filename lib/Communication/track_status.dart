import 'package:flutter/material.dart' hide Badge;
import 'package:badges/badges.dart';
import 'package:poc/welcome.dart';

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    Color appBarDividerColor = Colors.grey[300] ?? Colors.grey;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            bool isMobileView = constraints.maxWidth < 540;

            return Column(
              children: [
                Container(
                  height: 100,
                  color: Colors.white,
                  child: Column(
                    children: [
                      AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        leading: IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WelcomePage()),
                            );
                          },
                        ),
                        title: Text('Track Status',
                            style: TextStyle(fontSize: 24, color: Colors.blue)),
                        actions: [
                          if (!isMobileView)
                            CircleAvatar(
                              child: Text('T',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange)),
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
                            badgeContent: Text('2',
                                style: TextStyle(color: Colors.white)),
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
                // Main container content
                Container(
                  width: constraints.maxWidth *
                      0.9, // Adjusted to 90% of the screen width
                  decoration: BoxDecoration(
                    border: Border.all(color: appBarDividerColor, width: 1),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  margin: EdgeInsets.only(bottom: 0, top: 40),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Account Creation Label inside rectangle box
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: appBarDividerColor, width: 1),
                            borderRadius: BorderRadius.circular(0.0),
                            color: appBarDividerColor,
                          ),
                          child: Text('Account Creation',
                              style: TextStyle(fontSize: 16)),
                        ),
                        SizedBox(height: 10),
                        // Profile photo and status text
                        Row(
                          children: [
                            CircleAvatar(
                              child: Text('T',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              backgroundColor: Colors.orange,
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Test four latest ons',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('Submitted on 11/14/2023'),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        // Status text
                        Text('Status'),
                        SizedBox(height: 20),
                        // Application initiation and reference no. input box
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Application initiation with orange color
                            Row(
                              children: [
                                Icon(Icons.find_in_page, color: Colors.orange),
                                SizedBox(width: 10),
                                Text('Application Initiation',
                                    style: TextStyle(color: Colors.orange)),
                              ],
                            ),
                            // Reference no. input box
                            Container(
                              width: constraints.maxWidth * 0.3,
                              height: 40,
                              margin: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: appBarDividerColor, width: 1),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              child: Center(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Reference No.',
                                    hintStyle: TextStyle(
                                        color: Colors.blue[200], fontSize: 16),
                                    contentPadding: EdgeInsets.all(8),
                                    isDense: true,
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Resolve Dependency Button inside rectangular text box on the right side
                Container(
                  width: constraints.maxWidth * 0.9,
                  height: 60,
                  margin: EdgeInsets.only(top: 0),
                  decoration: BoxDecoration(
                    border: Border.all(color: appBarDividerColor, width: 1),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: Row(
                    mainAxisAlignment: isMobileView
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 200,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: appBarDividerColor, width: 1),
                          borderRadius: BorderRadius.circular(0.0),
                          color: Colors.grey,
                        ),
                        child: Text('RESOLVE DISCREPENCY',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
