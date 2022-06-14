import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../widgets/bottom_widget.dart';

class BakiBikroy extends StatefulWidget {
  const BakiBikroy({Key? key}) : super(key: key);

  @override
  State<BakiBikroy> createState() => _BakiBikroyState();
}

class _BakiBikroyState extends State<BakiBikroy> {
  late DateTime start_day;
  late String label_date;
  setdate() {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    var d = date.toString().substring(0, 0);
    setState(() {
      start_day = date;
      label_date = d;
    });
  }

  @override
  void initState() {
    super.initState();
    setdate();
  }

  @override
  Widget build(BuildContext context) {
    //double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.to(const BottomWidget());
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text("Bakite".tr),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Image(
                  image: AssetImage("assets/images/nagbak.png"),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 48,
                    width: w * 0.8,
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          labelText: "name".tr,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.green))),
                      keyboardType: TextInputType.name,
                      textAlign: TextAlign.start,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1000),
                        FilteringTextInputFormatter.singleLineFormatter
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 48,
                    width: w * 0.8,
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.mobile_friendly,
                            color: Colors.black,
                          ),
                          labelText: "Number".tr,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.green))),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.start,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(13),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 48,
                    width: w * 0.8,
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.attach_money,
                            color: Colors.black,
                          ),
                          labelText: "Amount".tr,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.green))),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.start,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1000),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 48,
                    width: w * 0.8,
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.feed,
                            color: Colors.black,
                          ),
                          labelText: "Details".tr,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.green))),
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.start,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1000),
                        //FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 48,
                    width: w * 0.8,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.calendar_month,
                            color: Colors.black,
                          ),
                          TextButton(
                              onPressed: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1990),
                                  lastDate: DateTime(2090),
                                ).then((date) {
                                  setState(() {
                                    start_day = date!;
                                  });
                                });
                              },
                              child: Text(
                                start_day == null
                                    ? label_date
                                    : "${start_day.day}-${start_day.month}-${start_day.year}",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 15,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 48,
                    width: w * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            primary: Colors.blue,
                          ),
                          child: Center(
                            child: Text(
                              "Customer".tr,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          onPressed: () {
                            //Get.to(const HomeScreen());
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            primary: Colors.blue,
                          ),
                          child: Center(
                            child: Text(
                              "Save".tr,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          onPressed: () {
                            //Get.to(const HomeScreen());
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
