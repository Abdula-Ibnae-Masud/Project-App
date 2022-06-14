import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../widgets/bottom_widget.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late TextEditingController _controller;
  String dropdownValue1 = "Open";
  List item1 = ["Open", "Close"];
  String dropdownValue2 = "Available";
  List item2 = ["Available", "Not Available"];
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: '017000');
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
        title: Text("Profile".tr),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 48,
                  width: w * 0.8,
                  child: TextFormField(
                    //enabled: false,
                    decoration: InputDecoration(
                        labelText: "Name".tr,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.green))),
                    keyboardType: TextInputType.name,
                    textAlign: TextAlign.start,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(100),
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
                    //initialValue: '017',
                    enabled: false,
                    controller: _controller,
                    decoration: InputDecoration(
                        labelText: "Mobile".tr,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.green))),
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
                        labelText: "Email".tr,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.green))),
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.start,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(100),
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
                        labelText: "address".tr,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.green))),
                    keyboardType: TextInputType.streetAddress,
                    textAlign: TextAlign.start,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(100),
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
                    enabled: false,
                    decoration: InputDecoration(
                        labelText: "pac".tr,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.green))),
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.start,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(100),
                      FilteringTextInputFormatter.singleLineFormatter
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                        value: dropdownValue1,
                        onChanged: (newValue) {
                          setState(() {
                            dropdownValue1 = "$newValue";
                          });
                        },
                        items: item1.map((state) {
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
                    height: 48,
                    width: w * 0.8,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: dropdownValue2,
                        onChanged: (newValue) {
                          setState(() {
                            dropdownValue2 = "$newValue";
                          });
                        },
                        items: item2.map((state) {
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
                SizedBox(
                  height: 48,
                  width: w * 0.8,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      primary: Colors.blue,
                    ),
                    child: Center(
                      child: Text(
                        "update".tr,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
