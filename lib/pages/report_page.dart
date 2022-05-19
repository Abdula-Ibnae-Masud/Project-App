import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_dart_flutter/pages/homepage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rflutter_alert/rflutter_alert.dart';

class ReportShowingMethod extends StatefulWidget {
  const ReportShowingMethod({Key? key}) : super(key: key);

  @override
  _ReportShowingMethodState createState() => _ReportShowingMethodState();
}

class _ReportShowingMethodState extends State<ReportShowingMethod> {
  String req = "no";
  List lst = [];
  final _datepickingformKey = GlobalKey<FormState>();
  late DateTime _start_day;
  late DateTime _end_day;
  late String label_date;
  late List result;

  setdate() {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    var d = date.toString().substring(0, 10);
    setState(() {
      _start_day = date;
      _end_day = date;
      label_date = d;
    });
  }

  Future postForm() async {
    if (_start_day != null && _end_day != null) {
      // make the request
      http.Response res = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      lst = jsonDecode(res.body);
      result = jsonDecode(res.body);
      Map ress = result[0];

      if (ress['response'] == 'Error') {
        // 'response' == key name of url body like (id,userId,title)
        Alert(
          context: context,
          type: AlertType.error,
          title: "No Data Found!!!",
          buttons: [
            DialogButton(
              child: const Text(
                "Ok",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/id');
              },
              width: 120,
            )
          ],
        ).show();
      } else {
        setState(() {
          req = "no";
          lst = jsonDecode(res.body); // Table data list passing from here
        });
      }
    } else if ((_start_day == null) | (_end_day == null)) {
      Alert(
        context: context,
        type: AlertType.error,
        title: "Must Put Start And End Date!!",
        // desc: "email:${data['email']} pass:${data['password']}",
        buttons: [
          DialogButton(
            child: const Text(
              "Ok",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/id');
            },
            width: 120,
          )
        ],
      ).show();
    } else {
      Alert(
        context: context,
        type: AlertType.error,
        title: "Must Put Start And End Date!!",
        // desc: "email:${data['email']} pass:${data['password']}",
        buttons: [
          DialogButton(
            child: const Text(
              "Ok",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/id');
            },
            width: 120,
          )
        ],
      ).show();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setdate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () {
            Get.to(const HomeScreen());
          },
          icon: const Icon(
            Icons.backspace_rounded,
            size: 40,
          ),
          color: Colors.blueGrey,
        ),
      ),
      backgroundColor: const Color.fromRGBO(228, 235, 245, 1.0),
      body: SafeArea(
          child: ListView(children: [
        //page header
        const Padding(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Center(
            child: Text(
              "Date Picker Report Method",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
        ),

        //form for date picking
        Form(
            key: _datepickingformKey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Container(
                    width: 130,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(228, 235, 245, 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(205, 213, 234, 1.0),
                            offset: Offset(-0.0, -2.0),
                            blurRadius: 0.0,
                            spreadRadius: 8.0,
                          ),
                          BoxShadow(
                            color: Color.fromRGBO(248, 249, 254, 1.0),
                            offset: Offset(3.0, 3.0),
                            blurRadius: 5.0,
                            spreadRadius: 5.0,
                          ),
                        ]),
                    child: TextButton(
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1990),
                            lastDate: DateTime(2090),
                          ).then((date) {
                            setState(() {
                              _start_day = date!;
                            });
                          });
                        },
                        child: Text(
                          _start_day == null
                              ? "$label_date"
                              : _start_day.toString().substring(0, 10),
                          style: const TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 17,
                          ),
                        )),
                  ),
                ),
                const Text(
                  "TO",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Container(
                    width: 130,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(228, 235, 245, 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(205, 213, 234, 1.0),
                            offset: Offset(-0.0, -2.0),
                            blurRadius: 0.0,
                            spreadRadius: 8.0,
                          ),
                          BoxShadow(
                            color: Color.fromRGBO(248, 249, 254, 1.0),
                            offset: Offset(3.0, 3.0),
                            blurRadius: 5.0,
                            spreadRadius: 5.0,
                          ),
                        ]),
                    child: TextButton(
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1990),
                            lastDate: DateTime(2090),
                          ).then((date) {
                            setState(() {
                              _end_day = date!;
                            });
                            // postForm();
                          });
                        },
                        child: Text(
                          _end_day == null
                              ? "$label_date"
                              : _end_day.toString().substring(0, 10),
                          style: const TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 17,
                          ),
                        )),
                  ),
                ),
              ],
            )),

        Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton.extended(
                // backgroundColor: const Color(0xff03dac6),
                foregroundColor: Colors.white,
                onPressed: () {
                  postForm();
                },
                label: const Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "SEARCH",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        //table of entries
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 25, 15, 5),
          child: Container(
            decoration: BoxDecoration(
                color: const Color.fromRGBO(228, 235, 245, 1.0),
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(205, 213, 234, 1.0),
                    offset: Offset(-0.0, -2.0),
                    blurRadius: 0.0,
                    spreadRadius: 8.0,
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(248, 249, 254, 1.0),
                    offset: Offset(3.0, 3.0),
                    blurRadius: 5.0,
                    spreadRadius: 5.0,
                  ),
                ]),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: DataTable(
                      columns: const <DataColumn>[
                        DataColumn(
                          label: SizedBox(
                            child: Text(
                              'Id:',
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            child: Text(
                              'UserId:',
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            child: Text(
                              'Title:',
                              style: TextStyle(),
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: SizedBox(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 20, 0),
                              child: Text(
                                'Body:',
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ),
                      ],
                      rows: lst
                          .map(
                            (e) => DataRow(
                              cells: <DataCell>[
                                DataCell(SizedBox(
                                    width: 30,
                                    child: Text(
                                      '${e['id']}',
                                      style: const TextStyle(
                                        fontSize: 9,
                                      ),
                                      textAlign: TextAlign.left,
                                    ))),
                                DataCell(SizedBox(
                                    width: 30,
                                    child: Text(
                                      '${e['userId']}',
                                      style: const TextStyle(
                                        fontSize: 9,
                                      ),
                                      textAlign: TextAlign.left,
                                    ))),
                                DataCell(SizedBox(
                                    width: 90,
                                    child: Text(
                                      '${e['title']}',
                                      style: const TextStyle(
                                        fontSize: 9,
                                      ),
                                      textAlign: TextAlign.left,
                                    ))),
                                DataCell(SizedBox(
                                    width: 150,
                                    child: Text(
                                      '${e['body']}',
                                      style: const TextStyle(
                                        fontSize: 9,
                                      ),
                                      textAlign: TextAlign.left,
                                    ))),
                              ],
                            ),
                          )
                          .toList()),
                ),
              ),
            ),
          ),
        ),
      ])),
    );
  }
}
