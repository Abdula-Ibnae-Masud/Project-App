import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_dart_flutter/Otp_Page/otp.dart';
import 'package:getx_dart_flutter/SigninPage/sign_up_page.dart';
import 'package:getx_dart_flutter/image_picker/product_add.dart';
import 'package:getx_dart_flutter/loginPage/forget_password.dart';
import 'package:getx_dart_flutter/loginPage/login_page.dart';
import 'package:getx_dart_flutter/pages/baki_bikroy.dart';
import 'package:getx_dart_flutter/pages/baki_collection.dart';
import 'package:getx_dart_flutter/pages/customer_add.dart';
import 'package:getx_dart_flutter/pages/nogod_bikroy.dart';
import 'package:getx_dart_flutter/pages/payment_page.dart';
import 'package:getx_dart_flutter/widgets/input_button.dart';
import '../pages/expense_entry.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isDark = false;

  @override
  Widget build(BuildContext context) {
    //double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            'home'.tr,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
        //centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 4, right: 20),
            child: PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          var locale = const Locale("bn", "BN");
                          Get.updateLocale(locale);
                        },
                        child: const Text(
                          "বাংলা",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          var locale = const Locale("en", "US");
                          Get.updateLocale(locale);
                        },
                        child: const Text(
                          "English",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
              child: const Icon(
                Icons.language,
                size: 40,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white.withOpacity(0.9),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 80,
              width: w * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 169, 217, 241),
                // boxShadow: const [
                //   BoxShadow(
                //       color: Color.fromARGB(255, 189, 187, 209), blurRadius: 5),
                // ],
              ),
              margin: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Any Name',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black),
                        )),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: Text(
                          "package".tr,
                          style: const TextStyle(
                              fontSize: 15, color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 30, right: 20),
                        height: 35,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 2, color: Colors.green)),
                        child: Center(
                            child: TextButton(
                          child: Text("payment".tr,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black)),
                          onPressed: () {
                            Get.to(const PaymentPageWidget());
                          },
                        )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 22),
            child: Row(
              children: [
                Text(
                  "Catagories".tr,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                primary: false,
                crossAxisSpacing: 10,
                childAspectRatio: 3 / 3,
                children: [
                  InputButton(
                    image:
                        const AssetImage('assets/flaticons/nagad bikroy.png'),
                    text: 'Nogod'.tr,
                    onTap: () {
                      Get.to(const NogodBikroy());
                    },
                  ),
                  InputButton(
                    image: const AssetImage('assets/flaticons/stock out.png'),
                    text: 'Stock'.tr,
                    onTap: () {
                      Get.to(const ForgotPassword());
                    },
                  ),
                  InputButton(
                    image: const AssetImage('assets/flaticons/baki bikroy.png'),
                    text: 'Bakite'.tr,
                    onTap: () {
                      Get.to(const BakiBikroy());
                    },
                  ),
                  InputButton(
                    image: const AssetImage('assets/flaticons/reports.png'),
                    text: 'Reports'.tr,
                    onTap: () {
                      Get.to(const MyOTPWidget());
                    },
                  ),
                  InputButton(
                    image: const AssetImage(
                        'assets/flaticons/baki collection.png'),
                    text: 'baki'.tr,
                    onTap: () {
                      Get.to(const BakiCollection());
                    },
                  ),
                  InputButton(
                    image: const AssetImage('assets/flaticons/service add.png'),
                    text: 'Add'.tr,
                    onTap: () {
                      Get.to(const SignupPageWidget());
                    },
                  ),
                  InputButton(
                    image: const AssetImage('assets/flaticons/my ponno.png'),
                    text: 'Amar'.tr,
                    onTap: () {
                      Get.to(const ProductAdd());
                    },
                  ),
                  InputButton(
                    image: const AssetImage('assets/flaticons/online.png'),
                    text: 'Online'.tr,
                    onTap: () {
                      Get.to(const LoginPageWidget());
                    },
                  ),
                  InputButton(
                    image:
                        const AssetImage('assets/flaticons/add customer.png'),
                    text: 'Customer'.tr,
                    onTap: () {
                      Get.to(const CustomerAdd());
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      //bottomNavigationBar: const BottomWidget(),
      /*bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blueAccent,
          selectedItemColor: Colors.amberAccent,
          unselectedItemColor: Colors.white,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: [
            BottomNavigationBarItem(
              label: "Profile".tr,
              icon: const Icon(Icons.person),
              //backgroundColor: Colors.blueAccent
            ),
            BottomNavigationBarItem(
              label: "Terminal".tr,
              icon: const Icon(Icons.add_box_outlined),
            ),
            BottomNavigationBarItem(
              label: "Contact".tr,
              icon: const Icon(Icons.contact_phone_outlined),
            ),
            BottomNavigationBarItem(
              label: "Help".tr,
              icon: const Icon(Icons.help_outlined),
            ),
          ]),*/
    );
  }
}
