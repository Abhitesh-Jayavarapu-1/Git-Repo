import 'package:flutter/material.dart';
import 'package:poc/Apply%20Now/personal.dart';

class AccountDetails extends StatefulWidget {
  const AccountDetails({super.key});

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  int selectedButtonIndex = 0;
  String? selectedOption;
  List<bool> isExpandedList = [false, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      drawer: Drawer(
        child: Container(),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return _buildMobileLayout();
          } else {
            return _buildWebLayout();
          }
        },
      ),
    );
  }

  PreferredSizeWidget _buildMobileAppBar() {
    return AppBar(
      title: Center(
        child: Text(
          'Account Details',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.red, Colors.redAccent],
          ),
        ),
      ),
      actions: [
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
                padding: EdgeInsets.all(4.0), // Adjust padding as needed
                margin: EdgeInsets.only(right: 4.0), // Adjust margin as needed
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
        /*  IconButton(
        icon: Icon(Icons.shopping_cart),
        onPressed: () {
          
        },
      ),*/
      ],
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width < 600 ? _buildMobileAppBar() : _buildWebAppBar();
  }

  PreferredSizeWidget _buildWebAppBar() {
    return AppBar(
      title: Text('Account Details'),
      bottom: PreferredSize(
        child: Divider(
          color: Colors.grey,
          height: 4.0,
        ),
        preferredSize: Size.fromHeight(4.0),
      ),
      actions: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  'data:image/png;base64,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'),
            ),
            SizedBox(width: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Test Four'),
                Text('Last Visited: 12/01/2024 10:30 IST'),
              ],
            ),
            SizedBox(width: 16),
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
                    padding: EdgeInsets.all(4.0), // Adjust padding as needed
                    margin:
                        EdgeInsets.only(right: 4.0), // Adjust margin as needed
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
            /* IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                 
                },
              ),*/
          ],
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    double dw = MediaQuery.of(context).size.width * 0.8;
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 10.0, top: 8.0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.0),
                  Center(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.indigo[900],
                              //border: Border.all(color: Colors.orange),
                            ),
                            child: Icon(Icons.account_balance_outlined,
                                size: 30, color: Colors.white),
                          ),
                          Text(
                            'Account',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.indigo[900],
                            ),
                          ),
                          Text(
                            'Details',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.indigo[900],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Account Details',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo[900],
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    child: ExpansionPanelList(
                      elevation: 1,
                      expandedHeaderPadding: EdgeInsets.all(0),
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          isExpandedList[index] = !isExpandedList[index];
                        });
                      },
                      children: [
                        ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return ListTile(
                              title: Text(
                                'Chequing Account',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange,
                                ),
                              ),
                            );
                          },
                          body: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 8.0),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 18.0,
                                      right: 18.0,
                                      top: 10.0,
                                      bottom: 10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 3,
                                        blurRadius: 3,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Text(
                                              'HiVALUE® PLUS',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.indigo[900]),
                                            ),
                                          ),
                                          Expanded(
                                            child: Center(
                                              child: Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey,
                                                      width: 3),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: IconButton(
                                                  icon:
                                                      Icon(Icons.shopping_cart),
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return CartDialog(
                                                            dialogWidth: dw);
                                                        //return cartdialog(context,dialogWidth);
                                                        // // Call the function here
                                                      },
                                                    );
                                                  },
                                                ),
                                                // child: Icon(Icons.shopping_cart,color:Colors.indigo[900]),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8.0),
                                      Divider(
                                        color: Colors.grey,
                                        height: 1,
                                      ),
                                      SizedBox(height: 10.0),
                                      Text(
                                        'Features',
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.black),
                                      ),
                                      SizedBox(height: 4.0),
                                      pointWithSquare(
                                          'Enjoy unparalleled convenience at a minimal cost!'),
                                      pointWithSquare(
                                          'Unlimited ABM transactions,Interac® Direct Payments (POS transactions), bill payments, direct deposits and pre-authorized debits,in-branch debit transactions, cheque books and cheques issuance, Money Transfers to India:in-branch transactions or through phone banking and TEXT ALERTS service'),
                                      SizedBox(height: 8),
                                      ElevatedButton(
                                          onPressed: () {},
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.indigo[900]!),
                                            shape: MaterialStateProperty.all<
                                                OutlinedBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6.0),
                                              ),
                                            ),
                                            foregroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.white),
                                          ),
                                          child: Text('Know more')),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15.0),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 18.0,
                                      right: 18.0,
                                      top: 10.0,
                                      bottom: 10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 3,
                                        blurRadius: 3,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Text(
                                              'HiVALUE® Chequing',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.indigo[900]),
                                            ),
                                          ),
                                          Expanded(
                                            child: Center(
                                              child: Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey,
                                                      width: 3),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: IconButton(
                                                  icon:
                                                      Icon(Icons.shopping_cart),
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return CartDialog(
                                                            dialogWidth: dw);
                                                        // return cartdialog(context, dialogWidth); // Call the function here
                                                      },
                                                    );
                                                  },
                                                ),
                                                // child: Icon(Icons.shopping_cart,color:Colors.indigo[900]),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8.0),
                                      Divider(
                                        color: Colors.grey,
                                        height: 1,
                                      ),
                                      SizedBox(height: 10.0),
                                      Text(
                                        'Features',
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.black),
                                      ),
                                      SizedBox(height: 4.0),
                                      pointWithSquare(
                                          'The HiVALUE Chequing Account is your everyday banking account with a host of services created to suit your banking needs, while earning interest too.'),
                                      pointWithSquare(
                                          'The account charges are waived if you maintain daily closing balance* or you have enrolled for the Payroll Direct Deposit'),
                                      SizedBox(height: 8),
                                      ElevatedButton(
                                          onPressed: () {},
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.indigo[900]!),
                                            shape: MaterialStateProperty.all<
                                                OutlinedBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6.0),
                                              ),
                                            ),
                                            foregroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.white),
                                          ),
                                          child: Text('Know more')),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15.0),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 18.0,
                                      right: 18.0,
                                      top: 10.0,
                                      bottom: 10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 3,
                                        blurRadius: 3,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Text(
                                              'Basic Chequing',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.indigo[900]),
                                            ),
                                          ),
                                          Expanded(
                                            child: Center(
                                              child: Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey,
                                                      width: 3),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: IconButton(
                                                  icon:
                                                      Icon(Icons.shopping_cart),
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return CartDialog(
                                                            dialogWidth: dw);
                                                        // return cartdialog(context, dialogWidth); // Call the function here
                                                      },
                                                    );
                                                  },
                                                ),
                                                // child: Icon(Icons.shopping_cart,color:Colors.indigo[900]),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8.0),
                                      Divider(
                                        color: Colors.grey,
                                        height: 1,
                                      ),
                                      SizedBox(height: 10.0),
                                      Text(
                                        'Features',
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.black),
                                      ),
                                      SizedBox(height: 4.0),
                                      pointWithSquare('Seniors'),
                                      pointWithSquare(
                                          'Students (enrolled full time in post-secondary program. Opening of the account is currently available only through our branches)'),
                                      pointWithSquare(
                                          'Youth (Opening of the account is currently available only through our branches)'),
                                      pointWithSquare(
                                          'Registered Disability Savings Plan (RDSP) beneficiaries (Opening of the account is currently available only through our branches)'),
                                      SizedBox(height: 8),
                                      ElevatedButton(
                                          onPressed: () {},
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.indigo[900]!),
                                            shape: MaterialStateProperty.all<
                                                OutlinedBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6.0),
                                              ),
                                            ),
                                            foregroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.white),
                                          ),
                                          child: Text('Know more')),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15.0),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 18.0,
                                      right: 18.0,
                                      top: 10.0,
                                      bottom: 10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 3,
                                        blurRadius: 3,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Text(
                                              'HiVALUE® USD Chequing',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.indigo[900]),
                                            ),
                                          ),
                                          Expanded(
                                            child: Center(
                                              child: Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey,
                                                      width: 3),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: IconButton(
                                                  icon:
                                                      Icon(Icons.shopping_cart),
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return CartDialog(
                                                            dialogWidth: dw);
                                                        //  return cartdialog(context, dialogWidth); // Call the function here
                                                      },
                                                    );
                                                  },
                                                ),
                                                //child: Icon(Icons.shopping_cart,color:Colors.indigo[900]),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8.0),
                                      Divider(
                                        color: Colors.grey,
                                        height: 1,
                                      ),
                                      SizedBox(height: 10.0),
                                      Text(
                                        'Features',
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.black),
                                      ),
                                      SizedBox(height: 4.0),
                                      pointWithSquare(
                                          'The HiVALUE Chequing Account in USD is your everyday banking account with a host of services created to suit your banking needs, while earning interest too.'),
                                      SizedBox(height: 8),
                                      ElevatedButton(
                                          onPressed: () {},
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.indigo[900]!),
                                            shape: MaterialStateProperty.all<
                                                OutlinedBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6.0),
                                              ),
                                            ),
                                            foregroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.white),
                                          ),
                                          child: Text('Know more')),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          isExpanded: isExpandedList[0],
                        ),
                        ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return ListTile(
                                title: Text(
                              'Savings Account',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ));
                          },
                          body: Container(),
                          isExpanded: isExpandedList[1],
                        ),
                        ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return ListTile(
                                title: Text(
                              'Investment Account',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ));
                          },
                          body: Container(),
                          isExpanded: isExpandedList[2],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Personal()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.indigo[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWebLayout() {
    double screenWidth = MediaQuery.of(context).size.width;
    double dw = screenWidth * 0.6;
    double mp = 0.18;

    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.indigo[900],
                      //border: Border.all(color: Colors.orange),
                    ),
                    child: Icon(Icons.account_balance_outlined,
                        size: 30, color: Colors.white),
                  ),
                  Text(
                    'Account Details',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.indigo[900],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              margin: EdgeInsets.fromLTRB(
                  screenWidth * mp, 0, screenWidth * mp, 4.0),
              // margin:const EdgeInsets.only(left:180.0,right: 180.0,top: 4.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey[100],
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Account Details',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo[900],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 1,
                  ),
                  Container(
                    // margin:const EdgeInsets.only(left:14.0,right: 18.0,top: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                            buttonText: 'Chequing Account',
                            isSelected: selectedButtonIndex == 0,
                            onPressed: () {
                              updateSelectedButton(0);
                            },
                          ),
                          CustomButton(
                            buttonText: 'Savings Account',
                            isSelected: selectedButtonIndex == 1,
                            onPressed: () {
                              updateSelectedButton(1);
                            },
                          ),
                          CustomButton(
                            buttonText: 'Investment Account',
                            isSelected: selectedButtonIndex == 2,
                            onPressed: () {
                              updateSelectedButton(2);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (selectedButtonIndex == 0)
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'HiVALUE® PLUS',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo[900],
                                  ),
                                ),
                                SizedBox(height: 16),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.orange),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Features',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.indigo[900],
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.grey,
                                        height: 1,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              flex: 4,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Enjoy unparalleled convenience at a minimal cost!',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.indigo[900],
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),
                                                  Text(
                                                    'Unlimited ABM transactions,Interac® Direct Payments (POS transactions), bill payments, direct deposits and pre-authorized debits,in-branch debit transactions, cheque books and cheques issuance, Money Transfers to India:in-branch transactions or through phone banking and TEXT ALERTS service',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.indigo[900],
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),
                                                  ElevatedButton(
                                                      onPressed: () {},
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<
                                                                    Color>(Colors
                                                                        .indigo[
                                                                    900]!),
                                                        shape: MaterialStateProperty
                                                            .all<
                                                                OutlinedBorder>(
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6.0),
                                                          ),
                                                        ),
                                                        foregroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                                    Colors
                                                                        .white),
                                                      ),
                                                      child: Text('Know more'))
                                                ],
                                              )),
                                          Expanded(
                                            child: Center(
                                              child: Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.green,
                                                      width: 3),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: IconButton(
                                                  icon:
                                                      Icon(Icons.shopping_cart),
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return CartDialog(
                                                            dialogWidth: dw);
                                                        //return cartdialog(context, dialogWidth); // Call the function here
                                                      },
                                                    );
                                                  },
                                                ),
                                                // child: Icon(Icons.shopping_cart,color:Colors.indigo[900]),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  'HiVALUE® Chequing',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo[900],
                                  ),
                                ),
                                SizedBox(height: 16),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.orange),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Features',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.indigo[900],
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.grey,
                                        height: 1,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              flex: 4,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'The HiVALUE Chequing Account is your everyday banking account with a host of services created to suit your banking needs, while earning interest too.',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.indigo[900],
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),
                                                  Text(
                                                    'The account charges are waived if you maintain daily closing balance* or you have enrolled for the Payroll Direct Deposit',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.indigo[900],
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),
                                                  ElevatedButton(
                                                      onPressed: () {},
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<
                                                                    Color>(Colors
                                                                        .indigo[
                                                                    900]!),
                                                        shape: MaterialStateProperty
                                                            .all<
                                                                OutlinedBorder>(
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6.0),
                                                          ),
                                                        ),
                                                        foregroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                                    Colors
                                                                        .white),
                                                      ),
                                                      child: Text('Know more'))
                                                ],
                                              )),
                                          Expanded(
                                            child: Center(
                                              child: Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.red,
                                                      width: 3),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: IconButton(
                                                  icon:
                                                      Icon(Icons.shopping_cart),
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return CartDialog(
                                                            dialogWidth: dw);
                                                        // return cartdialog(context, dialogWidth); // Call the function here
                                                      },
                                                    );
                                                  },
                                                ),
                                                // child: Icon(Icons.shopping_cart,color:Colors.indigo[900]),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  'Basic Chequing',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo[900],
                                  ),
                                ),
                                SizedBox(height: 16),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.orange),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Features',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.indigo[900],
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.grey,
                                        height: 1,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              flex: 4,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "ICICI Bank Canada's Basic Chequing Account is specially designed for customers who conduct just a few banking transactions each month. At a low monthly fee, you can enjoy all the essentail features and services you require while earning interest on your money.",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.indigo[900],
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),
                                                  Text(
                                                    'This fee is waived for',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.indigo[900],
                                                    ),
                                                  ),
                                                  SizedBox(height: 8),

                                                  /* ListView(
                              children:[
                                ListTile(
                                  leading:Icon(Icons.fiber_manual_record,
                                    color:Colors.indigo[900],
                                ),
                                title:Text('point 1'),
                                ),
                              ],
                             ),*/
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      pointWithSquare(
                                                          'Seniors'),
                                                      pointWithSquare(
                                                          'Students (enrolled full time in post-secondary program. Opening of the account is currently available only through our branches)'),
                                                      pointWithSquare(
                                                          'Youth (Opening of the account is currently available only through our branches)'),
                                                      pointWithSquare(
                                                          'Registered Disability Savings Plan (RDSP) beneficiaries (Opening of the account is currently available only through our branches)'),
                                                    ],
                                                  ),
                                                  SizedBox(height: 8),
                                                  ElevatedButton(
                                                      onPressed: () {},
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<
                                                                    Color>(Colors
                                                                        .indigo[
                                                                    900]!),
                                                        shape: MaterialStateProperty
                                                            .all<
                                                                OutlinedBorder>(
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6.0),
                                                          ),
                                                        ),
                                                        foregroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                                    Colors
                                                                        .white),
                                                      ),
                                                      child: Text('Know more'))
                                                ],
                                              )),
                                          Expanded(
                                            child: Center(
                                              child: Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.red,
                                                      width: 3),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: IconButton(
                                                  icon:
                                                      Icon(Icons.shopping_cart),
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return CartDialog(
                                                            dialogWidth: dw);
                                                        // return cartdialog(context, dialogWidth); // Call the function here
                                                      },
                                                    );
                                                  },
                                                ),
                                                // child: Icon(Icons.shopping_cart,color:Colors.indigo[900]),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        SizedBox(height: 6),
                        Text(
                          'HiVALUE® USD Chequing',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo[900],
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.orange),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Features',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.indigo[900],
                                ),
                              ),
                              Divider(
                                color: Colors.grey,
                                height: 1,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      flex: 4,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'The HiVALUE Chequing Account in USD is your everyday banking account with a host of services created to suit your banking needs, while earning interest too.',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.indigo[900],
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          ElevatedButton(
                                              onPressed: () {},
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                            Color>(
                                                        Colors.indigo[900]!),
                                                shape: MaterialStateProperty
                                                    .all<OutlinedBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.0),
                                                  ),
                                                ),
                                                foregroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.white),
                                              ),
                                              child: Text('Know more'))
                                        ],
                                      )),
                                  Expanded(
                                    child: Center(
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.red, width: 3),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: IconButton(
                                          icon: Icon(Icons.shopping_cart),
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return CartDialog(
                                                    dialogWidth: dw);
                                                // return cartdialog(context, dialogWidth); // Call the function here
                                              },
                                            );
                                          },
                                        ),
                                        //child: Icon(Icons.shopping_cart,color:Colors.indigo[900]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        if (selectedButtonIndex == 1)
                          Text(
                            'Content for Button 2',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        if (selectedButtonIndex == 2)
                          Text(
                            'Content for Button 3',
                            style: TextStyle(
                              color: Colors.blue, // Text color for the content
                            ),
                          ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // SizedBox(width:3.0),
                      ElevatedButton(
                        onPressed: () {
                          // Handle button tap
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          side: BorderSide(color: Colors.indigo),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                        ),
                        child: Text(
                          'Back',
                          style: TextStyle(color: Colors.indigo[900]),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle button tap
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Personal()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.indigo[900],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                        ),
                        child: Text(
                          'Next',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      //   SizedBox(width:3.0),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateSelectedButton(int newIndex) {
    setState(() {
      selectedButtonIndex = newIndex;
    });
  }

  Widget pointWithSquare(String content) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 4.0,
          height: 4.0,
          margin: EdgeInsets.only(top: 6.0, right: 4.0, left: 8.0),
          decoration: BoxDecoration(
            color: Colors.indigo[900],
            shape: BoxShape.rectangle,
          ),
        ),
        SizedBox(width: 6.0),
        Expanded(
          child: Text(
            content,
            style: TextStyle(
              color: Colors.indigo[900],
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  final String buttonText;
  final bool isSelected;
  final VoidCallback onPressed;

  CustomButton({
    required this.buttonText,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        side: BorderSide(
          color: Colors.orange,
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          color: isSelected ? Colors.orange : Colors.indigo[900],
        ),
      ),
    );
  }
}

class CartDialog extends StatefulWidget {
  final double dialogWidth;

  CartDialog({required this.dialogWidth});

  @override
  _CartDialogState createState() => _CartDialogState();
}

class _CartDialogState extends State<CartDialog> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        width: widget.dialogWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.red,
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        'ICICI Bank Canada - Hello Account',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 15.0),
                  Text(
                    'Please select the intended use of account',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 50.0),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    hint: Text('Select'),
                    value: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value;
                      });
                    },
                    items: <String>['Option 1', 'Option 2'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 50.0),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.indigo[900]!),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                      ),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    child: Text('Continue'),
                  ),
                  SizedBox(height: 60.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
