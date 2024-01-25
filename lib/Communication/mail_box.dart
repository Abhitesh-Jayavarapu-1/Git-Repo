import 'package:flutter/material.dart';
//import 'package:flutter_responsive_widgets/flutter_responsive_widgets.dart';
// import 'dart:io' show kIsWeb;

class mailboxweb extends StatefulWidget {
  const mailboxweb({super.key});

  @override
  State<mailboxweb> createState() => _mailboxwebState();
}

class _mailboxwebState extends State<mailboxweb> with TickerProviderStateMixin {
  late TabController _tabController;
  // String? selectedMail;
  Map<String, dynamic>? selectedMail;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
    /* return Scaffold(
        appBar:
        AppBar(
          title:Text('Secure Mailbox'),
             bottom: PreferredSize(
    child: Divider(
      color: Colors.grey, // Color of the border line
      height: 4.0, // Height of the border line
    ),
    preferredSize: Size.fromHeight(4.0), // Adjust the height of the border line
  ),
          actions:[
            Row(children: [
              CircleAvatar(
                radius:20,
                backgroundImage: NetworkImage('data:image/png;base64,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'),
              ),
               SizedBox(width: 8),
               Column(
                mainAxisAlignment:MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Test Four'),
                  Text('Last Visited: 12/01/2024 10:30 AM'),
                ],
              ),
              SizedBox(width: 16),
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                 
                },
              ),
            ],
            ),
          ],
        ),
        drawer:Drawer(
          child:Container(),
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
      );*/
  }

  PreferredSizeWidget _buildMobileAppBar() {
    return AppBar(
      title: Center(child: Text('Secure Mailbox')),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
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
        /*IconButton(
        icon: Icon(Icons.shopping_cart),
        onPressed: () {
         
        },
      ),*/
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
      ],
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width < 600 ? _buildMobileAppBar() : _buildWebAppBar();
  }

  PreferredSizeWidget _buildWebAppBar() {
    return AppBar(
      title: Text('Secure Mailbox'),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
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
                        fontSize: 12.0,
                        // Adjust the font size as needed
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
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(25),
        height: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          children: [
            _buildTabBar(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildMailList('Received'),
                  _buildMailList('Sent'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWebLayout() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 50, horizontal: 180),
      // padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'All Mails',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  _buildTabBar(),
                  Expanded(
                    /* child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),*/
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: 400,
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                                _buildMailList('Received'),
                                _buildMailList('Sent'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            flex: 3,
            child: _buildSelectedMailContent(selectedMail),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedMailContent(Map<String, dynamic>? selectedMail) {
    if (selectedMail == null) {
      return Container();
    }

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            selectedMail['subject'],
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(selectedMail['image']),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    selectedMail['emailId'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("abc@gmail.com"),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            selectedMail['content'],
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Received'),
            Tab(text: 'Sent'),
          ],
          onTap: (index) {
            setState(() {
              selectedMail = null;
            });
          },
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildMailList(String category) {
    List<Map<String, dynamic>> receivedMailData = [
      {
        'image':
            'data:image/png;base64,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',
        'emailId': 'example1@example.com',
        'subject': 'Mail Subject 1',
        'content': 'Content of Mail 1 for testing ',
        'dateTime': '12/01/2024 10:30 AM',
      },
    ];
    List<Map<String, dynamic>> sentMailData = [];
    List<Map<String, dynamic>> mailData =
        (category == 'Received') ? receivedMailData : sentMailData;
    return mailData.isEmpty
        ? Center(
            child: Text('No $category Mails'),
          )
        : ListView.builder(
            itemCount: mailData.length,
            itemBuilder: (context, index) {
              var mail = mailData[index];
              return Container(
                margin: EdgeInsets.only(bottom: 8),
                padding: EdgeInsets.all(2),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedMail = mailData[index];
                    });
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(mail['image']),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    '${mail['emailId']}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(mail['dateTime']),
                              ],
                            ),
                            Text('${mail['subject']}'),
                            Text('${mail['content']}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}
