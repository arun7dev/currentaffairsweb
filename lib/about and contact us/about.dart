import 'package:currentaffairsweb/navbar/navbar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  final ScrollController _controllerOne = ScrollController();
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
                  return Desktopabout();
                } else if (constraints.maxWidth < 1200) {
                  return Tabdayabout();
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

class Desktopabout extends StatefulWidget {
  @override
  _DesktopaboutState createState() => _DesktopaboutState();
}

class _DesktopaboutState extends State<Desktopabout> {
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scrollbar(
          isAlwaysShown: true,
          controller: controller,
          child: ListView(
            controller: controller,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'About',
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'US',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 200),
                child: Text(
                  'Current Affairs gets you the daily events from National, World, Science,Technology & Sports, which would be useful for all the competitive exams like UPSC, SSC, IBPS, RRB, LIC & lots more.\n',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Source',
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 200),
                child: Text(
                  'The current affairs are hand typed and edited. The major source from where we get all the current affairs are Mainstream Newspaper and websites mentioned below. All the important news are shrunk down to points needed for exam purpose\n',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12, left: 200),
                    child: Text(
                      'Image Source : \n',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  RaisedButton(
                    color: Colors.blue[900],
                    onPressed: () async {
                      const url = 'https://unsplash.com/';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: new Text(
                      'Unsplash',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 12,
                      left: 200,
                    ),
                    child: Text(
                      'News References : \n',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6, left: 200),
                    child: RaisedButton(
                      color: Colors.blue[900],
                      onPressed: () async {
                        const url = 'https://www.jagranjosh.com/';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: new Text(
                        'jagranjosh',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6, left: 200),
                    child: RaisedButton(
                      color: Colors.blue[900],
                      onPressed: () async {
                        const url = 'https://www.fresherslive.com/';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: new Text(
                        'fresherslive',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6, left: 200),
                    child: RaisedButton(
                      color: Colors.blue[900],
                      onPressed: () async {
                        const url = 'https://www.gktoday.in/';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: new Text(
                        'gktoday',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6, left: 200),
                    child: RaisedButton(
                      color: Colors.blue[900],
                      onPressed: () async {
                        const url = 'https://www.thehindu.com/';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: new Text(
                        'thehindu',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6, left: 200),
                    child: RaisedButton(
                      color: Colors.blue[900],
                      onPressed: () async {
                        const url = 'https://timesofindia.indiatimes.com/';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: new Text(
                        'timesofindia',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6, left: 200),
                    child: RaisedButton(
                      color: Colors.blue[900],
                      onPressed: () async {
                        const url = 'https://indianexpress.com/';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: new Text(
                        'indianexpress',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Tabdayabout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'About',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue[900],
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'US',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                'Current Affairs gets you the daily events from National, World, Science,Technology & Sports, which would be useful for all the competitive exams like UPSC, SSC, IBPS, RRB, LIC & lots more.\n',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Source',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue[900],
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                'The current affairs are hand typed and edited. The major source from where we get all the current affairs are Mainstream Newspaper and websites mentioned below. All the important news are shrunk down to points needed for exam purpose\n',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 6,
                  ),
                  child: Text(
                    'Image Source : \n',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                RaisedButton(
                  color: Colors.blue[900],
                  onPressed: () async {
                    const url = 'https://unsplash.com/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: new Text(
                    'Unsplash',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 6,
                  ),
                  child: Text(
                    'News References : \n',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: RaisedButton(
                    color: Colors.blue[900],
                    onPressed: () async {
                      const url = 'https://www.jagranjosh.com/';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: new Text(
                      'jagranjosh',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: RaisedButton(
                    color: Colors.blue[900],
                    onPressed: () async {
                      const url = 'https://www.fresherslive.com/';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: new Text(
                      'fresherslive',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: RaisedButton(
                    color: Colors.blue[900],
                    onPressed: () async {
                      const url = 'https://www.gktoday.in/';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: new Text(
                      'gktoday',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: RaisedButton(
                    color: Colors.blue[900],
                    onPressed: () async {
                      const url = 'https://www.thehindu.com/';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: new Text(
                      'thehindu',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: RaisedButton(
                    color: Colors.blue[900],
                    onPressed: () async {
                      const url = 'https://timesofindia.indiatimes.com/';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: new Text(
                      'timesofindia',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: RaisedButton(
                    color: Colors.blue[900],
                    onPressed: () async {
                      const url = 'https://indianexpress.com/';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: new Text(
                      'indianexpress',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
