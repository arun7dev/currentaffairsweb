import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currentaffairsweb/daywise/daywise.dart';
import 'package:currentaffairsweb/screens/homepage.dart';
import 'package:flutter/material.dart';

class Latest extends StatelessWidget {
  final ScrollController _controllerOne = ScrollController();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1200) {
        return DesktopLatest();
      } else if (constraints.maxWidth < 1200 && constraints.maxWidth > 900) {
        return TabLatest();
      } else {
        return MobileLatest();
      }
    });
  }
}

class DesktopLatest extends StatefulWidget {
  @override
  _DesktopLatestState createState() => _DesktopLatestState();
}

class _DesktopLatestState extends State<DesktopLatest> {
  ScrollController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                        color: Colors.black,
                        hoverColor: Colors.grey,
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
                        onPressed: () => Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Home())),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MaterialButton(
                        color: Colors.blue.shade900,
                        hoverColor: Colors.blue,
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Daywise())),
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
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Scrollbar(
                        isAlwaysShown: true,
                        controller: controller,
                        child: ListView.builder(
                            controller: controller,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 200),
                                      child: Text(
                                        snapshot
                                            .data
                                            .documents[snapshot1.data
                                                    .documents[0]["length"] -
                                                index -
                                                1]['head0']
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 200),
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
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 200),
                                      child: Text(
                                        textStyling(snapshot
                                            .data
                                            .documents[snapshot1.data
                                                    .documents[0]["length"] -
                                                index -
                                                1]['read0']
                                            .toString()),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w100),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      );
                    });
              }),
        ),
      ],
    );
  }
}

class TabLatest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Column(
                    children: [
                      MaterialButton(
                        color: Colors.black,
                        hoverColor: Colors.grey,
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
                        onPressed: () => Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Home())),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MaterialButton(
                        color: Colors.blue.shade900,
                        hoverColor: Colors.blue,
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Daywise())),
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
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 100),
                                    child: Text(
                                      snapshot
                                          .data
                                          .documents[snapshot1.data.documents[0]
                                                  ["length"] -
                                              index -
                                              1]['head0']
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 100),
                                    child: Text(
                                      snapshot
                                          .data
                                          .documents[snapshot1.data.documents[0]
                                                  ["length"] -
                                              index -
                                              1]['date']
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w200),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 100),
                                    child: Text(
                                      textStyling(snapshot
                                          .data
                                          .documents[snapshot1.data.documents[0]
                                                  ["length"] -
                                              index -
                                              1]['read0']
                                          .toString()),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w100),
                                      textAlign: TextAlign.left,
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

class MobileLatest extends StatelessWidget {
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
                        color: Colors.black,
                        hoverColor: Colors.grey,
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
                        onPressed: () => Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Home())),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      MaterialButton(
                        color: Colors.blue.shade900,
                        hoverColor: Colors.blue,
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Daywise())),
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
                      ),
                    ],
                  )
                ],
              ),
            )),
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
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Text(
                                      snapshot
                                          .data
                                          .documents[snapshot1.data.documents[0]
                                                  ["length"] -
                                              index -
                                              1]['head0']
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Text(
                                      snapshot
                                          .data
                                          .documents[snapshot1.data.documents[0]
                                                  ["length"] -
                                              index -
                                              1]['date']
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w200),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Text(
                                      textStyling(snapshot
                                          .data
                                          .documents[snapshot1.data.documents[0]
                                                  ["length"] -
                                              index -
                                              1]['read0']
                                          .toString()),
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w100),
                                      textAlign: TextAlign.left,
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
