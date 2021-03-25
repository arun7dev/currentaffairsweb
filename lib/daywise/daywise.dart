import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currentaffairsweb/calenderdatepicker/calenderdatepicker.dart';
import 'package:currentaffairsweb/navbar/navbar.dart';
import 'package:currentaffairsweb/singlenewsdaywise/singlenewsdaywise.dart';
import 'package:flutter/material.dart';

Map documentList = {};
String date = '';
int s = 0;

final _firestore = FirebaseFirestore.instance;
MediaQueryData queryData = MediaQueryData();

class Daywise extends StatelessWidget {
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
                  return Desktopdaywise();
                } else if (constraints.maxWidth < 1200) {
                  return Tabdaywise();
                } else {
                  return Container();
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class Desktopdaywise extends StatefulWidget {
  @override
  _DesktopdaywiseState createState() => _DesktopdaywiseState();
}

class _DesktopdaywiseState extends State<Desktopdaywise> {
  final _dateController = TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    _dateController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Column(
                    children: [
                      MaterialButton(
                        color: Colors.blue.shade900,
                        hoverColor: Colors.blue,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                'LATEST',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MaterialButton(
                        color: Colors.black,
                        hoverColor: Colors.grey,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                'DAYWISE',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () => Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Daywise())),
                      ),
                    ],
                  )
                ],
              ),
            )),
        Expanded(
          flex: 9,
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('currentaffairs')
                  .snapshots(),
              builder: (context, snapshot1) {
                return StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('daywise')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData && !snapshot1.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        snapshot
                                            .data
                                            .documents[snapshot1.data
                                                    .documents[0]["length"] -
                                                index -
                                                1]['date']
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Card(
                                    borderOnForeground: true,
                                    child: Container(
                                      // width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        children: <Widget>[
                                          snapshot.data.documents[snapshot1
                                                              .data.documents[0]
                                                          ["length"] -
                                                      index -
                                                      1]['head0'] ==
                                                  ''
                                              ? null
                                              : buildOutlineButton(
                                                  snapshot,
                                                  snapshot1,
                                                  index,
                                                  0,
                                                  context,
                                                  20,
                                                  5,
                                                ),
                                          buildOutlineButton(
                                            snapshot,
                                            snapshot1,
                                            index,
                                            1,
                                            context,
                                            20,
                                            5,
                                          ),
                                          buildOutlineButton(
                                            snapshot,
                                            snapshot1,
                                            index,
                                            2,
                                            context,
                                            20,
                                            5,
                                          ),
                                          buildOutlineButton(
                                            snapshot,
                                            snapshot1,
                                            index,
                                            3,
                                            context,
                                            20,
                                            5,
                                          ),
                                          buildOutlineButton(
                                            snapshot,
                                            snapshot1,
                                            index,
                                            4,
                                            context,
                                            20,
                                            5,
                                          ),
                                          buildOutlineButton(
                                            snapshot,
                                            snapshot1,
                                            index,
                                            5,
                                            context,
                                            20,
                                            5,
                                          ),
                                          buildOutlineButton(
                                            snapshot,
                                            snapshot1,
                                            index,
                                            6,
                                            context,
                                            20,
                                            5,
                                          ),
                                          buildOutlineButton(
                                            snapshot,
                                            snapshot1,
                                            index,
                                            7,
                                            context,
                                            20,
                                            5,
                                          ),
                                          buildOutlineButton(
                                            snapshot,
                                            snapshot1,
                                            index,
                                            8,
                                            context,
                                            20,
                                            5,
                                          ),
                                          buildOutlineButton(
                                            snapshot,
                                            snapshot1,
                                            index,
                                            9,
                                            context,
                                            20,
                                            5,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    });
              }),
        ),
        Expanded(
          flex: 3,
          child: Scaffold(
            body: StreamBuilder<Object>(
                stream: _firestore.collection('daywise').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue.shade900),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Container(
                                  height: queryData.size.height / 3,
                                  child: CalendarDatePicker(
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1960),
                                      lastDate: DateTime(2100),
                                      onDateChanged: (val) {
                                        date = val.toString();
                                        var date_unformatted =
                                            val.toString().split(" ")[0];
                                        var date_values =
                                            date_unformatted.split("-");
                                        var date_formatted =
                                            "${date_values[2]}/${date_values[1]}/${date_values[0]}";
                                        _dateController.text = date_formatted;
                                        setState(() {
                                          date = date_formatted;
                                        });
                                      }),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: TextField(
                                textInputAction: TextInputAction.go,
                                enableSuggestions: true,
                                maxLength: 10,
                                textAlign: TextAlign.center,
                                controller: _dateController,
                                keyboardType: TextInputType.datetime,
                                decoration: InputDecoration(
                                  hintText: 'DD/MM/YYYY',
                                  errorText: _validate
                                      ? 'Enter of a date in format DD/MM/YYYY'
                                      : null,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: MaterialButton(
                                height: 40,
                                color: Colors.blue.shade900,
                                child: Text(
                                  'GET',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () async {
                                  _dateController.text.isEmpty ||
                                          documentList.toString() == ''
                                      ? _validate = true
                                      : _validate = false;
                                  date = _dateController.text;

                                  try {
                                    await _firestore
                                        .collection("daywise")
                                        .where('date', isEqualTo: date)
                                        .get()
                                        .then((QuerySnapshot document) {
                                      if (document.docs.isNotEmpty) {
                                        documentList = document.docs[0].data();
                                        print(documentList['date']);
                                      } else {
                                        documentList = {
                                          'date':
                                              'NO DATA  AVAILABLE FOR THE DATE',
                                          'head0': ' ',
                                          'read0': ' ',
                                          'head1': ' ',
                                          'read1': ' ',
                                          'head2': ' ',
                                          'read2': ' ',
                                          'head3': ' ',
                                          'read3': ' ',
                                          'head4': ' ',
                                          'read4': ' ',
                                          'head5': ' ',
                                          'read5': ' ',
                                          'head6': ' ',
                                          'read6': ' ',
                                          'head7': ' ',
                                          'read7': ' ',
                                          'head8': ' ',
                                          'read8': ' ',
                                          'head9': ' ',
                                          'read9': ' ',
                                        };
                                      }
                                    });
                                  } catch (e) {
                                    print(e.toString());
                                  }

                                  setState(() {
                                    _validate = _validate;
                                    date = date;
                                  });

                                  date == '' || documentList == null
                                      ? null
                                      : Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CalenderDatePicker(
                                                      documentList)));

                                  FocusScope.of(context).unfocus();
                                }),
                          ),

                          //calender add here
                        ],
                      ),
                    ),
                  );
                }),
          ),
        )
      ],
    );
  }
}

