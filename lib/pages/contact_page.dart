import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/bottom_widget.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final number = "09614501160";
  String dropdownValue = "==Select==";
  List item = ["==Select==", "Subcription", "Seales", "Others"];
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
          title: Text("contact".tr),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              Container(
                  height: 60,
                  width: w * 0.9,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF192c49)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "emergency".tr,
                        style:
                            const TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Ink(
                        decoration: const ShapeDecoration(
                            shape: CircleBorder(), color: Colors.red),
                        child: IconButton(
                            onPressed: () {
                              launchUrl(Uri.parse("tel://$number"));
                            },
                            icon: const Icon(
                              Icons.phone,
                              color: Colors.white,
                            )),
                      ),
                      Text(
                        "text".tr,
                        style:
                            const TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                  height: 48,
                  width: w * 0.8,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: dropdownValue,
                      onChanged: (newValue) {
                        setState(() {
                          dropdownValue = "$newValue";
                        });
                      },
                      items: item.map((state) {
                        return DropdownMenuItem(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(state),
                          ),
                          value: state,
                        );
                      }).toList(),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                width: w * 0.8,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Description".tr, border: InputBorder.none),
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.start,
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
                          "response".tr,
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
                          "Submit".tr,
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
            ]),
          ),
        ));
  }
}
