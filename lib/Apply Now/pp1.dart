import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:poc/Apply%20Now/gic.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:intl/intl.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({Key? key}) : super(key: key);

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  // TextEditingController _cobController = TextEditingController();
  String? isCob;
  bool _isCobFieldValid = false;
  // TextEditingController _naController = TextEditingController();
  String? isNat;
  bool _isNaFieldValid = false;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _ebnController = TextEditingController();
  TextEditingController _ed1Controller = TextEditingController();
  TextEditingController _ed2Controller = TextEditingController();
  TextEditingController _conController = TextEditingController();
  TextEditingController _psController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _pcController = TextEditingController();

  bool? isPh;
  bool showPHError = false;
  bool? isTp;
  bool showTPError = false;
  bool? isTpu;
  bool showTPUError = false;
  bool? isOtp;
  bool showOTPError = false;
  bool acceptance = false;
  bool acceptanceCheck = false;
  String? nop;
  bool showNop = false;
  String? ind;
  bool showInd = false;
  String? emps;
  bool showEmps = false;
  String? pbf;
  bool showPbf = false;

  static const List<String> _countries = <String>[
    'America',
    'CANADA',
    'China',
    'India'
  ];
  static const List<String> _nationalities = <String>[
    'ANDORRA',
    'NATIONALITY 1',
    'NATIONALITY 2'
  ];

  String? year;
  String? month;
  bool showMonthError = false;
  final _formKey = GlobalKey<FormState>();

  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600;
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Personal Details',
          style: TextStyle(
            color: Colors.indigo,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          if (isDesktop(context))
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage('assets/profilePic.jpg'),
                  radius: 20,
                ),
                SizedBox(
                    width: 8), // Adjust the spacing between the avatar and text
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Test'),
                    Text(
                      'last visited 12/01/2024 17:57 IST',
                      style: TextStyle(color: Colors.grey, fontSize: 10.0),
                    ),
                  ],
                ),
                SizedBox(width: 8),
              ],
            ),
          Stack(
            children: [
              Icon(
                Icons.shopping_cart,
                size: 40,
              ),
              Positioned(
                  top: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    child: Text(
                      '2',
                      style: TextStyle(fontSize: 10),
                    ),
                  ))
            ],
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
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            // margin: EdgeInsets.symmetric(horizontal: 245.0),
            padding: EdgeInsets.all(20.0),
            width: 1000,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (isDesktop(context))
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                            ),
                            height: 50.0,
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'We would like to know more about you',
                              style: TextStyle(
                                color: Colors.indigo,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.5,
                              ),
                            ),
                          ),
                        if (isDesktop(context))
                          Container(
                            height: 1.0,
                            color: Colors.blueGrey,
                          ),
                        SizedBox(height: 20.0),
                        if (isDesktop(context))
                          Container(
                            height: 80,
                            child: IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: Autocomplete<String>(
                                            optionsBuilder:
                                                (TextEditingValue countries) {
                                              final String queryc =
                                                  countries.text.toLowerCase();
                                              return _countries
                                                  .where((String country) {
                                                return country
                                                    .toLowerCase()
                                                    .contains(queryc);
                                              });
                                            },
                                            onSelected: (String value) {
                                              setState(() {
                                                isCob = value;
                                                _isCobFieldValid = false;
                                              });
                                            },
                                            fieldViewBuilder: (BuildContext
                                                    context,
                                                TextEditingController
                                                    controller,
                                                FocusNode focusNode,
                                                VoidCallback onFieldSubmitted) {
                                              return TextField(
                                                controller: controller,
                                                focusNode: focusNode,
                                                onSubmitted: (String value) {
                                                  onFieldSubmitted();
                                                },
                                                decoration: InputDecoration(
                                                  labelText:
                                                      'Country of Birth*',
                                                  labelStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 20.0),
                                                  hintText: 'Country of birth',
                                                  hintStyle:
                                                      TextStyle(fontSize: 12.0),
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .always,
                                                  border: OutlineInputBorder(),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        if (_isCobFieldValid)
                                          Container(
                                            padding:
                                                EdgeInsets.only(left: 20.0),
                                            margin: EdgeInsets.only(top: 5.0),
                                            child: Text(
                                              'This field is required',
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.redAccent,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 25.0,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: Autocomplete<String>(
                                            optionsBuilder: (TextEditingValue
                                                nationalities) {
                                              final String queryn =
                                                  nationalities.text
                                                      .toLowerCase();
                                              return _nationalities
                                                  .where((String nationality) {
                                                // return branch.contains(branches.text);
                                                return nationality
                                                    .toLowerCase()
                                                    .contains(queryn);
                                              });
                                            },
                                            onSelected: (String value) {
                                              setState(() {
                                                isNat = value;
                                                _isNaFieldValid = false;
                                              });
                                            },
                                            fieldViewBuilder: (BuildContext
                                                    context,
                                                TextEditingController
                                                    controller,
                                                FocusNode focusNode,
                                                VoidCallback onFieldSubmitted) {
                                              return TextField(
                                                controller: controller,
                                                focusNode: focusNode,
                                                onSubmitted: (String value) {
                                                  onFieldSubmitted();
                                                },
                                                decoration: InputDecoration(
                                                  labelText: 'Nationality*',
                                                  labelStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 20.0),
                                                  hintText: 'Nationality',
                                                  hintStyle:
                                                      TextStyle(fontSize: 12.0),
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .always,
                                                  border: OutlineInputBorder(),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        if (_isNaFieldValid)
                                          Container(
                                            padding:
                                                EdgeInsets.only(left: 20.0),
                                            margin: EdgeInsets.only(top: 5.0),
                                            child: Text(
                                              'This field is required',
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.redAccent,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (isMobile(context))
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Autocomplete<String>(
                                  optionsBuilder: (TextEditingValue countries) {
                                    final String queryc =
                                        countries.text.toLowerCase();
                                    return _countries.where((String country) {
                                      return country
                                          .toLowerCase()
                                          .contains(queryc);
                                    });
                                  },
                                  onSelected: (String value) {
                                    setState(() {
                                      isCob = value;
                                      _isCobFieldValid = false;
                                    });
                                  },
                                  fieldViewBuilder: (BuildContext context,
                                      TextEditingController controller,
                                      FocusNode focusNode,
                                      VoidCallback onFieldSubmitted) {
                                    return TextField(
                                      controller: controller,
                                      focusNode: focusNode,
                                      onSubmitted: (String value) {
                                        onFieldSubmitted();
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'Country of Birth*',
                                        labelStyle: TextStyle(
                                            color: Colors.grey, fontSize: 20.0),
                                        hintText: 'Country of birth',
                                        hintStyle: TextStyle(fontSize: 12.0),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        border: OutlineInputBorder(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              if (_isCobFieldValid)
                                Container(
                                  padding: EdgeInsets.only(left: 20.0),
                                  margin: EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    'This field is required',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Autocomplete<String>(
                                  optionsBuilder:
                                      (TextEditingValue nationalities) {
                                    final String queryn =
                                        nationalities.text.toLowerCase();
                                    return _nationalities
                                        .where((String nationality) {
                                      // return branch.contains(branches.text);
                                      return nationality
                                          .toLowerCase()
                                          .contains(queryn);
                                    });
                                  },
                                  onSelected: (String value) {
                                    setState(() {
                                      isNat = value;
                                      _isNaFieldValid = false;
                                    });
                                  },
                                  fieldViewBuilder: (BuildContext context,
                                      TextEditingController controller,
                                      FocusNode focusNode,
                                      VoidCallback onFieldSubmitted) {
                                    return TextField(
                                      controller: controller,
                                      focusNode: focusNode,
                                      onSubmitted: (String value) {
                                        onFieldSubmitted();
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'Nationality*',
                                        labelStyle: TextStyle(
                                            color: Colors.grey, fontSize: 20.0),
                                        hintText: 'Nationality',
                                        hintStyle: TextStyle(fontSize: 12.0),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        border: OutlineInputBorder(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              if (_isNaFieldValid)
                                Container(
                                  padding: EdgeInsets.only(left: 20.0),
                                  margin: EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    'This field is required',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: RichText(
                            text: TextSpan(
                              text: 'Learn more about PEP,HIO  ',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16.0),
                              children: [
                                TextSpan(
                                  text: '(Click here)',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      _launchURL('https://www.icicibank.ca/');
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Are you a PEP or HIO?*',
                            style: TextStyle(
                              fontSize: 16.5,
                              // color: Colors.grey
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 13.0),
                            Radio(
                              value: true,
                              groupValue: isPh,
                              onChanged: (value) {
                                setState(() {
                                  isPh = value;
                                  showPHError = false;
                                });
                              },
                              activeColor: Colors.deepOrangeAccent,
                            ),
                            Text(
                              'Yes',
                              style: TextStyle(fontSize: 17.0),
                            ),
                            Radio(
                              value: false,
                              groupValue: isPh,
                              onChanged: (value) {
                                setState(() {
                                  isPh = value;
                                  showPHError = false;
                                });
                              },
                              activeColor: Colors.deepOrangeAccent,
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 17.0),
                            ),
                          ],
                        ),
                        if (showPHError)
                          Container(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Text(
                              'This field is required',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        SizedBox(height: 8.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Are you a tax paying resident of Canada?*',
                            style: TextStyle(
                              fontSize: 16.5,
                              // color: Colors.grey
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 13.0),
                            Radio(
                              value: true,
                              groupValue: isTp,
                              onChanged: (value) {
                                setState(() {
                                  isTp = value;
                                  showTPError = false;
                                });
                              },
                              activeColor: Colors.deepOrangeAccent,
                            ),
                            Text(
                              'Yes',
                              style: TextStyle(fontSize: 17.0),
                            ),
                            Radio(
                              value: false,
                              groupValue: isTp,
                              onChanged: (value) {
                                setState(() {
                                  isTp = value;
                                  showTPError = false;
                                });
                              },
                              activeColor: Colors.deepOrangeAccent,
                            ),
                            Text('No', style: TextStyle(fontSize: 17.0)),
                          ],
                        ),
                        if (showTPError)
                          Container(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Text(
                              'This field is required',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        SizedBox(height: 13.0),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          width: 400.0,
                          child: TextFormField(
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: 'Social Insurance Number(optional)',
                              labelStyle:
                                  TextStyle(color: Colors.grey, fontSize: 20.0),
                              hintStyle: TextStyle(fontSize: 12.0),
                              hintText: 'Social Insurance Number',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Container(
                          width: 460.0,
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: RichText(
                            text: TextSpan(
                              text:
                                  'If you need help with your tax residency  information please visit Income Tax Folio, S5-F1-C1 - ',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 15.0),
                              children: [
                                TextSpan(
                                  text:
                                      'Determining an Individual\'s Residence Status ',
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                                TextSpan(
                                  text:
                                      ', on the CRA website or consult your tax advisor.',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.5,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Are you a tax paying resident of United States?*',
                            style: TextStyle(
                              fontSize: 16.5,
                              // color: Colors.grey
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 13.0),
                            Radio(
                              value: true,
                              groupValue: isTpu,
                              onChanged: (value) {
                                setState(() {
                                  isTpu = value;
                                  showTPUError = false;
                                });
                              },
                              activeColor: Colors.deepOrangeAccent,
                            ),
                            Text(
                              'Yes',
                              style: TextStyle(fontSize: 17.0),
                            ),
                            Radio(
                              value: false,
                              groupValue: isTpu,
                              onChanged: (value) {
                                setState(() {
                                  isTpu = value;
                                });
                              },
                              activeColor: Colors.deepOrangeAccent,
                            ),
                            Text('No', style: TextStyle(fontSize: 17.0)),
                          ],
                        ),
                        if (showTPUError)
                          Container(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Text(
                              'This field is required',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Container(
                          width: 400.0,
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Are you a tax paying resident of a jurisdiction other than Canada and United States?*',
                            style: TextStyle(
                              fontSize: 16.5,
                              // color: Colors.grey
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 13.0),
                            Radio(
                              value: true,
                              groupValue: isOtp,
                              onChanged: (value) {
                                setState(() {
                                  isOtp = value;
                                  showOTPError = false;
                                });
                              },
                              activeColor: Colors.deepOrangeAccent,
                            ),
                            Text(
                              'Yes',
                              style: TextStyle(fontSize: 17.0),
                            ),
                            Radio(
                              value: false,
                              groupValue: isOtp,
                              onChanged: (value) {
                                setState(() {
                                  isOtp = value;
                                  showOTPError = false;
                                });
                              },
                              activeColor: Colors.deepOrangeAccent,
                            ),
                            Text('No', style: TextStyle(fontSize: 17.0)),
                          ],
                        ),
                        if (showOTPError)
                          Container(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Text(
                              'This field is required',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        SizedBox(height: 8.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 13.0),
                            Checkbox(
                              value: acceptance,
                              onChanged: (value) {
                                setState(() {
                                  acceptance = value!;
                                });
                              },
                              activeColor: Colors.deepOrangeAccent,
                            ),
                            Flexible(
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'I certify that the information given on this form is correct and complete. I will give ICICI Bank Canada a new form within 30 days of any change in circumstances that causes the information om this form to become incomplete, untrue or inaccurate.',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20.0)
                          ],
                        ),
                        if (acceptanceCheck)
                          Container(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Text(
                              'This field is required',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (isDesktop(context))
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                            ),
                            height: 50.0,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'What is your Occupation ?',
                              style: TextStyle(
                                color: Colors.indigo,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.5,
                              ),
                            ),
                          ),
                        if (isDesktop(context))
                          Container(
                            height: 1.0,
                            color: Colors.blueGrey,
                          ),
                        SizedBox(height: 40.0),
                        if (isDesktop(context))
                          Container(
                            height: 90,
                            child: IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child:
                                              DropdownButtonFormField<String>(
                                            decoration: InputDecoration(
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.always,
                                              border: OutlineInputBorder(),
                                              labelText:
                                                  'Nature of Profession*',
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 20.0),
                                              hintText:
                                                  'Select Nature of Profession',
                                              hintStyle:
                                                  TextStyle(fontSize: 12.0),
                                            ),
                                            value: nop,
                                            onChanged: (value) {
                                              setState(() {
                                                nop = value;
                                              });
                                            },
                                            items: <String>[
                                              'Salaried',
                                              'Option 1',
                                              'Option 2'
                                            ].map((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                        if (showNop)
                                          Container(
                                            padding:
                                                EdgeInsets.only(left: 30.0),
                                            margin:
                                                EdgeInsets.only(bottom: 10.0),
                                            child: Text(
                                              'This field is required',
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.redAccent,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 25.0),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: DropdownButtonFormField<String>(
                                          decoration: InputDecoration(
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            border: OutlineInputBorder(),
                                            labelText: 'Industry*',
                                            labelStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 20.0),
                                            hintText: 'Select Industry',
                                            hintStyle:
                                                TextStyle(fontSize: 12.0),
                                          ),
                                          value: ind,
                                          onChanged: (value) {
                                            setState(() {
                                              ind = value;
                                            });
                                          },
                                          items: <String>[
                                            'Option 1',
                                            'Option 2'
                                          ].map((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                      if (showInd)
                                        Container(
                                          padding: EdgeInsets.only(left: 30.0),
                                          margin: EdgeInsets.only(bottom: 10.0),
                                          child: Text(
                                            'This field is required',
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.redAccent,
                                            ),
                                          ),
                                        ),
                                    ],
                                  )),
                                ],
                              ),
                            ),
                          ),
                        if (isMobile(context))
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    border: OutlineInputBorder(),
                                    labelText: 'Nature of Profession*',
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 20.0),
                                    hintText: 'Select Nature of Profession',
                                    hintStyle: TextStyle(fontSize: 12.0),
                                  ),
                                  value: nop,
                                  onChanged: (value) {
                                    setState(() {
                                      nop = value;
                                    });
                                  },
                                  items: <String>[
                                    'Salaried',
                                    'Option 1',
                                    'Option 2'
                                  ].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                              if (showNop)
                                Container(
                                  padding: EdgeInsets.only(left: 30.0),
                                  margin: EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    'This field is required',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ),
                              SizedBox(
                                height: 40.0,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    border: OutlineInputBorder(),
                                    labelText: 'Industry*',
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 20.0),
                                    hintText: 'Select Industry',
                                    hintStyle: TextStyle(fontSize: 12.0),
                                  ),
                                  value: ind,
                                  onChanged: (value) {
                                    setState(() {
                                      ind = value;
                                    });
                                  },
                                  items: <String>['Option 1', 'Option 2']
                                      .map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                              if (showInd)
                                Container(
                                  padding: EdgeInsets.only(left: 30.0),
                                  margin: EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    'This field is required',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ),
                              SizedBox(
                                height: 40.0,
                              ),
                            ],
                          ),
                        if (isDesktop(context))
                          Container(
                            height: 90,
                            child: IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: TextFormField(
                                        controller: _titleController,
                                        decoration: InputDecoration(
                                          labelText: 'Title*',
                                          labelStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 20.0),
                                          hintText: 'title',
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          hintStyle: TextStyle(fontSize: 12.0),
                                          border: OutlineInputBorder(),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'This field is required';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 25.0),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child:
                                              DropdownButtonFormField<String>(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: 'Employment Status*',
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 20.0),
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.always,
                                              hintText:
                                                  'Select employment Status',
                                              hintStyle:
                                                  TextStyle(fontSize: 12.0),
                                            ),
                                            value: emps,
                                            onChanged: (value) {
                                              setState(() {
                                                emps = value;
                                              });
                                            },
                                            items: <String>[
                                              'Option 1',
                                              'Option 2'
                                            ].map((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                        if (showEmps)
                                          Container(
                                            padding:
                                                EdgeInsets.only(left: 30.0),
                                            child: Text(
                                              'This field is required',
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.redAccent,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (isMobile(context))
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: TextFormField(
                                  controller: _titleController,
                                  decoration: InputDecoration(
                                    labelText: 'Title*',
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 20.0),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    hintText: 'title',
                                    hintStyle: TextStyle(fontSize: 12.0),
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field is required';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 40.0,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Employment Status*',
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 20.0),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    hintText: 'Select employment Status',
                                    hintStyle: TextStyle(fontSize: 12.0),
                                  ),
                                  value: emps,
                                  onChanged: (value) {
                                    setState(() {
                                      emps = value;
                                    });
                                  },
                                  items: <String>['Option 1', 'Option 2']
                                      .map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                              if (showEmps)
                                Container(
                                  margin: EdgeInsets.only(top: 5.0),
                                  padding: EdgeInsets.only(left: 30.0),
                                  child: Text(
                                    'This field is required',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ),
                              SizedBox(
                                height: 20.0,
                              ),
                            ],
                          ),
                        SizedBox(height: 10.0),
                        if (isDesktop(context))
                          Container(
                            height: 90,
                            child: IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child:
                                              DropdownButtonFormField<String>(
                                            decoration: InputDecoration(
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.always,
                                              border: OutlineInputBorder(),
                                              labelText:
                                                  'Primary Business Function*',
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 20.0),
                                              hintText:
                                                  'Select Primary Business Function',
                                              hintStyle:
                                                  TextStyle(fontSize: 12.0),
                                            ),
                                            value: pbf,
                                            onChanged: (value) {
                                              setState(() {
                                                pbf = value;
                                              });
                                            },
                                            items: <String>[
                                              'Option 1',
                                              'Option 2'
                                            ].map((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                        if (showPbf)
                                          Container(
                                            padding:
                                                EdgeInsets.only(left: 30.0),
                                            margin:
                                                EdgeInsets.only(bottom: 10.0),
                                            child: Text(
                                              'This field is required',
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.redAccent,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 25.0),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: TextFormField(
                                        controller: _ebnController,
                                        decoration: InputDecoration(
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          labelText:
                                              'Employer or Business Name*',
                                          labelStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 20.0),
                                          hintText: 'Company Name',
                                          hintStyle: TextStyle(fontSize: 12.0),
                                          border: OutlineInputBorder(),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'This field is required';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (isMobile(context))
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    border: OutlineInputBorder(),
                                    labelText: 'Primary Business Function*',
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 20.0),
                                    hintText:
                                        'Select Primary Business Function',
                                    hintStyle: TextStyle(fontSize: 12.0),
                                  ),
                                  value: pbf,
                                  onChanged: (value) {
                                    setState(() {
                                      pbf = value;
                                    });
                                  },
                                  items: <String>['Option 1', 'Option 2']
                                      .map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                              if (showPbf)
                                Container(
                                  padding: EdgeInsets.only(left: 30.0),
                                  margin: EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    'This field is required',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                ),
                              SizedBox(
                                height: 40.0,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: TextFormField(
                                  controller: _ebnController,
                                  decoration: InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    labelText: 'Employer or Business Name*',
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 20.0),
                                    hintText: 'Company Name',
                                    hintStyle: TextStyle(fontSize: 12.0),
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field is required';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        SizedBox(height: 10.0),
                        if (isDesktop(context))
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: TextFormField(
                                    controller: _ed1Controller,
                                    decoration: InputDecoration(
                                      labelText: 'Employer Address 1*',
                                      hintText: 'Address',
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      labelStyle: TextStyle(
                                          color: Colors.grey, fontSize: 20.0),
                                      hintStyle: TextStyle(fontSize: 12.0),
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(width: 25.0),
                              Expanded(
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: TextFormField(
                                    controller: _ed2Controller,
                                    decoration: InputDecoration(
                                      labelText: 'Employer Address 2',
                                      hintText: 'Address',
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      labelStyle: TextStyle(
                                          color: Colors.grey, fontSize: 20.0),
                                      hintStyle: TextStyle(fontSize: 12.0),
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        if (isMobile(context))
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: TextFormField(
                                  controller: _ed1Controller,
                                  decoration: InputDecoration(
                                    labelText: 'Employer Address 1*',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 20.0),
                                    hintStyle: TextStyle(fontSize: 12.0),
                                    hintText: 'Address',
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field is required';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 40.0,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: TextFormField(
                                  controller: _ed2Controller,
                                  decoration: InputDecoration(
                                    labelText: 'Employer Address 2',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 20.0),
                                    hintStyle: TextStyle(fontSize: 12.0),
                                    hintText: 'Address',
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field is required';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        SizedBox(height: 40.0),
                        if (isDesktop(context))
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: TextFormField(
                                    controller: _conController,
                                    decoration: InputDecoration(
                                      labelText: 'Country*',
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      labelStyle: TextStyle(
                                          color: Colors.grey, fontSize: 20.0),
                                      hintStyle: TextStyle(fontSize: 12.0),
                                      hintText: 'Country',
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(width: 25.0),
                              Expanded(
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: TextFormField(
                                    controller: _psController,
                                    decoration: InputDecoration(
                                      labelText: 'Province/State*',
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      labelStyle: TextStyle(
                                          color: Colors.grey, fontSize: 20.0),
                                      hintStyle: TextStyle(fontSize: 12.0),
                                      hintText: 'Province/State',
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        if (isMobile(context))
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: TextFormField(
                                  controller: _conController,
                                  decoration: InputDecoration(
                                    labelText: 'Country*',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 20.0),
                                    hintStyle: TextStyle(fontSize: 12.0),
                                    hintText: 'Country',
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field is required';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 40.0,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: TextFormField(
                                  controller: _psController,
                                  decoration: InputDecoration(
                                    labelText: 'Province/State*',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 20.0),
                                    hintStyle: TextStyle(fontSize: 12.0),
                                    hintText: 'Province/State',
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field is required';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        SizedBox(height: 40.0),
                        if (isDesktop(context))
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: TextFormField(
                                    controller: _cityController,
                                    decoration: InputDecoration(
                                      labelText: 'City*',
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      labelStyle: TextStyle(
                                          color: Colors.grey, fontSize: 20.0),
                                      hintStyle: TextStyle(fontSize: 12.0),
                                      hintText: 'City',
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(width: 25.0),
                              Expanded(
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: TextFormField(
                                    controller: _pcController,
                                    decoration: InputDecoration(
                                      labelText: 'Postal Code*',
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      labelStyle: TextStyle(
                                          color: Colors.grey, fontSize: 20.0),
                                      hintStyle: TextStyle(fontSize: 12.0),
                                      hintText: 'Postal Code',
                                      border: OutlineInputBorder(),
                                    ),
                                    initialValue: null,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        if (isMobile(context))
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: TextFormField(
                                  controller: _cityController,
                                  decoration: InputDecoration(
                                    labelText: 'City*',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 20.0),
                                    hintStyle: TextStyle(fontSize: 12.0),
                                    hintText: 'City',
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field is required';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 40.0,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: TextFormField(
                                  controller: _pcController,
                                  decoration: InputDecoration(
                                    labelText: 'Postal Code*',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 20.0),
                                    hintStyle: TextStyle(fontSize: 12.0),
                                    hintText: 'Postal Code',
                                    border: OutlineInputBorder(),
                                  ),
                                  initialValue: null,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field is required';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            'Length of Time Employed',
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              width: 170.0, // Adjust the width as needed
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Year*',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  labelStyle: TextStyle(
                                      color: Colors.grey, fontSize: 20.0),
                                  hintText: '00',
                                  hintStyle: TextStyle(fontSize: 12.0),
                                ),
                                value: year,
                                onChanged: (value) {
                                  setState(() {
                                    year = value;
                                  });
                                },
                                items: <String>['00', 'Option 1', 'Option 2']
                                    .map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Container(
                              width: 160.0, // Adjust the width as needed
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Month*',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  labelStyle: TextStyle(
                                      color: Colors.grey, fontSize: 20.0),
                                  hintText: '00',
                                  hintStyle: TextStyle(fontSize: 12.0),
                                ),
                                value: month,
                                onChanged: (value) {
                                  setState(() {
                                    month = value;
                                  });
                                },
                                items: <String>[
                                  '00',
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
                                  '11'
                                ].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        if (showMonthError)
                          Container(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Text(
                              'Both year and month are required',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          margin: EdgeInsets.all(20.0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: null,
                                  side: BorderSide(color: Colors.indigo),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  shadowColor: Colors.white,
                                ),
                                child: Text(
                                  'Back',
                                  style: TextStyle(color: Colors.indigo),
                                ),
                              ),
                              Expanded(child: Container()),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _isCobFieldValid = isCob == null;
                                    _isNaFieldValid = isNat == null;
                                    showPHError = isPh == null;
                                    showTPError = isTp == null;
                                    showTPUError = isTpu == null;
                                    showOTPError = isOtp == null;
                                    acceptanceCheck = !acceptance;
                                    showMonthError =
                                        month == null || year == null;
                                    showNop = nop == null;
                                    showInd = ind == null;
                                    showEmps = emps == null;
                                    showPbf = pbf == null;
                                  });
                                  if (_formKey.currentState!.validate()) {}
                                  if (isPh != null &&
                                      isTp != null &&
                                      isTpu != null &&
                                      isOtp != null &&
                                      acceptance == true &&
                                      month != null &&
                                      year != null &&
                                      _formKey.currentState!.validate()) {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(

                                    //         builder: (context) =>
                                    //             AppBarShadowExtension() ));
                                  }
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GICForm()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.indigo,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  shadowColor: Colors.white,
                                ),
                                child: Text(
                                  'Next',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: const Text('pp1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