class Tabdaywise extends StatefulWidget {
  @override
  _TabdaywiseState createState() => _TabdaywiseState();
}

class _TabdaywiseState extends State<Tabdaywise> {
  final _dateController = TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    _dateController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Row(
                    children: [
                      MaterialButton(
                        color: Colors.blue.shade900,
                        hoverColor: Colors.blue,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'LATEST',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      MaterialButton(
                        color: Colors.black,
                        hoverColor: Colors.grey,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'DAYWISE',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                        ),
                        onPressed: () => Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Daywise())),
                      ),
                    ],
                  )
                ],
              ),
            )),
        Expanded(
          flex: 9,
          child: Scaffold(
            body: StreamBuilder<Object>(
                stream: _firestore.collection('daywise').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue.shade900),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Container(
                                height: queryData.size.height / 3,
                                child: CalendarDatePicker(
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1960),
                                    lastDate: DateTime(2100),
                                    onDateChanged: (val) {
                                      date = val.toString();
                                      var date_unformatted =
                                          val.toString().split(" ")[0];
                                      var date_values =
                                          date_unformatted.split("-");
                                      var date_formatted =
                                          "${date_values[2]}/${date_values[1]}/${date_values[0]}";
                                      _dateController.text = date_formatted;
                                      setState(() {
                                        date = date_formatted;
                                      });
                                    }),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                                textInputAction: TextInputAction.go,
                                enableSuggestions: true,
                                maxLength: 10,
                                textAlign: TextAlign.center,
                                controller: _dateController,
                                keyboardType: TextInputType.datetime,
                                decoration: InputDecoration(
                                  hintText: 'DD/MM/YYYY',
                                  errorText: _validate
                                      ? 'Enter of a date in format DD/MM/YYYY'
                                      : null,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: MaterialButton(
                                height: 40,
                                color: Colors.blue.shade900,
                                child: Text(
                                  'GET',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () async {
                                  _dateController.text.isEmpty ||
                                          documentList.toString() == ''
                                      ? _validate = true
                                      : _validate = false;
                                  date = _dateController.text;

                                  try {
                                    await _firestore
                                        .collection("daywise")
                                        .where('date', isEqualTo: date)
                                        .get()
                                        .then((QuerySnapshot document) {
                                      if (document.docs.isNotEmpty) {
                                        documentList = document.docs[0].data();
                                        print(documentList['date']);
                                      } else {
                                        documentList = {
                                          'date':
                                              'NO DATA  AVAILABLE FOR THE DATE',
                                          'head0': ' ',
                                          'read0': ' ',
                                          'head1': ' ',
                                          'read1': ' ',
                                          'head2': ' ',
                                          'read2': ' ',
                                          'head3': ' ',
                                          'read3': ' ',
                                          'head4': ' ',
                                          'read4': ' ',
                                          'head5': ' ',
                                          'read5': ' ',
                                          'head6': ' ',
                                          'read6': ' ',
                                          'head7': ' ',
                                          'read7': ' ',
                                          'head8': ' ',
                                          'read8': ' ',
                                          'head9': ' ',
                                          'read9': ' ',
                                        };
                                      }
                                    });
                                  } catch (e) {
                                    print(e.toString());
                                  }

                                  setState(() {
                                    _validate = _validate;
                                    date = date;
                                  });

                                  date == '' || documentList == null
                                      ? null
                                      : Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CalenderDatePicker(
                                                      documentList)));

                                  FocusScope.of(context).unfocus();
                                }),
                          ),

                          //calender add here
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}

