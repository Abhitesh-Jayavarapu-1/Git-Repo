import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:poc/Auth/registration.dart';

class InstructionPage extends StatefulWidget {
  const InstructionPage({Key? key}) : super(key: key);

  @override
  State<InstructionPage> createState() => _InstructionPageState();
}

class _InstructionPageState extends State<InstructionPage> {
  String? ayn;
  String? byn;
  String? optionalLink;
  String? dropdownValue;
  DateTime? selectedDate;
  TextEditingController dateController = TextEditingController();
  bool agreedToTerms = false;

  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600;
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = DateFormat('MM/dd/yyyy').format(selectedDate!);
      });
    }
  }

  Widget _websiteLink(String displayText) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40.0),
      child: TextButton(
        onPressed: () {},
        child: Text(
          displayText,
          style: TextStyle(color: Colors.blue, fontSize: 18.5),
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text, [String? optionalLink]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 9.5),
              child: Center(
                child: Icon(
                  Icons.circle,
                  size: 7.0,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(width: 13.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(fontSize: 18.5),
                  ),
                  if (optionalLink != null) ...[
                    _websiteLink(optionalLink),
                  ],
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/images/AppLogo.png'),
        title: const Text(
          "Instructions",
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
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            width: 1000,
            child: Column(
              children: [
                // SizedBox(height: 10.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.0),
                      _buildBulletPoint(
                          'The name provided should exactly match the name reflected on the ID document submitted.'),
                      _buildBulletPoint(
                          'Please keep the original KYC documents handy, as you may be required to upload a picture of these documents during the form filling process.',
                          'Acceptable KYC documents'),
                      _buildBulletPoint(
                          'For KYC purposes, you may be required to take a picture of yourself (selfie); please ensure you are in a well-lit area, so a clear picture of yourself is captured.'),
                      _buildBulletPoint(
                          'Please review the information provided before submission to ensure that it is correct and complete in all respects.'),
                      SizedBox(height: 30.0),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Are you an existing ICICI Bank Canada customer?*',
                          style: TextStyle(fontSize: 18.5),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Radio(
                            value: 'Yes',
                            groupValue: ayn,
                            onChanged: (value) {
                              setState(() {
                                ayn = value.toString();
                              });
                            },
                          ),
                          Text(
                            'Yes',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Radio(
                            value: 'No',
                            groupValue: ayn,
                            onChanged: (value) {
                              setState(() {
                                ayn = value.toString();
                              });
                            },
                          ),
                          Text(
                            'No',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      // Container(
                      //   width: 300.0, // Adjust the width as needed
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(5.0),
                      //     border: Border.all(color: Colors.grey),
                      //   ),
                      //   child: Padding(
                      //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      //     child: DropdownButtonFormField<String>(
                      //       decoration: InputDecoration(
                      //         border: InputBorder.none,
                      //         hintText: 'please select',
                      //         hintStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
                      //       ),
                      //       value: dropdownValue,
                      //       onChanged: (value) {
                      //         setState(() {
                      //           dropdownValue = value;
                      //         });
                      //       },
                      //       items: <String>['Option 1', 'Option 2', 'Option 3']
                      //           .map((String value) {
                      //         return DropdownMenuItem<String>(
                      //           value: value,
                      //           child: Text(value),
                      //         );
                      //       }).toList(),
                      //       icon:null,
                      //     ),
                      //   ),
                      // ),
                      // Add curved box for date of birth field
                      Container(
                        width: 450.0,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'How do you hear about us?',
                            labelStyle: TextStyle(color: Colors.grey),
                            hintText: 'please select',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        width: 450.0,
                        child: TextField(
                          controller: dateController,
                          decoration: InputDecoration(
                            labelText: 'Date of Birth*',
                            labelStyle: TextStyle(color: Colors.grey),
                            hintText: 'MM/DD/YYYY',
                            border: OutlineInputBorder(),
                            suffixIcon: GestureDetector(
                              onTap: () => _selectDate(context),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.calendar_today),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Will this account be used by or on behalf of any other party who is not an account holder in this application?*',
                          style: TextStyle(fontSize: 18.5),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Radio(
                            value: 'Yes',
                            groupValue: byn,
                            onChanged: (value) {
                              setState(() {
                                byn = value.toString();
                              });
                            },
                          ),
                          Text(
                            'Yes',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Radio(
                            value: 'No',
                            groupValue: byn,
                            onChanged: (value) {
                              setState(() {
                                byn = value.toString();
                              });
                            },
                          ),
                          Text(
                            'No',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      if (isDesktop(context))
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Promocode',
                                    labelStyle: TextStyle(color: Colors.grey),
                                    hintText: 'promocode',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 25.0),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: 'ICICI Bank Emp ID (optional)',
                                    labelStyle: TextStyle(color: Colors.grey),
                                    hintText: 'ICICI Bank Emp ID',
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
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'Promocode',
                                  labelStyle: TextStyle(color: Colors.grey),
                                  hintText: 'promocode',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'ICICI Bank Emp ID (optional)',
                                  labelStyle: TextStyle(color: Colors.grey),
                                  hintText: 'ICICI Bank Emp ID',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      SizedBox(height: 20.0),
                      Row(
                        children: [
                          Checkbox(
                            value: agreedToTerms,
                            onChanged: (value) {
                              setState(() {
                                agreedToTerms = value ?? false;
                              });
                            },
                          ),
                          Flexible(
                            child: Text(
                              'You acknowledge and agree,',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                      _buildBulletPoint(
                          'That you have received, read and fully understood the Bank\'s Privacy Policy and hereby consent to the Bank collecting, using and disclosing your personal information for the purposes identified in the Bank\'s Privacy Policy including sharing of personal information with Bank authorized third parties located in Canada and/or other countries for ascertaining identification, processing and record-keeping of the application.'),
                      _buildBulletPoint(
                          'You hereby agree and acknowledge that your account with ICICI Bank Canada will be activated only after ICICI Bank Canada (by themselves or through their vendors) has reviewed the information provided and found it to be satisfactory. However, if post-activation /opening of the account, any discrepancy is found in the information provided, ICICI Bank Canada may, at its sole discretion, suspend all debit transactions and notify you of the same.'),
                      _buildBulletPoint(
                          'I have received, fully read and understood the following terms and conditions and hereby consent to the same:'),
                      SizedBox(height: 20.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _websiteLink('(a) Website Terms of Use,'),
                          _websiteLink('(b) Account Terms and Conditions,'),
                          _websiteLink('(c) Privacy Policy,'),
                          _websiteLink('(d) CDIC membership information,'),
                          _websiteLink('(e) Access to Basic Banking,'),
                          _websiteLink('(f) Filing a Complaint,'),
                          _websiteLink('(g) Disclosure Statement'),
                          _websiteLink('(h) Coercive Tied Selling,'),
                          _websiteLink('(i) Interest Rate Chart, and'),
                          _websiteLink('(j) Text Alert T & C.'),
                        ],
                      ),
                      SizedBox(height: 25.0),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'I understand that ICICI Bank Canada reserves the right to carry out any other additional checks for verification purpose on me.',
                          style: TextStyle(fontSize: 18.5),
                        ),
                      ),
                      SizedBox(height: 30.0),
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
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => ResponsiveLayout(
                          //           webWidget: WebLayout(),
                          //           mobileWidget: MobileLayout())),
                          // );
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrationPage()),
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
    );
  }
}
