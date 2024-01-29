import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:poc/Apply%20Now/account_details.dart';
import 'package:poc/Auth/login.dart';
import 'package:poc/Communication/mail_box.dart';
import 'package:poc/Communication/track_status.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late ImagePicker _imagePicker;
  late String lastLoginTime = "Last Login: 10:30 AM";

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  Future<void> _pickImage() async {
    final pickedFile = await _imagePicker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      print("Image picked: ${pickedFile.path}");
    } else {
      print("Image picker canceled");
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isSmallScreen = screenWidth < 600;
    double firstRowHeight =
        isSmallScreen ? 90 : MediaQuery.of(context).size.height / 3;

    return Scaffold(
      appBar: isSmallScreen
          ? AppBar(
              title: Text(
                "Welcome User!",
                style: TextStyle(fontSize: 16),
              ),
              backgroundColor: Colors.transparent,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 9, 0, 54),
                      Color.fromARGB(255, 245, 75, 28),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
              centerTitle: true,
            )
          : null,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isSmallScreen)
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 9, 0, 54),
                      Color.fromARGB(255, 245, 75, 28),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                width: screenWidth,
                height: firstRowHeight,
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (!isSmallScreen)
                      Image.asset(
                        'assets/images/logo.png',
                        width: 110,
                        height: 110,
                      ),
                    if (!isSmallScreen)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Welcome User!",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    if (!isSmallScreen)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            lastLoginTime,
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ],
                      )
                  ],
                ),
              ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!isSmallScreen)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 2.0,
                            color: Color.fromARGB(255, 129, 45, 39),
                          ),
                        ),
                        // child: FloatingActionButton(
                        //   onPressed: _pickImage,
                        //   tooltip: 'Upload',
                        //   child: Icon(
                        //     Icons.photo_camera,
                        //     color: Color.fromARGB(255, 106, 106, 106),
                        //     size: 40,
                        //   ),
                        //   backgroundColor: Colors.white,
                        // ),
                        child: IconButton(
                          onPressed: _pickImage,
                          icon: Icon(Icons.photo_camera),
                          iconSize: 40,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Test four",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                if (isSmallScreen)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 2.0,
                            color: Color.fromARGB(255, 129, 45, 39),
                          ),
                        ),
                        // child: FloatingActionButton(
                        //   onPressed: _pickImage,
                        //   tooltip: 'Upload',
                        //   child: Icon(
                        //     Icons.photo_camera,
                        //     color: Color.fromARGB(255, 106, 106, 106),
                        //     size: 40,
                        //   ),
                        //   backgroundColor: Colors.white,
                        // ),
                        child: IconButton(
                          onPressed: _pickImage,
                          icon: Icon(Icons.photo_camera),
                          iconSize: 40,
                        ),
                      ),
                    ],
                  ),
                SizedBox(
                  width: 30,
                ),
                if (isSmallScreen)
                  Column(
                    children: [
                      Text(
                        "Test Four",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        lastLoginTime,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  )
              ],
            ),
            SizedBox(height: 20),
            if (isSmallScreen)
              ListTile(
                title: Text("Account"),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HoverButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AccountDetails()),
                    );
                  },
                  icon: Icons.description,
                  label: "Apply Now",
                  color: Color.fromARGB(255, 99, 95, 95),
                  width: isSmallScreen ? screenWidth / 2 - 50 : 150,
                  height: 120,
                ),
                HoverButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => mailboxweb()),
                    );
                  },
                  icon: Icons.email,
                  label: "Secure Email",
                  color: Color.fromARGB(255, 99, 95, 95),
                  width: isSmallScreen ? screenWidth / 2 - 50 : 150,
                  height: 120,
                ),
                if (!isSmallScreen)
                  HoverButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyApplication()),
                      );
                    },
                    icon: Icons.track_changes,
                    label: "Track Status",
                    color: Color.fromARGB(255, 99, 95, 95),
                    width: isSmallScreen ? screenWidth / 2 - 50 : 150,
                    height: 120,
                  ),
                if (!isSmallScreen)
                  HoverButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResponsiveLayout(
                                  mobileWidget: MobileLayout(),
                                  webWidget: WebLayout(),
                                )),
                      );
                    },
                    icon: Icons.logout,
                    label: "Logout",
                    color: Colors.red,
                    width: isSmallScreen ? screenWidth / 2 - 50 : 150,
                    height: 120,
                  ),
              ],
            ),
            if (isSmallScreen) SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (isSmallScreen)
                  HoverButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyApplication()),
                      );
                    },
                    icon: Icons.track_changes,
                    label: "Track Status",
                    color: Color.fromARGB(255, 99, 95, 95),
                    width: isSmallScreen ? screenWidth / 2 - 50 : 150,
                    height: 120,
                  ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            if (isSmallScreen)
              ListTile(
                title: Text(
                  "OTHERS",
                ),
              ),
            if (isSmallScreen)
              ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    title: Text("Get in Touch"),
                    trailing: Icon(
                      Icons.groups,
                      color: Color.fromARGB(255, 146, 146, 146),
                    ),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    title: Text("Privacy"),
                    trailing: Icon(
                      Icons.lock,
                      color: Color.fromARGB(255, 146, 146, 146),
                    ),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    title: Text("Legal"),
                    trailing: Icon(
                      Icons.gavel,
                      color: Color.fromARGB(255, 146, 146, 146),
                    ),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    title: Text("Safe Banking"),
                    trailing: Icon(
                      Icons.account_balance,
                      color: Color.fromARGB(255, 146, 146, 146),
                    ),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    title: Text("ICICI Bank Canada Website"),
                    trailing: Icon(
                      Icons.language,
                      color: Color.fromARGB(255, 146, 146, 146),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            SizedBox(
              height: 20,
            ),
            if (isSmallScreen)
              ListTile(
                title: Text(
                  "Logout",
                  style: TextStyle(color: Colors.red),
                ),
                trailing: Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                onTap: () {
                  // Handle logout here
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResponsiveLayout(
                              mobileWidget: MobileLayout(),
                              webWidget: WebLayout(),
                            )),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}

class HoverButton extends StatefulWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String label;
  final Color color;
  final double width;
  final double height;

  const HoverButton({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.label,
    required this.color,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (_) {
              setState(() {
                isHovered = true;
              });
            },
            onExit: (_) {
              setState(() {
                isHovered = false;
              });
            },
            child: buildButton(),
          )
        : buildButton();
  }

  Widget buildButton() {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isHovered = false;
        });
      },
      onTapCancel: () {
        setState(() {
          isHovered = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isHovered ? Color.fromARGB(255, 245, 105, 17) : Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 2.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        width: widget.width,
        height: widget.height,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  widget.icon,
                  color: isHovered ? Colors.white : widget.color,
                ),
                onPressed: () {},
                iconSize: 40,
              ),
              SizedBox(height: 8),
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 14,
                  color: isHovered ? Colors.white : widget.color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
