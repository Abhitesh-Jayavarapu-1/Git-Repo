import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:poc/Auth/instruction.dart';
import 'package:poc/User.dart';
import 'package:poc/api_service.dart';
import 'package:poc/welcome.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webWidget;
  final Widget mobileWidget;

  ResponsiveLayout({required this.webWidget, required this.mobileWidget});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWeb = kIsWeb;
        bool isMobile = constraints.maxWidth <= 600;
        if (isWeb && !isMobile) {
          return webWidget;
        } else {
          return mobileWidget;
        }
      },
    );
  }
}

mixin ButtonFunctions {
  void loginButton(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WelcomePage()),
    );
  }

  void continueButtonSignUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InstructionPage()),
    );
  }
}

class MobileLayout extends StatefulWidget {
  @override
  _MobileLayoutState createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> with ButtonFunctions {
  bool switchValue = false;
  User user = User("", "");
  final _loginKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late Widget containerContents;
  Future save() async {
    try {
      bool status =
          await ApiService.login(emailController.text, passwordController.text);
      if (status) {
        loginButton(context);
      } else {
        print("Request Failed due to invalid credentials");
      }
    } catch (error) {
      print("Error: $error");
    }
  }

  double calculateContainerHeight() {
    if (switchValue) {
      return 600.0;
    } else {
      return 500.0;
    }
  }

  bool buttonVisible = true;
  @override
  void initState() {
    super.initState();
    containerContents = Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        const Text(
          'Enter Your Details Below',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: Column(children: [
            Container(
              height: 45,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5)),
              child: TextFormField(
                controller: emailController,
                onChanged: (val) {
                  user.email = val;
                },
                // validator: (value) {
                //   if (value.toString().isEmpty) {
                //     return "Email can no be empty!";
                //   }
                //   return null;
                // },
                decoration: const InputDecoration(
                    icon: Icon(Icons.person_sharp),
                    border: InputBorder.none,
                    hintText: 'Email'),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Container(
              height: 45,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5)),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                obscuringCharacter: ".",
                onChanged: (val) {
                  user.password = val;
                },
                // validator: (value) {
                //   if (value.toString().isEmpty) {
                //     return "Password can not be empty!";
                //   }
                //   return null;
                // },
                decoration: const InputDecoration(
                    icon: Icon(Icons.key_rounded),
                    border: InputBorder.none,
                    hintText: '......'),
              ),
            ),
          ]),
        ),
        const SizedBox(
          height: 30,
        ),
        MaterialButton(
          onPressed: () {
            // if (_loginKey.currentState!.validate()) {
            save();
            // }
          },
          textColor: Colors.white,
          minWidth: 350,
          height: 45,
          color: Colors.indigo[900],
          child: const Text('Login'),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  void handleButtonClick() {
    setState(() {
      // containerHeight = 400.0;
      containerContents = Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Forgot Password',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 45,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(5)),
            child: TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.person_sharp),
                  border: InputBorder.none,
                  labelText: 'Email'),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const SizedBox(
            height: 30,
          ),
          MaterialButton(
            onPressed: () {
              continueButtonSignUp(context);
            },
            textColor: Colors.white,
            minWidth: 350,
            height: 45,
            color: Colors.indigo[900],
            child: const Text('Continue'),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      );
      buttonVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background Image
          Align(
              // alignment: Alignment.center,
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  height: 80,
                  // opacity: AlwaysStoppedAnimation(0.6),
                  width: 80,
                  image: AssetImage("assets/images/logo.png")),
            ],
          )),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/buildings.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Mobile layout content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                  // alignment: Alignment.center,
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                      height: 80,
                      // opacity: AlwaysStoppedAnimation(0.6),
                      width: 80,
                      image: AssetImage("assets/images/logo.png")),
                ],
              )),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.all(20),
                height: calculateContainerHeight(),
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      // Container for TabBar
                      Container(
                        child: TabBar(
                          tabs: [
                            Tab(
                              text: 'ALREADY REGISTERED',
                            ),
                            Tab(
                              text: 'I AM NEW HERE',
                            ),
                          ],
                        ),
                      ),

                      // TabBarView
                      Expanded(
                        child: TabBarView(
                          children: [
                            // Login Tab
                            Form(
                                child: Column(
                              children: [
                                containerContents,
                                Column(
                                  children: [
                                    buttonVisible
                                        ? TextButton(
                                            onPressed: () {
                                              handleButtonClick();
                                            },
                                            child: const Text(
                                              'Forgot Password?',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  decoration:
                                                      TextDecoration.underline),
                                            ))
                                        : const SizedBox(
                                            height: 1,
                                          ),
                                    Image.network(
                                        'https://th.bing.com/th/id/OIP.4PvuBIJEiXqYBCQqW4x4MgAAAA?rs=1&pid=ImgDetMain')
                                  ],
                                )
                              ],
                            )),

                            // SignUp Tab
                            SignupTab(
                              switchValue: switchValue,
                              onSwitchChanged: (value) {
                                setState(() {
                                  switchValue = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WebLayout extends StatefulWidget {
  @override
  _WebLayoutState createState() => _WebLayoutState();
}

class _WebLayoutState extends State<WebLayout> with ButtonFunctions {
  bool switchValue = false;
  User user = User("", "");
  final _loginKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late Widget containerContents;
  Future save() async {
    try {
      bool status =
          await ApiService.login(emailController.text, passwordController.text);
      if (status) {
        loginButton(context);
      } else {
        print("Invalid Credentials");
      }
    } catch (error) {
      print("Error: $error");
    }
  }

  double calculateContainerHeight(double screenWidth) {
    if (screenWidth > 1200) {
      return switchValue ? 600.0 : 500.0;
    } else if (screenWidth > 600) {
      return switchValue ? 600.0 : 500.0;
    } else {
      return switchValue ? 600.0 : 500.0;
    }
  }

  // double containerWidth = 400.0;
  // double containerHeight = 500.0;
  bool buttonVisible = true;
  @override
  void initState() {
    super.initState();
    containerContents = Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        const Text(
          'Enter Your Details Below',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: Column(children: [
            Container(
              height: 45,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5)),
              child: TextFormField(
                controller: emailController,
                onChanged: (val) {
                  user.email = val;
                },
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return "Email can no be empty!";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    icon: Icon(Icons.person_sharp),
                    border: InputBorder.none,
                    hintText: 'Email'),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 45,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5)),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                obscuringCharacter: ".",
                onChanged: (val) {
                  user.password = val;
                },
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return "Password can not be empty!";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    icon: Icon(Icons.key_rounded),
                    border: InputBorder.none,
                    hintText: '......'),
              ),
            ),
          ]),
        ),
        const SizedBox(
          height: 20,
        ),
        MaterialButton(
          onPressed: () {
            if (_loginKey.currentState!.validate()) {
              save();
              // loginButton(context);
            }
            // Navigator.push( context, MaterialPageRoute(builder: (context) => WelcomePage()), );
          },
          textColor: Colors.white,
          minWidth: 350,
          height: 45,
          color: Colors.indigo[900],
          child: const Text('Login'),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  void handleButtonClick() {
    setState(() {
      // containerHeight = 400.0;
      containerContents = Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Forgot Password',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 45,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(5)),
            child: TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.person_sharp),
                  border: InputBorder.none,
                  labelText: 'Email'),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const SizedBox(
            height: 30,
          ),
          MaterialButton(
            onPressed: () {
              continueButtonSignUp(context);
            },
            textColor: Colors.white,
            minWidth: 350,
            height: 45,
            color: Colors.indigo[900],
            child: const Text('Continue'),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      );
      buttonVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // if (MediaQuery.of(context).size.height <= 350) {
    //   return MobileLayout();
    // }
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/buildings.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Web layout content

          Align(
            alignment: Alignment.topLeft,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 400,
              height: calculateContainerHeight(
                  MediaQuery.of(context).size.width), // Pass the screen width
              margin: EdgeInsets.only(left: 150, top: 30, bottom: 20),
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    // Container for TabBar
                    Align(
                        // alignment: Alignment.center,
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                            height: 80,
                            // opacity: AlwaysStoppedAnimation(0.6),
                            width: 80,
                            image: AssetImage("assets/images/logo.png")),
                      ],
                    )),
                    Container(
                      child: TabBar(
                        labelColor: Colors.deepOrange,
                        indicatorColor: Colors.deepOrange,
                        indicatorWeight: 2.0,
                        tabs: [
                          Tab(
                            text: 'ALREADY REGISTERED',
                          ),
                          Tab(
                            text: 'I AM NEW HERE',
                          ),
                        ],
                      ),
                    ),

                    // TabBarView
                    Expanded(
                      child: TabBarView(
                        children: [
                          // Login Tab
                          Form(
                              key: _loginKey,
                              child: Column(
                                children: [
                                  containerContents,
                                  Column(
                                    children: [
                                      buttonVisible
                                          ? TextButton(
                                              onPressed: () {
                                                handleButtonClick();
                                              },
                                              child: const Text(
                                                'Forgot Password?',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    decoration: TextDecoration
                                                        .underline),
                                              ))
                                          : const SizedBox(
                                              height: 1,
                                            ),
                                      Image.network(
                                          'https://th.bing.com/th/id/OIP.4PvuBIJEiXqYBCQqW4x4MgAAAA?rs=1&pid=ImgDetMain')
                                    ],
                                  )
                                ],
                              )),

                          // SignUp Tab
                          SignupTab(
                            switchValue: switchValue,
                            onSwitchChanged: (value) {
                              setState(() {
                                switchValue = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignupTab extends StatefulWidget {
  final bool switchValue;
  final ValueChanged<bool> onSwitchChanged;

  SignupTab({required this.switchValue, required this.onSwitchChanged});

  @override
  _SignupTabState createState() => _SignupTabState();
}

class _SignupTabState extends State<SignupTab> with ButtonFunctions {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  TextEditingController dateController = TextEditingController();
  String? selectedRadio;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              'Complete your One-Time registration',
              style: TextStyle(
                color: Color.fromARGB(255, 16, 29, 96),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'I have a Reference Code',
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                FlutterSwitch(
                  value: widget.switchValue,
                  padding: 2.0,
                  toggleColor: Colors.white,
                  activeColor: Colors.deepOrange.shade400,
                  inactiveColor: Colors.grey.shade500,
                  onToggle: widget.onSwitchChanged,
                ),
              ],
            ),
            SizedBox(height: 20),
            if (widget.switchValue)
              Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          labelText: 'Reference Code*',
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Reference code cannot be empty!';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Passport Number*',
                          border: OutlineInputBorder(),
                        ),
                        obscuringCharacter: '*',
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Passport number cannot be empty!';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: dateController,
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: selectedDate,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2101),
                          );

                          if (pickedDate != null &&
                              pickedDate != selectedDate) {
                            setState(() {
                              selectedDate = pickedDate;
                              dateController.text =
                                  "${pickedDate.toLocal()}".split(' ')[0];
                            });
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Date of Birth*',
                          border: OutlineInputBorder(),
                          suffixIcon: GestureDetector(
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: selectedDate,
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2101),
                              );

                              if (pickedDate != null &&
                                  pickedDate != selectedDate) {
                                setState(() {
                                  selectedDate = pickedDate;
                                  dateController.text =
                                      "${pickedDate.toLocal()}".split(' ')[0];
                                });
                              }
                            },
                            child: Icon(Icons.calendar_today),
                          ),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select your date of birth!';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Validate the form
                          if (_formKey.currentState!.validate()) {
                            // Form is valid, perform your actions here
                            setState(() {
                              errorMessage = null;
                            });
                            continueButtonSignUp(context);
                          }
                          // if (errorMessage.toString().isNotEmpty) {
                          //   continueButtonSignUp(context);
                          // }
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => InstructionPage()),
                          // );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          minimumSize: Size(double.infinity, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Color.fromARGB(255, 41, 56, 132),
                        ),
                        child: Text(
                          'Continue',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image.network(
                          'https://th.bing.com/th/id/OIP.4PvuBIJEiXqYBCQqW4x4MgAAAA?rs=1&pid=ImgDetMain')
                    ],
                  ),
                ),
              )
            else
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Are you applying from Canada?*',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Radio(
                          value: 'Yes',
                          groupValue: selectedRadio,
                          onChanged: (value) {
                            setState(() {
                              selectedRadio = value.toString();
                            });
                          },
                        ),
                        Text(
                          "Yes",
                          style: TextStyle(fontSize: 20),
                        ),
                        Radio(
                          value: 'No',
                          groupValue: selectedRadio,
                          onChanged: (value) {
                            setState(() {
                              selectedRadio = value.toString();
                            });
                          },
                        ),
                        Text(
                          "No",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => InstructionPage()),
                        // );
                        continueButtonSignUp(context);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        minimumSize: Size(double.infinity, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: Color.fromARGB(255, 41, 56, 132),
                      ),
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image.network(
                        'https://th.bing.com/th/id/OIP.4PvuBIJEiXqYBCQqW4x4MgAAAA?rs=1&pid=ImgDetMain'),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
