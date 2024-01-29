import 'package:flutter/material.dart';
import 'package:poc/welcome.dart';
import 'package:responsive_builder/responsive_builder.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String selectedTitle = '';
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController reEnterEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController reEnterPasswordController = TextEditingController();
  String accountUsage = '';
  String securityQuestion1 = '';
  TextEditingController securityAnswer1Controller = TextEditingController();
  String securityQuestion2 = '';
  TextEditingController securityAnswer2Controller = TextEditingController();
  String securityQuestion3 = '';
  TextEditingController securityAnswer3Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          bool isMobile = sizingInformation.isMobile;

          return Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 1100),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: CustomScrollView(
                slivers: [
                  isMobile
                      ? SliverAppBar(
                          backgroundColor:
                              const Color.fromARGB(255, 171, 78, 71),
                          pinned: true,
                          leading: IconButton(
                            icon: Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          title: Text(
                            'Registration',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          automaticallyImplyLeading: false)
                      : SliverAppBar(
                          leading: Image.asset('assets/images/AppLogo.png'),
                          title: const Text(
                            "Registration",
                            style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          centerTitle: true,
                          actions: [
                            Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Image.asset(
                                'assets/images/rightLogo.jpg',
                                height: 60.0,
                              ),
                            )
                          ],
                          bottom: PreferredSize(
                            preferredSize: Size.fromHeight(1.0),
                            child: Container(
                              color: Colors.grey,
                              height: 1.0,
                            ),
                          ),
                        ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      if (isMobile)
                        Transform.translate(
                            offset: Offset(140.0, 0.0),
                            child: Image.network(
                              'data:image/png;base64,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', // Replace with the path to your right logo
                              width: 50,
                              height: 50,
                              fit: BoxFit.contain, // Adjust the fit as needed
                            )),
                      if (!isMobile) SizedBox(height: 20),
                      Container(
                        // margin: EdgeInsets.only(top: 16),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 0.0, left: 16.0),
                          child: Text(
                            'Enter your details for Registration',
                            style: TextStyle(
                                color: Color.fromARGB(251, 40, 66, 137),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Instructions',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 10),
                            BulletPoint(
                              'The name provided should exactly match the name reflected on the ID document submitted.',
                              '',
                              iconColor: Colors.black,
                            ),
                            BulletPoint(
                              'Please review the information provided before submission to ensure that it is correct and complete in all respects.',
                              '',
                              iconColor: Colors.black,
                            ),
                            BulletPoint(
                              'Upon arrival in Canada, please submit your activation request.',
                              '',
                              iconColor: Colors.black,
                            ),
                            Text('Title', style: TextStyle(fontSize: 18)),
                            Row(
                              children: [
                                TitleBox('Mr'),
                                TitleBox('Ms'),
                                TitleBox('Mrs'),
                              ],
                            ),
                            SizedBox(height: 20),
                            // Adjusted layout for web
                            isMobile
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('First Name',
                                          style: TextStyle(fontSize: 18)),
                                      InputBox(
                                        controller: firstNameController,
                                        icon: Icons.info_outline,
                                        hintText: 'Enter your first name',
                                      ),
                                      SizedBox(height: 10),
                                      Text('Middle Name',
                                          style: TextStyle(fontSize: 18)),
                                      InputBox(
                                        controller: middleNameController,
                                        icon: Icons.info_outline,
                                        hintText: 'Enter your middle name',
                                      ),
                                      SizedBox(height: 10),
                                      Text('Last Name',
                                          style: TextStyle(fontSize: 18)),
                                      InputBox(
                                        controller: lastNameController,
                                        icon: Icons.info_outline,
                                        hintText: 'Enter your last name',
                                      ),
                                      SizedBox(height: 10),
                                      Text('Date of Birth',
                                          style: TextStyle(fontSize: 18)),
                                      DatePickerBox(
                                        controller: dobController,
                                        hintText: 'Select your date of birth',
                                      ),
                                    ],
                                  )
                                : Column(children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: InputBox(
                                            controller: firstNameController,
                                            icon: Icons.info_outline,
                                            hintText: 'Enter your first name',
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: InputBox(
                                            controller: middleNameController,
                                            icon: Icons.info_outline,
                                            hintText: 'Enter your middle name',
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Transform.translate(
                                              offset: Offset(-10.0, 0.0),
                                              child: (InputBox(
                                                controller: lastNameController,
                                                icon: Icons.info_outline,
                                                hintText:
                                                    'Enter your last name',
                                              ))),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Transform.translate(
                                              offset: Offset(-4.0, 0.0),
                                              child: (DatePickerBox(
                                                controller: dobController,
                                                hintText:
                                                    'Select your date of birth',
                                              ))),
                                        ),
                                      ],
                                    )
                                  ]),
                            SizedBox(height: 20),
                            Text(
                              'Will this account be used by or on behalf of any other party who is not an account holder in this application?',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: 'Yes',
                                  groupValue: accountUsage,
                                  onChanged: (value) {
                                    setState(() {
                                      accountUsage = value.toString();
                                    });
                                  },
                                ),
                                Text('Yes'),
                                Radio(
                                  value: 'No',
                                  groupValue: accountUsage,
                                  onChanged: (value) {
                                    setState(() {
                                      accountUsage = value.toString();
                                    });
                                  },
                                ),
                                Text('No'),
                              ],
                            ),
                            SizedBox(height: 10),
                            isMobile
                                ? Column(
                                    children: [
                                      Text('Email Address',
                                          style: TextStyle(fontSize: 18)),
                                      InputBox(
                                        controller: emailController,
                                        icon: Icons.email,
                                        hintText: 'Enter your email address',
                                      ),
                                      SizedBox(height: 10),
                                      Text('Re-enter Email Address',
                                          style: TextStyle(fontSize: 18)),
                                      InputBox(
                                        controller: reEnterEmailController,
                                        icon: Icons.email,
                                        hintText: 'Re-enter your email address',
                                      ),
                                      SizedBox(height: 50),
                                      Text('Password',
                                          style: TextStyle(fontSize: 18)),
                                      InputBox(
                                        controller: passwordController,
                                        icon: Icons.lock,
                                        hintText: 'Enter your password',
                                        isPassword: true,
                                      ),
                                      SizedBox(height: 10),
                                      Text('Re-enter Password',
                                          style: TextStyle(fontSize: 18)),
                                      InputBox(
                                        controller: reEnterPasswordController,
                                        icon: Icons.lock,
                                        hintText: 'Re-enter your password',
                                        isPassword: true,
                                      ),
                                    ],
                                  )
                                : Column(children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: InputBox(
                                            controller: emailController,
                                            icon: Icons.email,
                                            hintText:
                                                'Enter your email address',
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: InputBox(
                                            controller: reEnterEmailController,
                                            icon: Icons.email,
                                            hintText:
                                                'Re-enter your email address',
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Transform.translate(
                                              offset: Offset(-10.0, 0.0),
                                              child: (InputBox(
                                                controller: passwordController,
                                                icon: Icons.lock,
                                                hintText: 'Enter your password',
                                              ))),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Transform.translate(
                                              offset: Offset(-4.0, 0.0),
                                              child: (InputBox(
                                                controller:
                                                    reEnterPasswordController,
                                                icon: Icons.lock,
                                                hintText:
                                                    'Re-enter your password',
                                              ))),
                                        ),
                                      ],
                                    )
                                  ]),
                            SizedBox(height: 10),
                            Text('Password Requirements'),
                            SizedBox(height: 10),
                            BulletList([
                              'At least 8 characters long',
                              'At least one uppercase letter',
                              'At least one lowercase letter',
                              'At least one number',
                              'At least one special character'
                            ]),
                            SizedBox(height: 20),
                            Text(
                              'In case you forgot your password, you will be required to answer one of these security questions to regenerate your password',
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 147, 127, 127)),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Security Questions',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 10),
                            isMobile
                                ? Column(children: [
                                    SecurityQuestionDropdown(
                                      hintText: 'Select Security Question 1',
                                      onChanged: (value) {
                                        setState(() {
                                          securityQuestion1 = value.toString();
                                        });
                                      },
                                    ),
                                    SizedBox(height: 10),
                                    InputBox(
                                      controller: securityAnswer1Controller,
                                      icon: Icons.edit,
                                      hintText:
                                          'Answer for Security Question 1',
                                    ),
                                    SizedBox(height: 10),
                                    SecurityQuestionDropdown(
                                      hintText: 'Select Security Question 2',
                                      onChanged: (value) {
                                        setState(() {
                                          securityQuestion2 = value.toString();
                                        });
                                      },
                                    ),
                                    SizedBox(height: 10),
                                    InputBox(
                                      controller: securityAnswer2Controller,
                                      icon: Icons.edit,
                                      hintText:
                                          'Answer for Security Question 2',
                                    ),
                                    SizedBox(height: 10),
                                    SecurityQuestionDropdown(
                                      hintText: 'Select Security Question 3',
                                      onChanged: (value) {
                                        setState(() {
                                          securityQuestion3 = value.toString();
                                        });
                                      },
                                    ),
                                    SizedBox(height: 10),
                                    InputBox(
                                      controller: securityAnswer3Controller,
                                      icon: Icons.edit,
                                      hintText:
                                          'Answer for Security Question 3',
                                    ),
                                  ])
                                : Transform.translate(
                                    offset: Offset(-10.0, 0.0),
                                    child: (Column(children: [
                                      Row(
                                        children: [
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: SecurityQuestionDropdown(
                                              hintText:
                                                  'Select Security Question 1',
                                              onChanged: (value) {
                                                setState(() {
                                                  securityQuestion1 =
                                                      value.toString();
                                                });
                                              },
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: InputBox(
                                              controller:
                                                  securityAnswer1Controller,
                                              icon: Icons.edit,
                                              hintText:
                                                  'Answer for Security Question 1',
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: SecurityQuestionDropdown(
                                              hintText:
                                                  'Select Security Question 2',
                                              onChanged: (value) {
                                                setState(() {
                                                  securityQuestion2 =
                                                      value.toString();
                                                });
                                              },
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: InputBox(
                                              controller:
                                                  securityAnswer2Controller,
                                              icon: Icons.edit,
                                              hintText:
                                                  'Answer for Security Question 2',
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: SecurityQuestionDropdown(
                                              hintText:
                                                  'Select Security Question 3',
                                              onChanged: (value) {
                                                setState(() {
                                                  securityQuestion3 =
                                                      value.toString();
                                                });
                                              },
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: InputBox(
                                              controller:
                                                  securityAnswer3Controller,
                                              icon: Icons.edit,
                                              hintText:
                                                  'Answer for Security Question 3',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]))),
                            SizedBox(height: 5),
                            Text(
                              'Setting up your profile will help you to login to this application later. By providing your email address, you are authorizing ICICI Bank Canada to send your correspondence to this email address',
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 147, 127, 127)),
                            ),
                            SizedBox(height: 20),
                            isMobile
                                ? ElevatedButton(
                                    onPressed: () {
                                      // Handle registration here
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                WelcomePage()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary:
                                          Color.fromARGB(255, 103, 131, 198),
                                      onPrimary: Colors.white,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 16),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      minimumSize: Size(double.infinity, 0),
                                    ),
                                    child: Text(
                                      'Register',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  )
                                : Material(
                                    elevation:
                                        5, // Adjust the elevation as needed
                                    child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 150,
                                              height: 30,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  'Back',
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.white,
                                                  side: BorderSide(
                                                    color: Color.fromARGB(
                                                        255, 22, 39, 151),
                                                    width: 1.0,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                  minimumSize:
                                                      Size(double.infinity, 0),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 150,
                                              height: 38.7,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  // Handle registration here
                                                  _handleRegistration();
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            WelcomePage()),
                                                  );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  primary: Color.fromARGB(
                                                      255, 103, 131, 198),
                                                  onPrimary: Colors.white,
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 16),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  minimumSize:
                                                      Size(double.infinity, 0),
                                                ),
                                                child: Text(
                                                  'Register',
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                              ),
                                            ),
                                          ],
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                        )),
                                  )

                            // ... (Previous code remains unchanged)
                          ],
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget TitleBox(String title) {
    bool isSelected = selectedTitle == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTitle = title;
        });
      },
      child: Container(
        width: 110.0,
        margin: EdgeInsets.only(right: 10, top: 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: isSelected ? Colors.blue : Colors.white,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  void _handleRegistration() {
    // Implement your registration logic here
    // You can access all the entered data using the controllers
    // For example:
    // final String title = selectedTitle;
    // final String firstName = firstNameController.text;
    // final String middleName = middleNameController.text;
    // final String lastName = lastNameController.text;
    // final String dob = dobController.text;
    // final String email = emailController.text;
    // final String reEnterEmail = reEnterEmailController.text;
    // final String password = passwordController.text;
    // final String reEnterPassword = reEnterPasswordController.text;
    // final String accountUsageValue = accountUsage;
    // final String securityQuestion1Value = securityQuestion1;
    // final String securityAnswer1 = securityAnswer1Controller.text;
    // final String securityQuestion2Value = securityQuestion2;
    // final String securityAnswer2 = securityAnswer2Controller.text;
    // final String securityQuestion3Value = securityQuestion3;
    // final String securityAnswer3 = securityAnswer3Controller.text;

    // Perform registration actions with the data
    // ...
  }
  // ... (Previous code remains unchanged)
}

class BulletPoint extends StatelessWidget {
  final String title;
  final String description;
  final Color iconColor;

  const BulletPoint(this.title, this.description, {required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.translate(
              offset: Offset(0.0, 7.0),
              child: (Icon(Icons.fiber_manual_record,
                  size: 10, color: iconColor))),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 18)),
                Text(description),
              ],
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
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}

class InputBox extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String hintText;
  final bool isPassword;

  InputBox({
    required this.controller,
    required this.icon,
    required this.hintText,
    this.isPassword = false,
  });

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
                    child: TextField(
                      controller: controller,
                      obscureText: isPassword,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hintText,
                      ),
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

class DatePickerBox extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  DatePickerBox({required this.controller, required this.hintText});

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ))!;
    if (picked != DateTime.now())
      controller.text = picked.toLocal().toString().split(' ')[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => _selectDate(context),
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
                      child: TextField(
                        controller: controller,
                        enabled: false,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: hintText,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Icon(Icons.calendar_today),
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

class SecurityQuestionDropdown extends StatelessWidget {
  final String hintText;
  final Function onChanged;

  SecurityQuestionDropdown({required this.hintText, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: DropdownButtonFormField<String>(
                hint: Text(hintText),
                isExpanded: true,
                items: [
                  DropdownMenuItem<String>(
                    value: 'What is your favorite color?',
                    child: Text('What is your favorite color?'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'What is the name of your first pet?',
                    child: Text('What is the name of your first pet?'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'What city were you born in?',
                    child: Text('What city were you born in?'),
                  ),
                ],
                onChanged: (value) {
                  onChanged(value);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
