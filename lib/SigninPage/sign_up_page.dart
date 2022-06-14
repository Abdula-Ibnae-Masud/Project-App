import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_dart_flutter/SigninPage/sign_up_list.dart';
import 'package:getx_dart_flutter/loginPage/login_page.dart';

class SignupPageWidget extends StatefulWidget {
  const SignupPageWidget({Key? key}) : super(key: key);

  @override
  State<SignupPageWidget> createState() => _SignupPageWidgetState();
}

class _SignupPageWidgetState extends State<SignupPageWidget> {
  bool isHiddenPassword = true;
  bool isValid = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController mnumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController nidController = TextEditingController();
  TextEditingController distController = TextEditingController();
  TextEditingController thanaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void initState() {
    super.initState();
    DistrictDependentDropDown();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Center(
                    child: Text(
                      "Registration",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: h - 270,
                    width: w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            width: 2, color: Colors.grey.withOpacity(0.5))),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 8, right: 20),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: nameController,
                              decoration: const InputDecoration(
                                labelText: "Name",
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: mnumberController,
                              decoration: const InputDecoration(
                                labelText: "Mobile Number",
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                labelText: "Email Address",
                              ),
                              validator: (value) =>
                                  value != null && !value.contains('@')
                                      ? "Enter Email"
                                      : null,
                            ),
                            TextFormField(
                              controller: addressController,
                              decoration: const InputDecoration(
                                labelText: "Address",
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: nidController,
                              decoration: const InputDecoration(
                                labelText: "NID Number",
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 3),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          value: selectedDistrict!,
                                          onChanged: (newValue) {
                                            setState(() {
                                              thanas = [];
                                              ThanaDependentDropDown(
                                                  district[newValue!]);
                                              selectedDistrict = "$newValue";
                                            });
                                          },
                                          items: districts.map((e) {
                                            return DropdownMenuItem(
                                              child: Text("$e"),
                                              value: e,
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          value: selectedThana,
                                          onChanged: (newValue) {
                                            setState(() {
                                              selectedThana = "$newValue";
                                            });
                                          },
                                          items: thanas.map((e) {
                                            return DropdownMenuItem(
                                              child: Text("$e"),
                                              value: e,
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: passController,
                              obscureText: isHiddenPassword,
                              enableSuggestions: false,
                              autocorrect: false,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                labelText: "Password",
                                //border: const OutlineInputBorder(),
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
                              validator: (value) =>
                                  value != null && value.isEmpty
                                      ? 'Enter Password'
                                      : null,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  //minimumSize: const Size.fromHeight(50),
                  shape: const StadiumBorder(),
                ),
                child: const Text(
                  "Signup",
                  style: TextStyle(
                      fontSize: 20,
                      //fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                onPressed: () {
                  Get.to(const LoginPageWidget());
                  // String name = nameController.text;
                  // String number = mnumberController.text;
                  // print(nameController);
                  // print(mnumberController);
                  // print(addressController);
                  // print(nidController);
                  // print(emailController);
                  // print(passController);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