class Mobiledawise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Row(
                    children: [
                      MaterialButton(
                        color: Colors.blue.shade900,
                        hoverColor: Colors.blue,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'LATEST',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      MaterialButton(
                        color: Colors.black,
                        hoverColor: Colors.grey,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'DAYWISE',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                        ),
                        onPressed: () => Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Daywise())),
                      ),
                    ],
                  )
                ],
              ),
            )),
        Expanded(flex: 1, child: Container()),
        Expanded(
          flex: 15,
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('currentaffairs')
                  .snapshots(),
              builder: (context, snapshot1) {
                return StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('daywise')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        snapshot
                                            .data
                                            .documents[snapshot1.data
                                                    .documents[0]["length"] -
                                                index -
                                                1]['date']
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Card(
                                    borderOnForeground: true,
                                    child: Container(
                                      // width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        children: <Widget>[
                                          snapshot.data.documents[snapshot1
                                                              .data.documents[0]
                                                          ["length"] -
                                                      index -
                                                      1]['head0'] ==
                                                  ''
                                              ? null
                                              : buildOutlineButton(
                                                  snapshot,
                                                  snapshot1,
                                                  index,
                                                  0,
                                                  context,
                                                  15,
                                                  0,
                                                ),
                                          buildOutlineButton(
                                            snapshot,
                                            snapshot1,
                                            index,
                                            1,
                                            context,
                                            15,
                                            0,
                                          ),
                                          buildOutlineButton(
                                            snapshot,
                                            snapshot1,
                                            index,
                                            2,
                                            context,
                                            15,
                                            0,
                                          ),
                                          buildOutlineButton(
                                            snapshot,
                                            snapshot1,
                                            index,
                                            3,
                                            context,
                                            15,
                                            0,
                                          ),
                                          buildOutlineButton(
                                            snapshot,
                                            snapshot1,
                                            index,
                                            4,
                                            context,
                                            15,
                                            0,
                                          ),
                                          buildOutlineButton(
                                            snapshot,
                                            snapshot1,
                                            index,
                                            5,
                                            context,
                                            15,
                                            0,
                                          ),
                                          buildOutlineButton(
                                            snapshot,
                                            snapshot1,
                                            index,
                                            6,
                                            context,
                                            15,
                                            0,
                                          ),
                                          buildOutlineButton(
                                            snapshot,
                                            snapshot1,
                                            index,
                                            7,
                                            context,
                                            15,
                                            0,
                                          ),
                                          buildOutlineButton(
                                            snapshot,
                                            snapshot1,
                                            index,
                                            8,
                                            context,
                                            15,
                                            0,
                                          ),
                                          buildOutlineButton(
                                            snapshot,
                                            snapshot1,
                                            index,
                                            9,
                                            context,
                                            15,
                                            0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    });
              }),
        ),
      ],
    );
  }
}

textStyling(para) {
  var asd;

  asd = para;

  asd = asd.replaceAll('➤', '\n➤ ');
  return asd;
}

buildOutlineButton(snapshot, snapshot1, int index, int number,
    BuildContext context, double size, double sizedboxheight) {
  if (snapshot.data.documents[snapshot1.data.documents[0]["length"] - index - 1]
          ['head$number'] ==
      '') {
    return SizedBox(height: 0);
  } else {
    return Column(
      children: [
        SizedBox(
          height: sizedboxheight,
        ),
        InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SingleNewsDaywise(
                        head: snapshot
                            .data
                            .documents[snapshot1.data.documents[0]["length"] -
                                index -
                                1]['head$number']
                            .toString(),
                        read: snapshot
                            .data
                            .documents[snapshot1.data.documents[0]["length"] -
                                index -
                                1]['read$number']
                            .toString(),
                      ))),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  snapshot.data.documents[
                          snapshot1.data.documents[0]["length"] - index - 1]
                      ['head$number'],
                  style: TextStyle(
                      fontSize: size,
                      fontFamily: 'Coda',
                      color: Colors.black,
                      fontWeight: FontWeight.w100),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
