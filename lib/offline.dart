import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poc/Verification/kyc.dart';
import 'package:poc/welcome.dart';

class OfflinePage extends StatefulWidget {
  const OfflinePage({Key? key}) : super(key: key);

  @override
  State<OfflinePage> createState() => _OfflinePageState();
}

class _OfflinePageState extends State<OfflinePage> {
  final _formKey = GlobalKey<FormState>();
  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600;
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  String? pmyn;
  String? dtype;
  String? dtype1;
  DateTime? selectedDate;
  TextEditingController dateController = TextEditingController();
  DateTime? selectedDate1;
  TextEditingController dateController1 = TextEditingController();
  DateTime? selectedDate2;
  TextEditingController dateController2 = TextEditingController();
  DateTime? selectedDate3;
  TextEditingController dateController3 = TextEditingController();
  late ImagePicker _imagePicker;
  String? isFileSelected = "";
  String? isFileSelected1 = "";

  static const List<String> _branches = <String>[
    'Kitchener Waterloo',
    'k example',
    'Sample 1',
    'sample2'
  ];
  static const List<String> _countries = <String>[
    'America',
    'CANADA',
    'China',
    'India'
  ];
  static const List<String> _provinces = <String>[
    'ALBERTA',
    'PROVINCE 1',
    'PROVINCE 2'
  ];
  static const List<String> _countries1 = <String>[
    'America',
    'CANADA',
    'China',
    'India'
  ];

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      isFileSelected = "File Uploaded";
    });
  }

  Future<void> _pickImage1() async {
    final pickedFile1 =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      isFileSelected1 = "File Uploaded";
    });
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      controller.text = DateFormat('MM/dd/yyyy').format(picked);
    }
  }

  Widget _buildPoint(String number, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 50.0),
              child: Center(
                child: Text(
                  number,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            SizedBox(width: 13.0),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(right: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double containerHeight = isMobile(context) ? 180.0 : 160.0;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Verification',
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
                  backgroundImage: NetworkImage('assets/images/profilePic.jpg'),
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
                // Icon(Icons.shopping_cart),
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
            ),
          if (isMobile(context))
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
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            width: 1000,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (isMobile(context))
                    Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      height: 50.0,
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'In-Person Verification',
                        style: TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.5,
                        ),
                      ),
                    ),
                  if (isDesktop(context))
                    SizedBox(
                      height: 20.0,
                    ),
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
                              'In-Person Verification',
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
                        Container(
                          height: containerHeight,
                          margin: EdgeInsets.all(15.0),
                          padding: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'To complete the activation, you are required to fulfill an in-person verification at our branch or through Canada post, depending upon your location and convenience',
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(text: 'Address :  '),
                                    TextSpan(
                                      text: 'Ottawa, ON K1P 5G3, Canada',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 30.0,
                                    color: Colors.deepOrangeAccent,
                                  ),
                                  Text(
                                    'Open in Maps',
                                    style: TextStyle(
                                        color: Colors.deepOrangeAccent),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            'Please Select Your Preferred Method*',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        if (isDesktop(context))
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 14,
                              ),
                              Radio(
                                value: 'Yes',
                                groupValue: pmyn,
                                onChanged: (value) {
                                  setState(() {
                                    pmyn = value.toString();
                                  });
                                },
                                activeColor: Colors.deepOrangeAccent,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/canadaPost.png',
                                        width: 210,
                                      ),
                                      Text(
                                        ' #',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Supported By '),
                                      Image.asset(
                                        'assets/images/backCheck.jpg',
                                        height: 50,
                                        width: 130,
                                      ),
                                      Text(
                                        '^',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '# Trademark of canada Post',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    '^ Trademark of Sterling Solutions',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 50.0,
                              ),
                              Radio(
                                value: 'No',
                                groupValue: pmyn,
                                onChanged: (value) {
                                  setState(() {
                                    pmyn = value.toString();
                                  });
                                },
                                activeColor: Colors.deepOrangeAccent,
                              ),
                              Image.asset(
                                'assets/images/iciciBankCanada.jpg',
                                width: 200,
                              ),
                            ],
                          ),
                        if (isMobile(context))
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Radio(
                                    value: 'Yes',
                                    groupValue: pmyn,
                                    onChanged: (value) {
                                      setState(() {
                                        pmyn = value.toString();
                                      });
                                    },
                                    activeColor: Colors.deepOrangeAccent,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/canadaPost.png',
                                            width: 210,
                                          ),
                                          Text(
                                            '  #',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('Supported By '),
                                          Image.asset(
                                            'assets/images/backCheck.jpg',
                                            height: 50,
                                            width: 130,
                                          ),
                                          Text(
                                            '^',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '# Trademark of canada Post',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        '^ Trademark of Sterling Solutions',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: 'No',
                                    groupValue: pmyn,
                                    onChanged: (value) {
                                      setState(() {
                                        pmyn = value.toString();
                                      });
                                    },
                                    activeColor: Colors.deepOrangeAccent,
                                  ),
                                  Image.asset(
                                    'assets/images/iciciBankCanada.jpg',
                                    width: 200,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            'To complete the verification process, visit any ICICI Bank CANADA branch with following documents:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        _buildPoint('1.', 'Your original passport'),
                        _buildPoint('2.', 'Your landing document'),
                        _buildPoint('3.',
                            'ABM or Bank Card issued by member of CPA with your name and signature on the same or Credit Card issued by a member of CPA with your signature on the same'),
                        _buildPoint('4.',
                            'CoB issued to you (if applicable) Branch staff will help you activate your account and debit card'),
                        _buildPoint('5.',
                            'Documents considered as Landing Document are Work Permit, Study Permit, PR Card or CoPR with immigration seal.'),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          width: 465.0,
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Autocomplete<String>(
                            optionsBuilder: (TextEditingValue branches) {
                              final String query = branches.text.toLowerCase();
                              return _branches.where((String branch) {
                                // return branch.contains(branches.text);
                                return branch.toLowerCase().contains(query);
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
                                  labelText:
                                      'Please select a ICICI Bank branch from the list below*',
                                  labelStyle: TextStyle(
                                      color: Colors.grey, fontSize: 16.0),
                                  hintText: 'Bank Branch',
                                  hintStyle: TextStyle(fontSize: 12.0),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  border: OutlineInputBorder(),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            'ID 1',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          width: 465.0,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: OutlineInputBorder(),
                              labelText: 'Document Type*',
                              labelStyle:
                                  TextStyle(color: Colors.grey, fontSize: 20.0),
                              hintText: 'Document type',
                              hintStyle: TextStyle(fontSize: 12.0),
                            ),
                            value: dtype,
                            onChanged: (value) {
                              setState(() {
                                dtype = value;
                              });
                            },
                            items: <String>[
                              'Provincial ID',
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
                        SizedBox(
                          height: 20.0,
                        ),
                        if (isDesktop(context))
                          Container(
                            height: 110,
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
                                          child: Text(
                                            'Please select the country from below list',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.0,
                                        ),
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
                                                // return branch.contains(branches.text);
                                                return country
                                                    .toLowerCase()
                                                    .contains(queryc);
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
                                                  labelText: 'Country*',
                                                  labelStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 20.0),
                                                  hintText: 'Country',
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
                                          child: Text(
                                            'Please select the province from below list',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: Autocomplete<String>(
                                            optionsBuilder:
                                                (TextEditingValue provinces) {
                                              final String queryp =
                                                  provinces.text.toLowerCase();
                                              return _provinces
                                                  .where((String province) {
                                                // return branch.contains(branches.text);
                                                return province
                                                    .toLowerCase()
                                                    .contains(queryp);
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
                                                  labelText: 'Province*',
                                                  labelStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 20.0),
                                                  hintText: 'Province',
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
                                child: Text(
                                  'Please select the country from below list',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                width: 465.0,
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Autocomplete<String>(
                                  optionsBuilder: (TextEditingValue countries) {
                                    final String queryc =
                                        countries.text.toLowerCase();
                                    return _countries.where((String country) {
                                      // return branch.contains(branches.text);
                                      return country
                                          .toLowerCase()
                                          .contains(queryc);
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
                                        labelText: 'Country*',
                                        labelStyle: TextStyle(
                                            color: Colors.grey, fontSize: 20.0),
                                        hintText: 'Country',
                                        hintStyle: TextStyle(fontSize: 12.0),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        border: OutlineInputBorder(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Text(
                                  'Please select the province from below list',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                width: 465.0,
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Autocomplete<String>(
                                  optionsBuilder: (TextEditingValue provinces) {
                                    final String queryp =
                                        provinces.text.toLowerCase();
                                    return _provinces.where((String province) {
                                      // return branch.contains(branches.text);
                                      return province
                                          .toLowerCase()
                                          .contains(queryp);
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
                                        labelText: 'Province*',
                                        labelStyle: TextStyle(
                                            color: Colors.grey, fontSize: 20.0),
                                        hintText: 'Province',
                                        hintStyle: TextStyle(fontSize: 12.0),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        border: OutlineInputBorder(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        SizedBox(height: 20.0),
                        if (isDesktop(context))
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Document Number*',
                                      labelStyle: TextStyle(
                                          color: Colors.grey, fontSize: 20.0),
                                      hintText: 'Document number',
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      hintStyle: TextStyle(fontSize: 12.0),
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 25.0),
                              Expanded(
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: TextField(
                                    controller: dateController,
                                    decoration: InputDecoration(
                                      labelText: 'Issuance Date*',
                                      labelStyle: TextStyle(
                                          color: Colors.grey, fontSize: 20.0),
                                      hintText: 'MM/DD/YYYY',
                                      hintStyle: TextStyle(fontSize: 12.0),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      border: OutlineInputBorder(),
                                      suffixIcon: GestureDetector(
                                        onTap: () => _selectDate(
                                            context, dateController),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.calendar_today),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        if (isMobile(context))
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Document Number*',
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 20.0),
                                    hintText: 'Document number',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    hintStyle: TextStyle(fontSize: 12.0),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: TextField(
                                  controller: dateController,
                                  decoration: InputDecoration(
                                    labelText: 'Issuance Date*',
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 20.0),
                                    hintText: 'MM/DD/YYYY',
                                    hintStyle: TextStyle(fontSize: 12.0),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    border: OutlineInputBorder(),
                                    suffixIcon: GestureDetector(
                                      onTap: () =>
                                          _selectDate(context, dateController),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.calendar_today),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        SizedBox(
                          height: 20.0,
                        ),
                        if (isDesktop(context))
                          Container(
                            height: 70,
                            child: IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: TextField(
                                            controller: dateController1,
                                            decoration: InputDecoration(
                                              labelText: 'Expiry Date*',
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 20.0),
                                              hintText: 'MM/DD/YYYY',
                                              hintStyle:
                                                  TextStyle(fontSize: 12.0),
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.always,
                                              border: OutlineInputBorder(),
                                              suffixIcon: GestureDetector(
                                                onTap: () => _selectDate(
                                                    context, dateController1),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Icon(
                                                      Icons.calendar_today),
                                                ),
                                              ),
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
                                      children: [
                                        ElevatedButton(
                                          onPressed: _pickImage,
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                              side: BorderSide(
                                                  color: Colors.blue, width: 2),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(Icons.upload_file),
                                              Text('Upload Document',
                                                  style:
                                                      TextStyle(fontSize: 10)),
                                            ],
                                          ),
                                        ),
                                        Text('$isFileSelected',
                                            style: TextStyle(fontSize: 12)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (isMobile(context))
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                // width: 465.0,
                                child: TextField(
                                  controller: dateController1,
                                  decoration: InputDecoration(
                                    labelText: 'Expiry Date*',
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 20.0),
                                    hintText: 'MM/DD/YYYY',
                                    hintStyle: TextStyle(fontSize: 12.0),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    border: OutlineInputBorder(),
                                    suffixIcon: GestureDetector(
                                      onTap: () =>
                                          _selectDate(context, dateController1),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.calendar_today),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              ElevatedButton(
                                onPressed: _pickImage,
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        0), // Set button shape to rectangular with no rounded corners
                                    side: BorderSide(
                                        color: Colors.blue,
                                        width: 2), // Set border color and width
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.upload_file),
                                    Text('Upload Document',
                                        style: TextStyle(fontSize: 10)),
                                  ],
                                ),
                              ),
                              Text('$isFileSelected',
                                  style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            'ID 2',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          width: 465.0,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: OutlineInputBorder(),
                              labelText: 'Document Type*',
                              labelStyle:
                                  TextStyle(color: Colors.grey, fontSize: 20.0),
                              hintText: 'Document type',
                              hintStyle: TextStyle(fontSize: 12.0),
                            ),
                            value: dtype1,
                            onChanged: (value) {
                              setState(() {
                                dtype1 = value;
                              });
                            },
                            items: <String>[
                              'Provincial ID',
                              'ABM or Bank Card issued by member\nof CPA with your name and signature',
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
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            'Please select the country from below list',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        if (isDesktop(context))
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  width: 465.0,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Autocomplete<String>(
                                    optionsBuilder:
                                        (TextEditingValue countries) {
                                      final String queryc1 =
                                          countries.text.toLowerCase();
                                      return _countries1
                                          .where((String country1) {
                                        // return branch.contains(branches.text);
                                        return country1
                                            .toLowerCase()
                                            .contains(queryc1);
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
                                          labelText: 'Country*',
                                          labelStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 20.0),
                                          hintText: 'Country',
                                          hintStyle: TextStyle(fontSize: 12.0),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          border: OutlineInputBorder(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 25.0,
                              ),
                              Expanded(
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Issuing Bank*',
                                      labelStyle: TextStyle(
                                          color: Colors.grey, fontSize: 20.0),
                                      hintText: 'Bank',
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      hintStyle: TextStyle(fontSize: 12.0),
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        if (isMobile(context))
                          Column(
                            children: [
                              Container(
                                width: 465.0,
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Autocomplete<String>(
                                  optionsBuilder: (TextEditingValue countries) {
                                    final String queryc1 =
                                        countries.text.toLowerCase();
                                    return _countries1.where((String country1) {
                                      // return branch.contains(branches.text);
                                      return country1
                                          .toLowerCase()
                                          .contains(queryc1);
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
                                        labelText: 'Country*',
                                        labelStyle: TextStyle(
                                            color: Colors.grey, fontSize: 20.0),
                                        hintText: 'Country',
                                        hintStyle: TextStyle(fontSize: 12.0),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        border: OutlineInputBorder(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Issuing Bank*',
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 20.0),
                                    hintText: 'Bank',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    hintStyle: TextStyle(fontSize: 12.0),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        SizedBox(
                          height: 20.0,
                        ),
                        if (isDesktop(context))
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Card Number*',
                                      labelStyle: TextStyle(
                                          color: Colors.grey, fontSize: 20.0),
                                      hintText: 'Card number',
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      hintStyle: TextStyle(fontSize: 12.0),
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 25.0),
                              Expanded(
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: TextField(
                                    controller: dateController2,
                                    decoration: InputDecoration(
                                      labelText: 'Issuance Date*',
                                      labelStyle: TextStyle(
                                          color: Colors.grey, fontSize: 20.0),
                                      hintText: 'MM/DD/YYYY',
                                      hintStyle: TextStyle(fontSize: 12.0),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      border: OutlineInputBorder(),
                                      suffixIcon: GestureDetector(
                                        onTap: () => _selectDate(
                                            context, dateController2),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(Icons.calendar_today),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        if (isMobile(context))
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Card Number*',
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 20.0),
                                    hintText: 'Card number',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    hintStyle: TextStyle(fontSize: 12.0),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: TextField(
                                  controller: dateController2,
                                  decoration: InputDecoration(
                                    labelText: 'Issuance Date*',
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 20.0),
                                    hintText: 'MM/DD/YYYY',
                                    hintStyle: TextStyle(fontSize: 12.0),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    border: OutlineInputBorder(),
                                    suffixIcon: GestureDetector(
                                      onTap: () =>
                                          _selectDate(context, dateController2),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.calendar_today),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        SizedBox(
                          height: 20.0,
                        ),
                        if (isDesktop(context))
                          Container(
                            height: 70,
                            child: IntrinsicHeight(
                                child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                    child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: TextField(
                                        controller: dateController3,
                                        decoration: InputDecoration(
                                          labelText: 'Valid Thru*',
                                          labelStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 20.0),
                                          hintText: 'MM/DD/YYYY',
                                          hintStyle: TextStyle(fontSize: 12.0),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          border: OutlineInputBorder(),
                                          suffixIcon: GestureDetector(
                                            onTap: () => _selectDate(
                                                context, dateController3),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Icon(Icons.calendar_today),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                                SizedBox(
                                  width: 25.0,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      ElevatedButton(
                                        onPressed: _pickImage1,
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            side: BorderSide(
                                                color: Colors.blue, width: 2),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(Icons.upload_file),
                                            Text('Upload Document',
                                                style: TextStyle(fontSize: 10)),
                                          ],
                                        ),
                                      ),
                                      Text('$isFileSelected1',
                                          style: TextStyle(fontSize: 12)),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                          ),
                        if (isMobile(context))
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: TextField(
                                  controller: dateController3,
                                  decoration: InputDecoration(
                                    labelText: 'Valid Thru*',
                                    labelStyle: TextStyle(
                                        color: Colors.grey, fontSize: 20.0),
                                    hintText: 'MM/DD/YYYY',
                                    hintStyle: TextStyle(fontSize: 12.0),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    border: OutlineInputBorder(),
                                    suffixIcon: GestureDetector(
                                      onTap: () =>
                                          _selectDate(context, dateController3),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.calendar_today),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              ElevatedButton(
                                onPressed: _pickImage1,
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                    side: BorderSide(
                                        color: Colors.blue, width: 2),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.upload_file),
                                    Text('Upload Document',
                                        style: TextStyle(fontSize: 10)),
                                  ],
                                ),
                              ),
                              Text('$isFileSelected1',
                                  style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        SizedBox(
                          height: 10.0,
                        ),
                        if (isFileSelected1 != "" && isDesktop(context))
                          Container(
                            padding: EdgeInsets.only(left: 480.0),
                            child: Text(
                              '** Please carry your Card when visiting to the Branch for your KYC Verification.',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.redAccent),
                            ),
                          ),
                        if (isFileSelected1 != "" && isMobile(context))
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              '** Please carry your Card when visiting to the Branch for your KYC Verification.',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.redAccent),
                            ),
                          ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15.0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => KYCApp()),
                            );
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WelcomePage()),
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
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: Text('offline'),
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
