import 'package:flutter/material.dart';
import 'package:poc/Verification/kyc.dart';
import 'package:responsive_builder/responsive_builder.dart';

extension AppBarShadowExtension on PreferredSizeWidget {
  PreferredSizeWidget withBottomShadow() {
    return _AppBarWithShadow(child: this);
  }
}

class _AppBarWithShadow extends StatelessWidget implements PreferredSizeWidget {
  final PreferredSizeWidget child;

  const _AppBarWithShadow({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: child,
    );
  }

  @override
  Size get preferredSize => child.preferredSize;
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          bool isMobile = sizingInformation.isMobile;
          // Determine the layout based on the screen size
          // if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return MobileLayout(isMobile: isMobile);
          // } else {
          // return WebLayout();
          // }
        },
      ),
    );
  }
}

class MobileLayout extends StatefulWidget {
  final bool isMobile;

  MobileLayout({required this.isMobile});

  @override
  _MobileLayoutState createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  bool showWarning = true;
  TextEditingController passwordController = TextEditingController();
  TextEditingController reEnterPasswordController = TextEditingController();
  int currentScreenIndex = 1;

  String _formatLastSeen(DateTime lastSeen) {
    // Format the last seen time according to your needs
    String formattedDate = "${lastSeen.day}/${lastSeen.month}/${lastSeen.year}";
    String formattedTime = "${lastSeen.hour}:${lastSeen.minute}";
    return "$formattedDate at $formattedTime";
  }

  Widget circleIcon(IconData icon, int iconIndex, int currentScreenIndex) {
    return Container(
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
              border: Border.all(
                  color: iconIndex < currentScreenIndex
                      ? Colors.orange
                      : Colors.indigo.shade900),
            ),
            child: Icon(icon,
                size: 30,
                color: iconIndex < currentScreenIndex
                    ? Colors.orange
                    : Colors.indigo.shade900),
          ),
          if (iconIndex < currentScreenIndex)
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
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    reEnterPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    double cardWidth = screenWidth * 0.6; // 70% of viewing width
    // double cardHeight = screenHeight * 0.7;

