import 'package:flutter/material.dart';
import 'package:poc/Apply%20Now/pp1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class Item1 {
  Item1({required this.headerText, this.isExpanded = false});
  String headerText;
  bool isExpanded;
}

class Item2 {
  Item2({required this.headerText, this.isExpanded = false});
  String headerText;
  bool isExpanded;
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Personal(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Personal extends StatefulWidget {
  const Personal({super.key});

  @override
  State<Personal> createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  String selectedValue1 = '12';
  String? errorMessage;
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _middleController = TextEditingController();
  final TextEditingController _lastController = TextEditingController();
  final TextEditingController _maidenController = TextEditingController();
  final TextEditingController _insuranceController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _streetNumberController = TextEditingController();
  final TextEditingController _streetNameController = TextEditingController();
  final TextEditingController _unitNumberController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _homeNumberController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  String? selectedOption1;
  String? selectedOption2;
  String? selectedOption3;
  // int ? selectedvalue3;
  final List<Item1> _data = List<Item1>.generate(1, (int index) {
    return Item1(headerText: '');
  });
  final List<Item2> _data2 = List<Item2>.generate(1, (int index) {
    return Item2(headerText: '');
  });
  String selectedValue2 = '05';

  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600;
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;
  TextEditingController dateController = TextEditingController();
  double containerHeight1 = 1470;
  double containerHeight2 = 450;
  void handleCheckBox(bool? value) {
    {
      setState(() {
        isChecked = value ?? false;
        if (isChecked == true) {
          containerHeight1 = 1170;

          checkBox1 = const Text('');
        } else {
          containerHeight1 = 1470;

          checkBox1 = Form(
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Type your address*',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: 'Type your address',
                            border: OutlineInputBorder()),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'This is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 25),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Street Number*',
                            hintText: '116',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder()),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'This is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 25)
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Street Name*',
                            hintText: 'Albert st',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder()),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'This is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 25),
                    Expanded(
                      child: TextFormField(
                          decoration: const InputDecoration(
                        labelText: 'Unit Number',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: '300',
                        border: OutlineInputBorder(),
                      )),
                    ),
                    const SizedBox(width: 25)
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: "Province*",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(),
                            hintText: 'ON'),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'This is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 25),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'City*',
                            hintText: 'Ottawa',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder()),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'This is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 25)
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Country*',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: 'Canada',
                            border: OutlineInputBorder()),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'This is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 25),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Postal Code*',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: 'K1P 5G3',
                            border: OutlineInputBorder()),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'This is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 25)
                  ],
                ),
              ],
            ),
          );
        }
      });
    }
    {
      setState(() {
        isChecked = value ?? false;
        if (isChecked == true) {
          containerHeight2 = 5;

          checkBox2 = const Text('');
        } else {
          containerHeight2 = 450;

          checkBox2 = Form(
            child: Column(
              children: [
                Expanded(
                  child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Type your address*',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: 'Type your address',
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          border: OutlineInputBorder())),
                ),
                Expanded(
                  child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Street Number*',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: '116',
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          border: OutlineInputBorder())),
                ),
                Expanded(
                  child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Street Name*',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: 'Albert St',
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          border: OutlineInputBorder())),
                ),
                Expanded(
                  child: TextFormField(
                      decoration: const InputDecoration(
                    labelText: 'Unit Number',
                    hintText: '300',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    isDense: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    border: OutlineInputBorder(),
                  )),
                ),
                Expanded(
                  child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: "Province*",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(),
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          hintText: 'ON')),
                ),
                Expanded(
                  child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'City*',
                          hintText: 'Ottawa',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          border: OutlineInputBorder())),
                ),
                Expanded(
                  child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Country*',
                          hintText: 'Canada',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          border: OutlineInputBorder())),
                ),
                Expanded(
                  child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Postal Code*',
                          hintText: 'K1P 5G3',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          border: OutlineInputBorder())),
                ),
              ],
            ),
          );
        }
      });
    }
  }

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    dateController = TextEditingController(
      text: "${selectedDate.toLocal()}".split(' ')[0],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ) as DateTime;
    if (picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  int selectedButtonIndex = -1;
  void handlePressMr(int indexe) {
    setState(() {
      selectedButtonIndex = indexe;
    });
  }

  Widget checkBox1 = Form(
    child: Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Type your address*',
                    hintText: 'Type your address',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder()),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'This is required';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(width: 25),
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Street Number*',
                    hintText: '116',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder()),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'This is required';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(width: 25)
          ],
        ),
        const SizedBox(height: 25),
        Row(
          children: [
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Street Name*',
                    hintText: 'Albert st',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder()),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'This is required';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(width: 25),
            Expanded(
              child: TextFormField(
                  decoration: const InputDecoration(
                labelText: 'Unit Number',
                hintText: '300',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(),
              )),
            ),
            const SizedBox(width: 25)
          ],
        ),
        const SizedBox(height: 25),
        Row(
          children: [
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: "Province*",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(),
                    hintText: 'ON'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'This is required';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(width: 25),
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: 'City*',
                    hintText: 'Ottawa',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder()),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'This is required';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(width: 25)
          ],
        ),
        const SizedBox(height: 25),
        Row(
          children: [
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Country*',
                    hintText: 'Canada',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder()),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'This is required';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(width: 25),
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Postal Code*',
                    hintText: 'K1P 5G3',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder()),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'This is required';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(width: 25)
          ],
        ),
      ],
    ),
  );

  Widget checkBox2 = Form(
    child: Column(
      children: [
        Expanded(
          child: TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Type your address*',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'Type your address',
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder())),
        ),
        Expanded(
          child: TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Street Number*',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: '116',
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder())),
        ),
        Expanded(
          child: TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Street Name*',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'Albert St',
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder())),
        ),
        Expanded(
          child: TextFormField(
              decoration: const InputDecoration(
            labelText: 'Unit Number',
            hintText: '300',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            border: OutlineInputBorder(),
          )),
        ),
        Expanded(
          child: TextFormField(
              decoration: const InputDecoration(
                  labelText: "Province*",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(),
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  hintText: 'ON')),
        ),
        Expanded(
          child: TextFormField(
              decoration: const InputDecoration(
                  labelText: 'City*',
                  hintText: 'Ottawa',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder())),
        ),
        Expanded(
          child: TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Country*',
                  hintText: 'Canada',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder())),
        ),
        Expanded(
          child: TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Postal Code*',
                  hintText: 'K1P 5G3',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder())),
        ),
      ],
    ),
  );

  int currentScreenIndex = 0;
  bool flag = false;
  Widget circleIcon(IconData icon, int iconIndex, int currentScreenIndex) {
    return Container(
      color: Colors.white,
      width: 50,
      height: 50,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: (iconIndex == currentScreenIndex)
                  ? Colors.white
                  : Colors.blue[900],
              shape: BoxShape.circle,
              border: Border.all(
                  color: (iconIndex == currentScreenIndex)
                      ? Colors.orange
                      : Colors.black),
            ),
            child: Icon(icon,
                size: 30,
                color: (iconIndex == currentScreenIndex)
                    ? Colors.orange
                    : Colors.black),
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
                child: const Icon(Icons.check, color: Colors.white, size: 15),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isDesktop(context)) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Personal Details',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 26, 35, 126)),
          ),
          actions: [
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
          ],
        ),
        drawer: const Drawer(),
        body: Center(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    color: Colors.white,
                    child: Form(
                      key: _formKey,
                      child: ListView(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              color: Colors.white,
                              width: 250,
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          height: 70,
                                          margin:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Stack(
                                            children: [
                                              circleIcon(Icons.touch_app, 0,
                                                  currentScreenIndex),
                                              const Positioned(
                                                  bottom: 0,
                                                  child: Text(
                                                    'Account',
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  ))
                                            ],
                                          )),
                                      Container(
                                        color: Colors.white,
                                        height:
                                            8, // Set the desired width (thickness) of the Divider
                                        width: 100,
                                        child: const Divider(
                                          color: Colors.orange,
                                        ),
                                      ),
                                      Container(
                                          height: 70,
                                          margin:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Stack(
                                            children: [
                                              circleIcon(Icons.person, 1,
                                                  currentScreenIndex),
                                              const Positioned(
                                                bottom: 0,
                                                child: Text(
                                                  'Personal Details',
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                  softWrap: true,
                                                ),
                                              )
                                            ],
                                          )),
                                    ]),
                                //  child: Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //   Container(
                                //     color:Colors.white,
                                //     height:80,
                                //     child: Stack(children: [
                                //       circleIcon(Icons.account_balance_outlined, 0, currentScreenIndex),
                                //       const Positioned(bottom: 0,child: Text('Account Details')),

                                //     circleIcon(Icons.account_circle_outlined, 1, currentScreenIndex),
                                //     ],),
                                //   )
                                //    ],
                                //   ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 900,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.grey, width: 0.2),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 231, 229, 229),
                                    spreadRadius: 1,
                                    blurRadius: 6,
                                    offset: Offset(1, 1),
                                  ),
                                  BoxShadow(
                                    color: Color.fromARGB(255, 231, 226, 226),
                                    spreadRadius: 1,
                                    blurRadius: 6,
                                    offset: Offset(-1, -1),
                                  ),
                                ],
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        color: const Color.fromARGB(
                                            255, 236, 234, 234),
                                        width: 900,
                                        child: const Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              20, 10, 10, 10),
                                          child: Text(
                                            'Tell us about yourself',
                                            style: TextStyle(fontSize: 22),
                                          ),
                                        )),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 10, 10, 10),
                                      child: Text(
                                        'Title',
                                        style: TextStyle(fontSize: 22),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        OutlinedButton(
                                            onPressed: () {
                                              handlePressMr(0);
                                            },
                                            style: OutlinedButton.styleFrom(
                                                foregroundColor:
                                                    (selectedButtonIndex == 0)
                                                        ? Colors.orange
                                                        : Colors.grey,
                                                minimumSize:
                                                    const Size(100, 45),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0)),
                                                side: BorderSide(
                                                    color:
                                                        (selectedButtonIndex ==
                                                                0)
                                                            ? Colors.orange
                                                            : Colors.grey)),
                                            child: const Text('Mr')),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        OutlinedButton(
                                          onPressed: () {
                                            handlePressMr(1);
                                          },
                                          style: OutlinedButton.styleFrom(
                                              foregroundColor:
                                                  (selectedButtonIndex == 1)
                                                      ? Colors.orange
                                                      : Colors.grey,
                                              minimumSize: const Size(100, 45),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0)),
                                              side: BorderSide(
                                                  color:
                                                      (selectedButtonIndex == 1)
                                                          ? Colors.orange
                                                          : Colors.grey)),
                                          child: const Text('Ms'),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        OutlinedButton(
                                            onPressed: () {
                                              handlePressMr(2);
                                            },
                                            style: OutlinedButton.styleFrom(
                                                foregroundColor:
                                                    (selectedButtonIndex == 2)
                                                        ? Colors.orange
                                                        : Colors.grey,
                                                minimumSize:
                                                    const Size(100, 45),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0)),
                                                side: BorderSide(
                                                    color:
                                                        (selectedButtonIndex ==
                                                                2)
                                                            ? Colors.orange
                                                            : Colors.grey)),
                                            child: const Text('Mrs'))
                                      ],
                                    ),
                                    const SizedBox(height: 25),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            const SizedBox(width: 20),
                                            Expanded(
                                              child: TextFormField(
                                                controller: _firstController,
                                                decoration: const InputDecoration(
                                                    labelText: 'First Name*',
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                    hintText: 'Test five',
                                                    border:
                                                        OutlineInputBorder()),
                                                validator: (String? value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'This is required';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                            const SizedBox(width: 25),
                                            Expanded(
                                              child: TextFormField(
                                                controller: _middleController,
                                                decoration: const InputDecoration(
                                                    labelText: 'Middle Name',
                                                    hintText: 'new',
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                    border:
                                                        OutlineInputBorder()),
                                              ),
                                            ),
                                            const SizedBox(width: 25)
                                          ],
                                        ),
                                        const SizedBox(height: 25),
                                        Row(
                                          children: [
                                            const SizedBox(width: 20),
                                            Expanded(
                                              child: TextFormField(
                                                controller: _lastController,
                                                decoration: const InputDecoration(
                                                    labelText: 'Last Name*',
                                                    hintText: 'latest two',
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                    border:
                                                        OutlineInputBorder()),
                                                validator: (String? value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'This is required';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                            const SizedBox(width: 25),
                                            Expanded(
                                              child: TextFormField(
                                                controller: dateController,
                                                readOnly: true,
                                                decoration: InputDecoration(
                                                    labelText: 'Date Of Birth',
                                                    hintText: '01/05/2000',
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                    border:
                                                        const OutlineInputBorder(),
                                                    suffixIcon: IconButton(
                                                        onPressed: () =>
                                                            _selectDate(
                                                                context),
                                                        icon: const Icon(Icons
                                                            .calendar_month_outlined))),
                                                validator: (String? value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'This is required';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                            const SizedBox(width: 25)
                                          ],
                                        ),
                                        const SizedBox(height: 25),
                                        Row(
                                          children: [
                                            const SizedBox(width: 20),
                                            Expanded(
                                              child: TextFormField(
                                                controller: _maidenController,
                                                decoration: const InputDecoration(
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                    labelText:
                                                        "Mother's Maiden Name",
                                                    border:
                                                        OutlineInputBorder(),
                                                    hintText: 'erjgury'),
                                              ),
                                            ),
                                            const SizedBox(width: 25),
                                            Expanded(
                                              child: TextFormField(
                                                controller:
                                                    _insuranceController,
                                                decoration: const InputDecoration(
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                    labelText:
                                                        'Social Insurance Number*',
                                                    hintText: '515615615',
                                                    border:
                                                        OutlineInputBorder()),
                                                validator: (String? value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'This is required';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                            const SizedBox(width: 25)
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 25)
                                  ]),
                            ),
                          ),
                          Container(
                              color: Colors.white,
                              child: const SizedBox(
                                height: 20,
                              )),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: containerHeight1,
                              width: 900,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.grey, width: 0.2),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 231, 229, 229),
                                    spreadRadius: 1,
                                    blurRadius: 6,
                                    offset: Offset(1, 1),
                                  ),
                                  BoxShadow(
                                    color: Color.fromARGB(255, 231, 226, 226),
                                    spreadRadius: 1,
                                    blurRadius: 6,
                                    offset: Offset(-1, -1),
                                  ),
                                ],
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        color: const Color.fromARGB(
                                            255, 236, 234, 234),
                                        width: 900,
                                        child: const Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              20, 10, 10, 10),
                                          child: Text(
                                            'How can we contact you?',
                                            style: TextStyle(fontSize: 22),
                                          ),
                                        )),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 10, 10, 5),
                                      child: Text(
                                        'Home Address',
                                        style: TextStyle(fontSize: 22),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 5, 10, 10),
                                      child: Text(
                                          'Please fill the address where you presently live.This address cannot be a postal installation i.e, PO Box,RR,Site,Comp orD/General Delivery address'),
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            const SizedBox(width: 20),
                                            Expanded(
                                              child: TextFormField(
                                                controller: _addressController,
                                                decoration: const InputDecoration(
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                    labelText:
                                                        'Type your address*',
                                                    hintText:
                                                        'Type your address',
                                                    border:
                                                        OutlineInputBorder()),
                                                validator: (String? value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'This is required';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                            const SizedBox(width: 25),
                                            Expanded(
                                              child: TextFormField(
                                                controller:
                                                    _streetNumberController,
                                                decoration: const InputDecoration(
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                    labelText: 'Street Number*',
                                                    hintText: '116',
                                                    border:
                                                        OutlineInputBorder()),
                                                validator: (String? value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'This is required';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                            const SizedBox(width: 25)
                                          ],
                                        ),
                                        const SizedBox(height: 25),
                                        Row(
                                          children: [
                                            const SizedBox(width: 20),
                                            Expanded(
                                              child: TextFormField(
                                                controller:
                                                    _streetNameController,
                                                decoration: const InputDecoration(
                                                    labelText: 'Street Name*',
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                    hintText: 'Albert st',
                                                    border:
                                                        OutlineInputBorder()),
                                                validator: (String? value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'This is required';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                            const SizedBox(width: 25),
                                            Expanded(
                                              child: TextFormField(
                                                  controller:
                                                      _unitNumberController,
                                                  decoration:
                                                      const InputDecoration(
                                                    labelText: 'Unit Number',
                                                    hintText: '300',
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                    border:
                                                        OutlineInputBorder(),
                                                  )),
                                            ),
                                            const SizedBox(width: 25)
                                          ],
                                        ),
                                        const SizedBox(height: 25),
                                        Row(
                                          children: [
                                            const SizedBox(width: 20),
                                            Expanded(
                                              child: TextFormField(
                                                controller: _provinceController,
                                                decoration: const InputDecoration(
                                                    labelText: "Province*",
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                    border:
                                                        OutlineInputBorder(),
                                                    hintText: 'ON'),
                                                validator: (String? value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'This is required';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                            const SizedBox(width: 25),
                                            Expanded(
                                              child: TextFormField(
                                                controller: _cityController,
                                                decoration: const InputDecoration(
                                                    labelText: 'City*',
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                    hintText: 'Ottawa',
                                                    border:
                                                        OutlineInputBorder()),
                                                validator: (String? value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'This is required';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                            const SizedBox(width: 25)
                                          ],
                                        ),
                                        const SizedBox(height: 25),
                                        Row(
                                          children: [
                                            const SizedBox(width: 20),
                                            Expanded(
                                              child: TextFormField(
                                                controller: _countryController,
                                                decoration: const InputDecoration(
                                                    labelText: 'Country*',
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                    hintText: 'Canada',
                                                    border:
                                                        OutlineInputBorder()),
                                                validator: (String? value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'This is required';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                            const SizedBox(width: 25),
                                            Expanded(
                                              child: TextFormField(
                                                controller:
                                                    _postalCodeController,
                                                decoration: const InputDecoration(
                                                    labelText: 'Postal Code*',
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                    hintText: 'K1P 5G3',
                                                    border:
                                                        OutlineInputBorder()),
                                                validator: (String? value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'This is required';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                            const SizedBox(width: 25)
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 15, 10, 10),
                                      child: Text('Year of Residing'),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 10, 20, 10),
                                          child: SizedBox(
                                            width: 200,
                                            child: DropdownButtonFormField(
                                              value: selectedValue1,
                                              items: [
                                                '12',
                                                '2022',
                                                '2023',
                                                '2024',
                                              ].map((String value) {
                                                return DropdownMenuItem(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              onChanged: (newValue) {
                                                setState(() {
                                                  selectedValue1 =
                                                      newValue as String;
                                                });
                                              },
                                              decoration: const InputDecoration(
                                                labelText: 'Year',
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 10, 20, 10),
                                          child: SizedBox(
                                            width: 200,
                                            child: DropdownButtonFormField(
                                              value: selectedValue2,
                                              items: [
                                                '01',
                                                '02',
                                                '03',
                                                '04',
                                                '05',
                                                '06',
                                                '07',
                                                '08',
                                                '09',
                                                '10',
                                                '11',
                                                '12',
                                              ].map((String value) {
                                                return DropdownMenuItem(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              onChanged: (newValue) {
                                                setState(() {
                                                  selectedValue2 =
                                                      newValue as String;
                                                });
                                              },
                                              decoration: const InputDecoration(
                                                labelText: 'Month',
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 10, 10, 5),
                                      child: Text(
                                        'Mailing Address',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Checkbox(
                                            value: isChecked,
                                            onChanged: (value) {
                                              handleCheckBox(value);
                                            },
                                          ),
                                        ),
                                        const Text('Same as Home Address')
                                      ],
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [Flexible(child: checkBox1)],
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 10, 10, 5),
                                      child: Text(
                                        'Contact Details',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 10, 10, 5),
                                      child: SizedBox(
                                        width: 400,
                                        child: TextFormField(
                                            controller: _emailController,
                                            validator: (String? value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'This is required';
                                              }
                                              return null;
                                            },
                                            decoration: const InputDecoration(
                                                labelText: 'Email Address*',
                                                hintText: '7@d1.com',
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior
                                                        .always,
                                                border: OutlineInputBorder())),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 10, 10, 5),
                                          child: SizedBox(
                                            width: 200,
                                            child: TextFormField(
                                                controller:
                                                    _homeNumberController,
                                                validator: (String? value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'This is required';
                                                  }
                                                  return null;
                                                },
                                                decoration: const InputDecoration(
                                                    labelText:
                                                        'Home Telephone Number*',
                                                    hintText: '8590762094',
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                    border:
                                                        OutlineInputBorder())),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 200,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 10, 10, 5),
                                          child: SizedBox(
                                            width: 200,
                                            child: TextFormField(
                                                controller:
                                                    _phoneNumberController,
                                                validator: (String? value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'This is required';
                                                  }
                                                  return null;
                                                },
                                                decoration: const InputDecoration(
                                                    labelText: 'Phone Number*',
                                                    hintText: '8761092546',
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                    border:
                                                        OutlineInputBorder())),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  20, 1, 5, 5),
                                              child: SizedBox(
                                                  width: 400,
                                                  child: Text(
                                                      'Register for free TEXT ALERTS (SMS) service*')),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 1, 5, 5),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 120,
                                                    child: RadioListTile(
                                                      title: const Text('Yes'),
                                                      value: 'Yes',
                                                      groupValue:
                                                          selectedOption1,
                                                      onChanged:
                                                          (String? value) {
                                                        setState(() {
                                                          selectedOption1 =
                                                              value;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 120,
                                                    child: RadioListTile(
                                                      title: const Text('No'),
                                                      value: 'No',
                                                      groupValue:
                                                          selectedOption1,
                                                      onChanged:
                                                          (String? value) {
                                                        setState(() {
                                                          selectedOption1 =
                                                              value;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  20, 1, 5, 5),
                                              child: SizedBox(
                                                  width: 400,
                                                  child: Text(
                                                      'Check book required*')),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 1, 5, 5),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 120,
                                                    child: RadioListTile(
                                                      title: const Text('Yes'),
                                                      value: 'Yes',
                                                      groupValue:
                                                          selectedOption2,
                                                      onChanged:
                                                          (String? value) {
                                                        setState(() {
                                                          selectedOption2 =
                                                              value;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 120,
                                                    child: RadioListTile(
                                                      title: const Text('No'),
                                                      value: 'No',
                                                      groupValue:
                                                          selectedOption2,
                                                      onChanged:
                                                          (String? value) {
                                                        setState(() {
                                                          selectedOption2 =
                                                              value;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(20, 1, 5, 5),
                                          child: SizedBox(
                                              width: 400,
                                              child: Text(
                                                  'Register for monthly physical statements*')),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 1, 5, 5),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 120,
                                                child: RadioListTile(
                                                  visualDensity:
                                                      VisualDensity.compact,
                                                  title: const Text('Yes'),
                                                  value: 'Yes',
                                                  groupValue: selectedOption3,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      selectedOption3 = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: 120,
                                                child: RadioListTile(
                                                  title: const Text('No'),
                                                  value: 'No',
                                                  groupValue: selectedOption3,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      selectedOption3 = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(20, 1, 1, 1),
                                      child: SizedBox(
                                          width: 430,
                                          child: Text(
                                              'You will receive your statement by email free of charge. A monthly charge is applicable for physical statements(refer to Disclosure Statement of Fees and Charges for Personal Accounts on icicibank.ca)')),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black, width: 0.2),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: OutlinedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              style: OutlinedButton.styleFrom(
                                                  backgroundColor: Colors.white,
                                                  side: const BorderSide(
                                                      color: Color.fromARGB(
                                                          255, 29, 106, 168)),
                                                  foregroundColor:
                                                      Colors.blue[800],
                                                  shape:
                                                      const RoundedRectangleBorder()),
                                              child: const Text('Back'),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: MaterialButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          PersonalInfoPage()),
                                                );
                                              },
                                              textColor: Colors.white,
                                              color: Colors.blue[900],
                                              child: const Text('Next'),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Personal Details',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red[800],
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart_outlined))
            ],
          ),
          drawer: const Drawer(),
          body: Container(
            color: Colors.white,
            height: 900,
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 70,
                                margin: const EdgeInsets.only(top: 5.0),
                                child: Stack(
                                  children: [
                                    circleIcon(
                                        Icons.touch_app, 0, currentScreenIndex),
                                    const Positioned(
                                        bottom: 0,
                                        child: Text(
                                          'Account',
                                          style: TextStyle(fontSize: 12),
                                        ))
                                  ],
                                )),
                            Container(
                              color: Colors.white,
                              height:
                                  8, // Set the desired width (thickness) of the Divider
                              width: 100,
                              child: const Divider(
                                color: Colors.orange,
                              ),
                            ),
                            Container(
                                height: 70,
                                margin: const EdgeInsets.only(top: 5.0),
                                child: Stack(
                                  children: [
                                    circleIcon(
                                        Icons.person, 1, currentScreenIndex),
                                    const Positioned(
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
                    ),
                  ),

                  SingleChildScrollView(
                    child: ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          _data[index].isExpanded = isExpanded;
                        });
                      },
                      children: _data.map<ExpansionPanel>((Item1 item) {
                        return ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return const ListTile(
                              title: Text(
                                'Tell us about yourself ',
                                style: TextStyle(
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          },
                          body: Container(
                              color: Colors.white,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 2, 10, 2),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const Text(
                                      'Title',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Row(
                                      children: [
                                        OutlinedButton(
                                            onPressed: () {
                                              handlePressMr(0);
                                            },
                                            style: OutlinedButton.styleFrom(
                                                foregroundColor:
                                                    (selectedButtonIndex == 0)
                                                        ? Colors.orange
                                                        : Colors.grey,
                                                minimumSize:
                                                    const Size(110, 45),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0)),
                                                side: BorderSide(
                                                    color:
                                                        (selectedButtonIndex ==
                                                                0)
                                                            ? Colors.orange
                                                            : Colors.grey)),
                                            child: const Text('Mr')),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        OutlinedButton(
                                          onPressed: () {
                                            handlePressMr(1);
                                          },
                                          style: OutlinedButton.styleFrom(
                                              foregroundColor:
                                                  (selectedButtonIndex == 1)
                                                      ? Colors.orange
                                                      : Colors.grey,
                                              minimumSize: const Size(110, 45),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0)),
                                              side: BorderSide(
                                                  color:
                                                      (selectedButtonIndex == 1)
                                                          ? Colors.orange
                                                          : Colors.grey)),
                                          child: const Text('Ms'),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        OutlinedButton(
                                            onPressed: () {
                                              handlePressMr(2);
                                            },
                                            style: OutlinedButton.styleFrom(
                                                foregroundColor:
                                                    (selectedButtonIndex == 2)
                                                        ? Colors.orange
                                                        : Colors.grey,
                                                minimumSize:
                                                    const Size(110, 45),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0)),
                                                side: BorderSide(
                                                    color:
                                                        (selectedButtonIndex ==
                                                                2)
                                                            ? Colors.orange
                                                            : Colors.grey)),
                                            child: const Text('Mrs'))
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      color: Colors.white,
                                      height: 350,
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                                controller: _firstController,
                                                decoration: const InputDecoration(
                                                    labelText: 'First Name*',
                                                    hintText: 'Test five',
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                    isDense: true,
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10,
                                                            horizontal: 10),
                                                    border:
                                                        OutlineInputBorder())),
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                                controller: _middleController,
                                                decoration: const InputDecoration(
                                                    labelText: 'Middle Name*',
                                                    hintText: 'new',
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                    isDense: true,
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10,
                                                            horizontal: 10),
                                                    border:
                                                        OutlineInputBorder())),
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                                controller: _lastController,
                                                decoration: const InputDecoration(
                                                    labelText: 'Last Name*',
                                                    hintText: 'Latest two',
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                    isDense: true,
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10,
                                                            horizontal: 10),
                                                    border:
                                                        OutlineInputBorder())),
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                                controller: dateController,
                                                readOnly: true,
                                                decoration: InputDecoration(
                                                    labelText: 'Date Of Birth',
                                                    hintText: '01/05/2000',
                                                    isDense: true,
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                    contentPadding:
                                                        const EdgeInsets
                                                            .symmetric(
                                                            vertical: 10,
                                                            horizontal: 10),
                                                    border:
                                                        const OutlineInputBorder(),
                                                    suffixIcon: IconButton(
                                                        onPressed: () =>
                                                            _selectDate(
                                                                context),
                                                        icon: const Icon(Icons
                                                            .calendar_month_outlined)))),
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                                controller: _maidenController,
                                                decoration: const InputDecoration(
                                                    labelText:
                                                        "Mother's Maiden Name",
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                    border:
                                                        OutlineInputBorder(),
                                                    isDense: true,
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10,
                                                            horizontal: 10),
                                                    hintText: 'erjgury')),
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                                controller:
                                                    _insuranceController,
                                                decoration: const InputDecoration(
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                    labelText:
                                                        'Social Insurance Number*',
                                                    hintText: '515615615',
                                                    isDense: true,
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10,
                                                            horizontal: 10),
                                                    border:
                                                        OutlineInputBorder())),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          isExpanded: item.isExpanded,
                        );
                      }).toList(),
                    ),
                  ),
                  //BELOW ARE THE CONTACT DETAILS
                  SingleChildScrollView(
                    child: ExpansionPanelList(
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          _data2[index].isExpanded = isExpanded;
                        });
                      },
                      children: _data2.map<ExpansionPanel>((Item2 item) {
                        return ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return const ListTile(
                              title: Text(
                                'How can we contact you?',
                                style: TextStyle(
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          },
                          body: Container(
                              color: Colors.white,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 2, 10, 2),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const Text(
                                      'Home Address',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Text(
                                      'Please fill the address where you presently live. This address cannot be a postal installation i.e, PO Box, RR, Site, Comp orD/General Delivery address',
                                      style: TextStyle(wordSpacing: 5),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      color: Colors.white,
                                      height: 450,
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                                controller: _addressController,
                                                validator: (String? value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'This is required';
                                                  }
                                                  return null;
                                                },
                                                decoration: const InputDecoration(
                                                    labelText:
                                                        'Type your address*',
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                    hintText:
                                                        'Type your address',
                                                    isDense: true,
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10,
                                                            horizontal: 10),
                                                    border:
                                                        OutlineInputBorder())),
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                                controller:
                                                    _streetNumberController,
                                                validator: (String? value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'This is required';
                                                  }
                                                  return null;
                                                },
                                                decoration: const InputDecoration(
                                                    labelText: 'Street Number*',
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                    hintText: '116',
                                                    isDense: true,
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10,
                                                            horizontal: 10),
                                                    border:
                                                        OutlineInputBorder())),
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                                controller:
                                                    _streetNameController,
                                                validator: (String? value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'This is required';
                                                  }
                                                  return null;
                                                },
                                                decoration: const InputDecoration(
                                                    labelText: 'Street Name*',
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                    hintText: 'Albert St',
                                                    isDense: true,
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10,
                                                            horizontal: 10),
                                                    border:
                                                        OutlineInputBorder())),
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                                controller:
                                                    _unitNumberController,
                                                validator: (String? value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'This is required';
                                                  }
                                                  return null;
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: 'Unit Number',
                                                  hintText: '300',
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .always,
                                                  isDense: true,
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 10,
                                                          horizontal: 10),
                                                  border: OutlineInputBorder(),
                                                )),
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                                controller: _provinceController,
                                                validator: (String? value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'This is required';
                                                  }
                                                  return null;
                                                },
                                                decoration: const InputDecoration(
                                                    labelText: "Province*",
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                    border:
                                                        OutlineInputBorder(),
                                                    isDense: true,
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10,
                                                            horizontal: 10),
                                                    hintText: 'ON')),
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                                controller: _cityController,
                                                validator: (String? value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'This is required';
                                                  }
                                                  return null;
                                                },
                                                decoration: const InputDecoration(
                                                    labelText: 'City*',
                                                    hintText: 'Ottawa',
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                    isDense: true,
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10,
                                                            horizontal: 10),
                                                    border:
                                                        OutlineInputBorder())),
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                                controller: _countryController,
                                                validator: (String? value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'This is required';
                                                  }
                                                  return null;
                                                },
                                                decoration: const InputDecoration(
                                                    labelText: 'Country*',
                                                    hintText: 'Canada',
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                    isDense: true,
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10,
                                                            horizontal: 10),
                                                    border:
                                                        OutlineInputBorder())),
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                                controller:
                                                    _postalCodeController,
                                                validator: (String? value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'This is required';
                                                  }
                                                  return null;
                                                },
                                                decoration: const InputDecoration(
                                                    labelText: 'Postal Code*',
                                                    hintText: 'K1P 5G3',
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                    isDense: true,
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10,
                                                            horizontal: 10),
                                                    border:
                                                        OutlineInputBorder())),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Text('Year of Residing'),
                                    Container(
                                      color: Colors.white,
                                      height: 70,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 120,
                                            child: DropdownButtonFormField(
                                              value: selectedValue1,
                                              items: [
                                                '12',
                                                '2022',
                                                '2023',
                                                '2024',
                                              ].map((String value) {
                                                return DropdownMenuItem(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              onChanged: (newValue) {
                                                setState(() {
                                                  selectedValue1 =
                                                      newValue as String;
                                                });
                                              },
                                              decoration: const InputDecoration(
                                                labelText: 'Year',
                                                isDense: true,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 10),
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          SizedBox(
                                            width: 120,
                                            child: DropdownButtonFormField(
                                              value: selectedValue2,
                                              items: [
                                                '01',
                                                '02',
                                                '03',
                                                '04',
                                                '05',
                                                '06',
                                                '07',
                                                '08',
                                                '09',
                                                '10',
                                                '11',
                                                '12',
                                              ].map((String value) {
                                                return DropdownMenuItem(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              onChanged: (newValue) {
                                                setState(() {
                                                  selectedValue2 =
                                                      newValue as String;
                                                });
                                              },
                                              decoration: const InputDecoration(
                                                labelText: 'Month',
                                                isDense: true,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 10),
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Text(
                                      'Mailing Address',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      color: Colors.white,
                                      height: 50,
                                      child: Row(
                                        children: [
                                          Checkbox(
                                            value: isChecked,
                                            onChanged: (value) {
                                              handleCheckBox(value);
                                            },
                                          ),
                                          const Text('Same as Home Address')
                                        ],
                                      ),
                                    ),
                                    Container(
                                        color: Colors.white,
                                        height: containerHeight2,
                                        child: checkBox2),
                                    const Text(
                                      'Contact Details',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Container(
                                      color: Colors.white,
                                      height: 615,
                                      child: Column(
                                        children: [
                                          TextFormField(
                                              controller: _emailController,
                                              validator: (String? value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'This is required';
                                                }
                                                return null;
                                              },
                                              decoration: const InputDecoration(
                                                  labelText: 'Email Address*',
                                                  hintText: '7@d1.com',
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .always,
                                                  isDense: true,
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 10,
                                                          horizontal: 10),
                                                  border:
                                                      OutlineInputBorder())),
                                          const SizedBox(height: 30),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: SizedBox(
                                              width: 200,
                                              child: TextFormField(
                                                  controller:
                                                      _homeNumberController,
                                                  validator: (String? value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'This is required';
                                                    }
                                                    return null;
                                                  },
                                                  decoration: const InputDecoration(
                                                      labelText:
                                                          'Home Telephone Number*',
                                                      hintText: '8590762094',
                                                      floatingLabelBehavior:
                                                          FloatingLabelBehavior
                                                              .always,
                                                      isDense: true,
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 10,
                                                              horizontal: 10),
                                                      border:
                                                          OutlineInputBorder())),
                                            ),
                                          ),
                                          const SizedBox(height: 30),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: SizedBox(
                                              width: 200,
                                              child: TextFormField(
                                                  controller:
                                                      _phoneNumberController,
                                                  validator: (String? value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'This is required';
                                                    }
                                                    return null;
                                                  },
                                                  decoration: const InputDecoration(
                                                      labelText:
                                                          'Phone Number*',
                                                      hintText: '8761092546',
                                                      floatingLabelBehavior:
                                                          FloatingLabelBehavior
                                                              .always,
                                                      isDense: true,
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 10,
                                                              horizontal: 10),
                                                      border:
                                                          OutlineInputBorder())),
                                            ),
                                          ),
                                          const Align(
                                            alignment: Alignment.centerLeft,
                                            child: SizedBox(
                                                width: 200,
                                                child: Text(
                                                    'Register for monthly physical statements*')),
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 120,
                                                child: RadioListTile(
                                                  visualDensity:
                                                      VisualDensity.compact,
                                                  title: const Text('Yes'),
                                                  value: 'Yes',
                                                  groupValue: selectedOption1,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      selectedOption1 = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: 120,
                                                child: RadioListTile(
                                                  title: const Text('No'),
                                                  value: 'No',
                                                  groupValue: selectedOption1,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      selectedOption1 = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Align(
                                            alignment: Alignment.centerLeft,
                                            child: SizedBox(
                                                width: 200,
                                                child: Text(
                                                    'Check book required*')),
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 120,
                                                child: RadioListTile(
                                                  title: const Text('Yes'),
                                                  value: 'Yes',
                                                  groupValue: selectedOption2,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      selectedOption2 = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: 120,
                                                child: RadioListTile(
                                                  title: const Text('No'),
                                                  value: 'No',
                                                  groupValue: selectedOption2,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      selectedOption2 = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Align(
                                            alignment: Alignment.centerLeft,
                                            child: SizedBox(
                                                width: 200,
                                                child: Text(
                                                    'Register for monthly physical statements*')),
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 120,
                                                child: RadioListTile(
                                                  visualDensity:
                                                      VisualDensity.compact,
                                                  title: const Text('Yes'),
                                                  value: 'Yes',
                                                  groupValue: selectedOption3,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      selectedOption3 = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: 120,
                                                child: RadioListTile(
                                                  title: const Text('No'),
                                                  value: 'No',
                                                  groupValue: selectedOption3,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      selectedOption3 = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Align(
                                            alignment: Alignment.centerLeft,
                                            child: SizedBox(
                                                width: 480,
                                                child: Text(
                                                  'You will receive your statement by email free of charge. A monthly charge is applicable for physical statements(refer to Disclosure Statement of Fees and Charges for Personal Accounts on icicibank.ca)',
                                                  style:
                                                      TextStyle(wordSpacing: 3),
                                                )),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: OutlinedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  style: OutlinedButton.styleFrom(
                                                      backgroundColor:
                                                          Colors.white,
                                                      side: const BorderSide(
                                                          color: Colors.blue),
                                                      foregroundColor:
                                                          Colors.blue[800],
                                                      shape:
                                                          const RoundedRectangleBorder()),
                                                  child: const Text('Back'),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: MaterialButton(
                                                  onPressed: () {
                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      // Form is valid, perform the desired action

                                                      debugPrint(
                                                          'Form is valid');
                                                    }
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              PersonalInfoPage()),
                                                    );
                                                  },
                                                  textColor: Colors.white,
                                                  color: Colors.blue[900],
                                                  child: const Text('Next'),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          isExpanded: item.isExpanded,
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ));
    }
  }
}
