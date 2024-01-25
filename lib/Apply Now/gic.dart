import 'package:flutter/material.dart';
import 'package:poc/Auth/password.dart';

// void main() {
//   runApp(MaterialApp(
//     home: GICForm(),
//   ));
// }

class GICForm extends StatefulWidget {
  @override
  _GICFormState createState() => _GICFormState();
}

class _GICFormState extends State<GICForm> {
  final _formKey = GlobalKey<FormState>();

  bool redeemable = false;
  String tenure = '';
  String fundingAmount = '';
  String interestPayout = 'Monthly';
  String interestAccount = 'Savings';
  String fundingAccount = 'Fixed';
  String maturityInstruction = 'Reinvest';
  int selectedYears = 1;
  String creditInterestAmount = '5%';
  bool creditPrincipal = false;
  bool checkBoxValue = false;
  bool agreeToStatements = false;

  List<String> interestPayoutOptions = ['Monthly', 'Quarterly', 'Yearly'];
  List<String> accountOptions = ['Savings', 'Fixed'];
  List<String> gicfunding = ['HiVALUE PlUS', 'VALUE PLUS', 'NORMAL'];
  List<int> yearsOptions = List.generate(7, (index) => index + 1);
  List<String> creditInterestOptions = ['5%', '7%', '15%'];

  Widget buildTwoColumnRow(Widget leftWidget, Widget rightWidget) {
    return Row(
      children: [
        Expanded(child: leftWidget),
        SizedBox(width: 16),
        Expanded(child: rightWidget),
      ],
    );
  }

  Widget buildFormField(String label, String hint, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        style: TextStyle(fontSize: 14),
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: (val) {
          setState(() {
            value = val;
          });
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }
          return null;
        },
      ),
    );
  }

  Widget buildDropdown(String label, dynamic value, List<dynamic> options) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: double.infinity, // Set width to prevent overflow
        child: DropdownButtonFormField(
          value: value,
          icon: Icon(Icons.arrow_drop_down),
          style: TextStyle(fontSize: 14),
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          items: options.map((option) {
            return DropdownMenuItem(
              value: option,
              child: Text(option.toString()),
            );
          }).toList(),
          onChanged: (val) {
            setState(() {
              value = val!;
            });
          },
          validator: (value) {
            if (value == null) {
              return 'This field is required';
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget buildCheckbox(String label, bool value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: (val) {
              setState(() {
                creditPrincipal = val!;
              });
            },
          ),
          Text(
            label,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
        children: [
          Icon(Icons.fiber_manual_record, size: 12),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personal Details'),
          // backgroundColor: Color.fromARGB(255, 255, 7, 7),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 16,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'Setup Your GIC',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 57, 7, 255),
                      ),
                    ),
                    SizedBox(height: 16),
                    buildTwoColumnRow(
                      buildFormField('Tenure', 'Enter Tenure', tenure),
                      buildFormField(
                        'Initial Funding Amount',
                        'Enter Amount',
                        fundingAmount,
                      ),
                    ),
                    buildTwoColumnRow(
                      buildDropdown('Interest Payout', interestPayout,
                          interestPayoutOptions),
                      buildDropdown('Interest Payout Account', interestAccount,
                          accountOptions),
                    ),
                    buildTwoColumnRow(
                      buildDropdown('GIC Funding Account', fundingAccount,
                          accountOptions),
                      buildDropdown('Maturity Instruction', maturityInstruction,
                          ['Reinvest', 'Withdraw']),
                    ),
                    buildTwoColumnRow(
                      buildDropdown('Years*', selectedYears, yearsOptions),
                      buildDropdown('Credit Interest to Account*',
                          creditInterestAmount, creditInterestOptions),
                    ),
                    buildCheckbox('Credit Principal plus interest to Account*',
                        creditPrincipal),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          'I agree to all statements',
                          style: TextStyle(fontSize: 14),
                        ),
                        Switch(
                          value: agreeToStatements,
                          onChanged: (value) {
                            setState(() {
                              agreeToStatements = value;
                            });
                          },
                          activeTrackColor: Colors.orangeAccent,
                          activeColor:
                              agreeToStatements ? Colors.orange : Colors.blue,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildBulletPoint(
                            'You agree to fund the Savings/ Chequing Accounts with an amount greater than or equal to the total amount of GIC(s) requested within 7 days after account opening/ activation',
                          ),
                          buildBulletPoint(
                            'You authorize the Bank to debit the account indicated in your instructions above for creating your GIC account(s)',
                          ),
                          buildBulletPoint(
                            'You acknowledge that GIC(s) would not be created unless all the discrepancies are cleared for your application of account(s)',
                          ),
                          buildBulletPoint(
                            'Your GIC application is valid for 7 days from the day of account opening/activation, and failure in funding, for whatever reasons, will lead to the GIC application not being processed. However, you can re-apply through other bank channels',
                          ),
                          buildBulletPoint(
                            'We will dispatch the copy of your (GIC) Guaranteed Investment Certificate(s)/ Term Deposit Certificate(s) within 7 business days upon GIC/',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Back'),
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 255, 0, 0),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              print('Form is valid');
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()),
                            );
                          },
                          child: Text('Next'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
