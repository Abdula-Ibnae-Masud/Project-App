import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getx_dart_flutter/SigninPage/sign_up_list.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isHiddenPassword = true;
  bool isValid = false;

  TextEditingController mnumberController = TextEditingController();
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
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: w * 0.8,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Center(
                      child: Text(
                        "Forget Password",
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
                      height: h / 3,
                      width: w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              width: 2, color: Colors.grey.withOpacity(0.5))),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, top: 8, right: 20),
                        child: Center(
                          child: Column(
                            children: [
                              TextFormField(
                                  controller: mnumberController,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.phone,
                                      color: Colors.black,
                                    ),
                                    labelText: "Mobile Number",
                                  ),
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.start,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(13),
                                    FilteringTextInputFormatter.digitsOnly
                                  ]),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                child: TextFormField(
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.password,
                                        color: Colors.black,
                                      ),
                                      labelText: "Input OTP Here",
                                    ),
                                    //style: Theme.of(context).textTheme.headline6,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.start,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(100),
                                      FilteringTextInputFormatter.digitsOnly
                                    ]),
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
                                  labelText: "New Password",
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 90, vertical: 20),
                    shape: const RoundedRectangleBorder(),
                    primary: Colors.blue,
                  ),
                  child: const Text(
                    "SUBMIT",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
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
    );
  }
}
