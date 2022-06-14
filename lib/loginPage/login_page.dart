import 'package:flutter/material.dart';
import 'package:getx_dart_flutter/SigninPage/sign_up_list.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key? key}) : super(key: key);

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 30, right: 30),
            width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Center(
                  child: Text(
                    "Login Here",
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
                  height: h / 5,
                  width: w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          width: 2, color: Colors.grey.withOpacity(0.5))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 8, right: 20),
                    child: Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
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
                "Login",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              onPressed: () {
                //Get.to(const HomeScreen());
                // String number = mnumberController.text;
                // String pass = passController.text;
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          RichText(
              text: const TextSpan(
                  text: "Forgotten Password?",
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 20,
                  ),
                  children: [
                TextSpan(
                  text: " Click here",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  //recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>const SignUpPage())
                )
              ])),
        ],
      ),
    );
  }
}