    return Scaffold(
      appBar: widget.isMobile
          ? AppBar(
              backgroundColor: const Color.fromARGB(255, 171, 78, 71),
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.white,
                      ),
                      IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          // Handle menu button press
                        },
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Transform.translate(
                      offset: Offset(-20.0, 0.0),
                      child: (Text(
                        'Personal Details',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ))),
                  Stack(
                    children: [
                      IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {
                          // Handle cart button press
                        },
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding:
                              EdgeInsets.all(4.0), // Adjust padding as needed
                          margin: EdgeInsets.only(
                              right: 4.0), // Adjust margin as needed
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Text(
                            '2', // Replace this with the actual count from your cart
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0, // Adjust the font size as needed
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          : AppBar(
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      print('Menu Button Clicked');
                    },
                  ),
                  Text('Personal Details'),
                ],
              ),
              actions: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.red,
                          width: 2.0,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 20.0,
                        backgroundImage:
                            NetworkImage('https://placekitten.com/100/100'),
                      ),
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Test'),
                    Text(
                        'Last seen ${_formatLastSeen(DateTime.now().subtract(Duration(hours: 3)))}'),
                  ],
                ),
                SizedBox(width: 10),
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        print('Cart Button Clicked');
                      },
                    ),
                    CircleAvatar(
                      radius: 10.0,
                      backgroundColor: Colors.red,
                      child: Text(
                        '3',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
              ],
            ).withBottomShadow(),
      body: widget.isMobile
          ? SingleChildScrollView(
              child: Material(
                  elevation: 18, // Adjust the elevation as needed
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        // Circle Icons connected by lines
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  height: 70,
                                  margin: EdgeInsets.only(top: 5.0),
                                  child: Stack(
                                    children: [
                                      circleIcon(Icons.touch_app, 0,
                                          currentScreenIndex),
                                      Positioned(
                                          bottom: 0,
                                          child: Text(
                                            'Account',
                                            style: TextStyle(fontSize: 12),
                                          ))
                                    ],
                                  )),
                              Container(
                                height:
                                    8, // Set the desired width (thickness) of the Divider
                                width: 100,
                                child: Divider(
                                  color: Colors.orange,
                                ),
                              ),
                              Container(
                                  height: 70,
                                  margin: EdgeInsets.only(top: 5.0),
                                  child: Stack(
                                    children: [
                                      circleIcon(
                                          Icons.person, 1, currentScreenIndex),
                                      Positioned(
                                        bottom: 0,
                                        child: Text(
                                          'Personal Details',
                                          style: TextStyle(fontSize: 12),
                                          softWrap: true,
                                        ),
                                      )
                                    ],
                                  )),
                            ]),

                        Container(
                          margin: EdgeInsets.symmetric(vertical: 16.0),
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: showWarning
                                ? Color.fromARGB(255, 245, 242, 218)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Visibility(
                                  visible: showWarning,
                                  child: Text(
                                    'Set your password to access your account online or through i-mobile app',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange),
                                    softWrap: true, // Enable word wrap
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: showWarning
                                    ? Icon(Icons.arrow_upward)
                                    : Icon(Icons.arrow_downward),
                                onPressed: () {
                                  setState(() {
                                    showWarning = !showWarning;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                              left: 16.0,
                              right: 16.0,
                              bottom: 16.0,
                            ), // Adjust padding as needed
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Password',
                                          style: TextStyle(fontSize: 18))),
                                  InputBox(
                                    controller: passwordController,
                                    icon: Icons.lock,
                                    hintText: 'Enter your password',
                                    isPassword: true,
                                  ),
                                  SizedBox(height: 10),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Password Requirements',
                                      )),
                                  SizedBox(height: 10),
                                  BulletList([
                                    'Must contain an uppercase character',
                                    'Must contain a lowercase character',
                                    'Must contain a numeric character',
                                    'Must contain a non-alphanumeric character',
                                    'Must be at least 8 characters',
                                    'Cannot contain an email address'
                                  ]),
                                  SizedBox(height: 10),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Confirm Password',
                                          style: TextStyle(fontSize: 18))),
                                  InputBox(
                                      controller: reEnterPasswordController,
                                      icon: Icons.lock,
                                      hintText: 'Confirm your password',
                                      otherController: passwordController),
                                  SizedBox(height: 10),
                                  Text(
                                    'Please allow one business day for the Internet Banking to be set up after your account has been activated. If you are having trouble accessing your online banking, you can always reset your password',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(164, 55, 90, 187)),
                                  ),
                                  SizedBox(height: 10),
                                ])),
                      ],
                    ),
                  )),
            )
          : Stack(
              children: [
                Positioned(
                  left: 5,
                  top: 180,
                  child: Container(
                    width: 200.0, // Set your desired width
                    height: 400.0, // Set your desired height
                    decoration: BoxDecoration(
                      color: Colors
                          .transparent, // Set transparent background color
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0, // Set border width to 2px
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(height: 10),
                    // Circle Icons connected by lines
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Container(
                          height: 70,
                          margin: EdgeInsets.only(top: 5.0),
                          child: Stack(
                            children: [
                              circleIcon(
                                  Icons.touch_app, 0, currentScreenIndex),
                              Positioned(
                                  bottom: 0,
                                  child: Text(
                                    'Account',
                                    style: TextStyle(fontSize: 12),
                                  ))
                            ],
                          )),
                      Container(
                        height:
                            8, // Set the desired width (thickness) of the Divider
                        width: 100,
                        child: Divider(
                          color: Colors.orange,
                        ),
                      ),
                      Container(
                          height: 70,
                          margin: EdgeInsets.only(top: 5.0),
                          child: Stack(
                            children: [
                              circleIcon(Icons.person, 1, currentScreenIndex),
                              Positioned(
                                bottom: 0,
                                child: Text(
                                  'Personal Details',
                                  style: TextStyle(fontSize: 12),
                                  softWrap: true,
                                ),
                              )
                            ],
                          )),
                    ]),
                    SizedBox(height: 10),

                    Container(
                      height: 500,
                      width: cardWidth,
                      margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width *
                              0.2), // Adjust the margin as needed
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset:
                                Offset(-3.0, 0.0), // Move 4 pixels to the left
                            blurRadius: 3.0,
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset:
                                Offset(3.0, 0.0), // Move 4 pixels to the right
                            blurRadius: 3.0,
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0.0, 8.0), // Move 4 pixels down
                            blurRadius: 8.0,
                          ),
                        ],
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                              4.0), // Set border radius to match the Card
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                color: Colors.grey[200],
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    'Set your password to access your account online or through the i-mobile app',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                  child: Padding(
                                padding: const EdgeInsets.all(35.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            controller: passwordController,
                                            obscureText: true,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: 'Password',
                                            ),
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            validator: (value) {
                                              if (value == '') return null;
                                              // Comprehensive validation pattern using a regular expression
                                              final passwordRegex = RegExp(
                                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                                              );

                                              if (!passwordRegex
                                                  .hasMatch(value!)) {
                                                return 'Password must meet the following requirements:';
                                              }

                                              // Additional check for email address pattern
                                              final emailRegex =
                                                  RegExp(r'\S+@\S+\.\S+');
                                              if (emailRegex.hasMatch(value)) {
                                                return 'Password cannot contain an email address';
                                              }

                                              return null; // Validation passes
                                            },
                                          ),
                                        ),
                                        SizedBox(width: 16.0),
                                        Expanded(
                                          child: TextFormField(
                                            controller:
                                                reEnterPasswordController,
                                            obscureText: true,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: 'Confirm Password',
                                            ),
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            validator: (value) {
                                              if (value == '') return null;

                                              if (value !=
                                                  passwordController.text)
                                                return 'Password and Confirm Password should match';

                                              return null; // Validation passes
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 24.0),
                                    Text(
                                      'Password Requirements',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    SizedBox(height: 10),
                                    BulletList([
                                      'Must contain an uppercase character',
                                      'Must contain a lowercase character',
                                      'Must contain a numeric character',
                                      'Must contain a non-alphanumeric character',
                                      'Must be at least 8 characters',
                                      'Cannot contain an email address'
                                    ]),
                                    SizedBox(height: 20.0),
                                    Text(
                                      'Please allow one business day for internet banking to be set up after your account has been activated. If you are having trouble accessing your online banking, you can always reset your password',
                                      style: TextStyle(
                                        color: Color.fromARGB(244, 55, 90, 187),
                                        fontSize: 17.0,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      width: cardWidth,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset:
                                Offset(-4.0, 0.0), // Move 4 pixels to the left
                            blurRadius: 3.0,
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset:
                                Offset(4.0, 0.0), // Move 4 pixels to the right
                            blurRadius: 3.0,
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0.0, 1.0), // Move 4 pixels down
                            blurRadius: 1.0,
                          ),
                        ],
                        color: Colors.white, // Set background color to white
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(
                              top: 7.0, left: 15.0, right: 15.0, bottom: 7.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // print('Back Button Clicked');
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    side: BorderSide(
                                        color: Color.fromARGB(255, 22, 39, 151),
                                        width: 1.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          5.0), // Set border radius to 0
                                    ),
                                    minimumSize:
                                        Size(cardWidth / 9 - 7.5, 30.0)),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(
                                    'Back',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color:
                                            Color.fromARGB(255, 22, 39, 151)),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // print('Continue Button Clicked');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => KYCApp()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Color.fromARGB(164, 55, 90, 187),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          5.0), // Set border radius to 0
                                    ),
                                    minimumSize:
                                        Size(cardWidth / 9 - 7.5, 30.0)),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(
                                    'Continue',
                                    style: TextStyle(
                                        fontSize: 16.0, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    )
                  ]),
                ), // Add other widgets as needed
              ],
            ),
      bottomNavigationBar: widget.isMobile
          ? Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 180, // Increase the width of the button
                    height: 40, // Increase the height of the button
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle back button press
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          side: BorderSide(
                              color: Color.fromARGB(255, 22, 39, 151),
                              width: 1.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                5.0), // Set border radius to 0
                          )),
                      child: Text(
                        'Back',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0), // Add space between buttons
                  Container(
                    width: 180, // Increase the width of the button
                    height: 40, // Increase the height of the button
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle continue button press
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => KYCApp()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(164, 55, 90, 187),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: Text(
                        'Continue',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : null,
    );
  }
}

