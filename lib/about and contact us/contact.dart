import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currentaffairsweb/navbar/navbar.dart';
import 'package:flutter/material.dart';

class contactdetails {
  var name;
  var email;
  var message;

  contactdetails(this.name, this.email, this.message);
}

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(flex: 1, child: Navbar()),
            Expanded(
              flex: 9,
              child: LayoutBuilder(builder: (context, constraints) {
                if (constraints.maxWidth > 1200) {
                  return DesktopContact();
                } else if (constraints.maxWidth < 1200 &&
                    constraints.maxWidth > 900) {
                  return TabdayContact();
                } else {
                  return MobileContact();
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}

TextEditingController namecontroller = TextEditingController();
bool _validatename = false;
TextEditingController emailcontroller = TextEditingController();
bool _validateemail = false;
TextEditingController messagecontroller = TextEditingController();
bool _validatemessage = false;

class DesktopContact extends StatefulWidget {
  @override
  _DesktopContactState createState() => _DesktopContactState();
}

class _DesktopContactState extends State<DesktopContact> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 300, vertical: 20),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.name,
                  controller: namecontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'Enter Name',
                    errorText: _validatename ? 'Value Can\'t Be Empty' : null,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter Email',
                    errorText: _validateemail ? 'Value Can\'t Be Empty' : null,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  textAlign: TextAlign.center,
                  controller: messagecontroller,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                    border: OutlineInputBorder(),
                    labelText: 'Message',
                    hintText: 'Enter Message',
                    errorText:
                        _validatemessage ? 'Value Can\'t Be Empty' : null,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                    color: Colors.blue.shade900,
                    focusColor: Colors.blue,
                    child: Text(
                      'SEND',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      setState(() {
                        namecontroller.text.isEmpty
                            ? _validatename = true
                            : _validatename = false;
                        emailcontroller.text.isEmpty
                            ? _validateemail = true
                            : _validateemail = false;
                        messagecontroller.text.isEmpty
                            ? _validatemessage = true
                            : _validatemessage = false;
                      });
                      if (_validatemessage == false &&
                          _validateemail == false &&
                          _validatename == false) {
                        FirebaseFirestore.instance
                            .collection('message')
                            .doc()
                            .set({
                          "name": namecontroller.text,
                          "email": emailcontroller.text,
                          "message": messagecontroller.text,
                        }).then((value) => {
                                  namecontroller.clear(),
                                  emailcontroller.clear(),
                                  messagecontroller.clear(),
                                });
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TabdayContact extends StatefulWidget {
  @override
  _TabdayContactState createState() => _TabdayContactState();
}

class _TabdayContactState extends State<TabdayContact> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.name,
                  controller: namecontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'Enter Name',
                    errorText: _validatename ? 'Value Can\'t Be Empty' : null,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter Email',
                    errorText: _validateemail ? 'Value Can\'t Be Empty' : null,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  textAlign: TextAlign.center,
                  controller: messagecontroller,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                    border: OutlineInputBorder(),
                    labelText: 'Message',
                    hintText: 'Enter Message',
                    errorText:
                        _validatemessage ? 'Value Can\'t Be Empty' : null,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                    color: Colors.blue.shade900,
                    focusColor: Colors.blue,
                    child: Text(
                      'SEND',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      setState(() {
                        namecontroller.text.isEmpty
                            ? _validatename = true
                            : _validatename = false;
                        emailcontroller.text.isEmpty
                            ? _validateemail = true
                            : _validateemail = false;
                        messagecontroller.text.isEmpty
                            ? _validatemessage = true
                            : _validatemessage = false;
                      });
                      if (_validatemessage == false &&
                          _validateemail == false &&
                          _validatename == false) {
                        FirebaseFirestore.instance
                            .collection('message')
                            .doc()
                            .set({
                          "name": namecontroller.text,
                          "email": emailcontroller.text,
                          "message": messagecontroller.text,
                        }).then((value) => {
                                  namecontroller.clear(),
                                  emailcontroller.clear(),
                                  messagecontroller.clear(),
                                });
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MobileContact extends StatefulWidget {
  @override
  _MobileContactState createState() => _MobileContactState();
}

class _MobileContactState extends State<MobileContact> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.name,
                  controller: namecontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'Enter Name',
                    errorText: _validatename ? 'Value Can\'t Be Empty' : null,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter Email',
                    errorText: _validateemail ? 'Value Can\'t Be Empty' : null,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  textAlign: TextAlign.center,
                  controller: messagecontroller,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                    border: OutlineInputBorder(),
                    labelText: 'Message',
                    hintText: 'Enter Message',
                    errorText:
                        _validatemessage ? 'Value Can\'t Be Empty' : null,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                    color: Colors.blue.shade900,
                    focusColor: Colors.blue,
                    child: Text(
                      'SEND',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      setState(() {
                        namecontroller.text.isEmpty
                            ? _validatename = true
                            : _validatename = false;
                        emailcontroller.text.isEmpty
                            ? _validateemail = true
                            : _validateemail = false;
                        messagecontroller.text.isEmpty
                            ? _validatemessage = true
                            : _validatemessage = false;
                      });
                      if (_validatemessage == false &&
                          _validateemail == false &&
                          _validatename == false) {
                        FirebaseFirestore.instance
                            .collection('message')
                            .doc()
                            .set({
                          "name": namecontroller.text,
                          "email": emailcontroller.text,
                          "message": messagecontroller.text,
                        }).then((value) => {
                                  namecontroller.clear(),
                                  emailcontroller.clear(),
                                  messagecontroller.clear(),
                                });
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
