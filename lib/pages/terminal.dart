import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../widgets/bottom_widget.dart';

class TerminalPage extends StatefulWidget {
  const TerminalPage({Key? key}) : super(key: key);

  @override
  State<TerminalPage> createState() => _TerminalPageState();
}

class _TerminalPageState extends State<TerminalPage> {
  bool isHiddenPassword = true;
  bool isValid = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.to(const BottomWidget());
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text("terminal".tr),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.only(top: 10),
                height: h * 0.3,
                width: w * 0.9,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 48,
                        width: w * 0.8,
                        child: TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.mobile_friendly,
                                color: Colors.black,
                              ),
                              labelText: "TerminalNumber".tr,
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
                                Icons.person,
                                color: Colors.black,
                              ),
                              labelText: "terminalname".tr,
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
                          controller: passController,
                          obscureText: isHiddenPassword,
                          enableSuggestions: false,
                          autocorrect: false,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.green)),
                            labelText: "pass".tr,
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  isHiddenPassword = !isHiddenPassword;
                                });
                              },
                              child: const Icon(
                                Icons.visibility,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          validator: (value) => value != null && value.isEmpty
                              ? 'Enter Password'
                              : null,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 48,
                        width: w * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                primary: Colors.blue,
                              ),
                              child: Center(
                                child: Text(
                                  "addTer".tr,
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
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