class InputBox extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String hintText;
  final bool isPassword;
  final TextEditingController? otherController;

  InputBox(
      {required this.controller,
      required this.icon,
      required this.hintText,
      this.isPassword = false,
      this.otherController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == '') return null;

                        if (isPassword) {
                          // Comprehensive validation pattern using a regular expression
                          final passwordRegex = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                          );

                          if (!passwordRegex.hasMatch(value!)) {
                            return 'Password must meet the following requirements:';
                          }

                          // Additional check for email address pattern
                          final emailRegex = RegExp(r'\S+@\S+\.\S+');
                          if (emailRegex.hasMatch(value)) {
                            return 'Password cannot contain an email address';
                          }
                        } else {
                          if (value != otherController?.text)
                            return 'Password and Confirm Password should match';
                        }

                        return null; // Validation passes
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Icon(icon),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BulletList extends StatelessWidget {
  final List<String> items;
  final double iconSize;

  BulletList(this.items, {this.iconSize = 24});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) => BulletListItem(item, iconSize)).toList(),
    );
  }
}

class BulletListItem extends StatelessWidget {
  final String item;
  final double iconSize;

  BulletListItem(this.item, this.iconSize);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: iconSize,
            height: iconSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.red),
            ),
            child: Center(
              child: Icon(
                Icons.close,
                size: iconSize * 0.6,
                color: Colors.red,
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              item,
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}

// class WebLayout extends StatefulWidget {
//   @override
//   _WebLayoutState createState() => _WebLayoutState();
// }

// class _WebLayoutState extends State<WebLayout> {
//   String _formatLastSeen(DateTime lastSeen) {
//     // Format the last seen time according to your needs
//     String formattedDate = "${lastSeen.day}/${lastSeen.month}/${lastSeen.year}";
//     String formattedTime = "${lastSeen.hour}:${lastSeen.minute}";
//     return "$formattedDate at $formattedTime";
//   }

//   TextEditingController _passwordController = TextEditingController();
//   TextEditingController _confirmPasswordController = TextEditingController();

//   @override
//   void dispose() {
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//     double cardWidth = screenWidth * 0.8; // 70% of viewing width
//     double cardHeight = screenHeight * 0.7;
//     // double cardWidth = screenWidth; // 70% of viewing width

//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       appBar: AppBar(
//         title: Row(
//           children: [
//             IconButton(
//               icon: Icon(Icons.menu),
//               onPressed: () {
//                 print('Menu Button Clicked');
//               },
//             ),
//             Text('Personal Details'),
//           ],
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CircleAvatar(
//               radius: 20.0,
//               backgroundImage: NetworkImage('https://placekitten.com/100/100'),
//             ),
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Transform.translate(
//                   offset: Offset(-120.0, 0.0), child: (Text('John Doe'))),
//               Text(
//                   'Last seen ${_formatLastSeen(DateTime.now().subtract(Duration(hours: 3)))}'),
//             ],
//           ),
//           SizedBox(width: 10),
//           Stack(
//             alignment: Alignment.topRight,
//             children: [
//               IconButton(
//                 icon: Icon(Icons.shopping_cart),
//                 onPressed: () {
//                   print('Cart Button Clicked');
//                 },
//               ),
//               CircleAvatar(
//                 radius: 10.0,
//                 backgroundColor: Colors.red,
//                 child: Text(
//                   '3',
//                   style: TextStyle(fontSize: 12.0),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(width: 10),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Center(
//               child: Container(
//                 width: cardWidth,
//                 height: cardHeight,
//                 child: Card(
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         Text(
//                           'Set your password to access your account online or through the i-mobile app',
//                           style: TextStyle(
//                             fontSize: 18.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 20.0),
//                         Expanded(
//                           child: SingleChildScrollView(
//                             child: Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     Expanded(
//                                       child: TextFormField(
//                                         controller: _passwordController,
//                                         obscureText: true,
//                                         decoration: InputDecoration(
//                                           border: OutlineInputBorder(),
//                                           labelText: 'Password',
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(width: 16.0),
//                                     Expanded(
//                                       child: TextFormField(
//                                         controller: _confirmPasswordController,
//                                         obscureText: true,
//                                         decoration: InputDecoration(
//                                           border: OutlineInputBorder(),
//                                           labelText: 'Confirm Password',
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(height: 24.0),
//                                 Transform.translate(
//                                   offset: Offset(-510.0, 0.0),
//                                   child: Text('Password Requirements'),
//                                 ),
//                                 SizedBox(height: 10),
//                                 BulletList([
//                                   'Must contain an uppercase character',
//                                   'Must contain a lowercase character',
//                                   'Must contain a numeric character',
//                                   'Must contain a non-alphanumeric character',
//                                   'Must be at least 8 characters',
//                                   'Cannot contain an email address'
//                                 ]),
//                                 SizedBox(height: 20.0),
//                                 Text(
//                                   'Please allow one business day for internet banking to be set up after your account has been activated. If you are having trouble accessing your online banking, you can always reset your password',
//                                   style: TextStyle(
//                                     color: Colors.blue,
//                                     fontSize: 20.0,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 10.0),
//           Transform.translate(
//               offset: Offset(0.0, -50.0),
//               child: (Padding(
//                 padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.15),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     ElevatedButton(
//                       onPressed: () {
//                         print('Back Button Clicked');
//                       },
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(12.0),
//                         child: Text('Back', style: TextStyle(fontSize: 16.0)),
//                       ),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => RegistrationPage()));

//                         print('Continue Button Clicked');
//                         print('Password: ${_passwordController.text}');
//                         print(
//                             'Confirm Password: ${_confirmPasswordController.text}');
//                       },
//                       style: ElevatedButton.styleFrom(
//                         primary: Color.fromARGB(255, 27, 62, 234),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(12.0),
//                         child: Text('Continue',
//                             style:
//                                 TextStyle(fontSize: 16.0, color: Colors.white)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ))),
//         ],
//       ),
//     );
//   }
// }
