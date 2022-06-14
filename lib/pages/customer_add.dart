import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../widgets/bottom_widget.dart';

class CustomerAdd extends StatefulWidget {
  const CustomerAdd({Key? key}) : super(key: key);

  @override
  State<CustomerAdd> createState() => _CustomerAddState();
}

class _CustomerAddState extends State<CustomerAdd> {
  late DateTime start_day;
  late String label_date;
  setdate() {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    var d = date.toString().substring(0, 10);
    setState(() {
      start_day = date;
      label_date = d;
    });
  }

  @override
  void initState() {
    super.initState();
    setdate();
    foundPlayers.value = allPlayers;
  }

  final List<Map<String, dynamic>> allPlayers = [
    {"name": "Mashrafe", "mobile": "013000", "country": "Bangladesh"},
    {"name": "Mahamudullah", "mobile": "014000", "country": "Bangladesh"},
    {"name": "Rohit Sharma", "mobile": "013001", "country": "India"},
    {"name": "Virat Kohli ", "mobile": "014001", "country": "India"},
    {"name": "Glenn Maxwell", "mobile": "013002", "country": "Australia"},
    {"name": "Aaron Finch", "mobile": "014002", "country": "Australia"},
    {"name": "Martin Guptill", "mobile": "013003", "country": "New Zealand"},
    {"name": "Trent Boult", "mobile": "014003", "country": "New Zealand"},
    {"name": "Shoaib Malik", "mobile": "015000", "country": "Pakistan"},
    {"name": "Hasan Ali", "mobile": "016000", "country": "Pakistan"},
    {"name": "David Miller", "mobile": "017000", "country": "South Africa"},
    {"name": "Kagiso Rabada", "mobile": "015001", "country": "South Africa"},
    {"name": "Moin Ali", "mobile": "016001", "country": "England"},
    {"name": "Ben Stokes", "mobile": "017001", "country": "England"},
    {"name": "Chris Gayle", "mobile": "018000", "country": "West Indies"},
    {"name": "Jason Holder", "mobile": "019000", "country": "West Indies"},
  ];
  Rx<List<Map<String, dynamic>>> foundPlayers =
      Rx<List<Map<String, dynamic>>>([]);

  void onClose() {}
  void filterPlayer(String playerName, String mobile) {
    List<Map<String, dynamic>> results = [];
    if (playerName.isEmpty) {
      results = allPlayers;
    } else if (playerName.isNotEmpty) {
      results = allPlayers
          .where((element) => element["name"]
              .toString()
              .toLowerCase()
              .contains(playerName.toLowerCase()))
          .toList();
    } else {
      results = allPlayers
          .where((element) => element["mobile"].toString().contains(mobile))
          .toList();
    }
    foundPlayers.value = results;
  }

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
        title: Text("Customer".tr),
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
                height: h * 0.33,
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
                                Icons.location_on_outlined,
                                color: Colors.black,
                              ),
                              labelText: "Address".tr,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.green))),
                          keyboardType: TextInputType.streetAddress,
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
                                  "add".tr,
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
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.only(top: 10),
                height: h * 0.19,
                width: w * 0.9,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        height: 48,
                        width: w * 0.8,
                        decoration: BoxDecoration(
                          color: const Color(0xFF192c49),
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextButton(
                          child: Text(
                            "list".tr,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SizedBox(
                          height: 48,
                          width: w * 0.8,
                          child: TextFormField(
                            onChanged: (value) => filterPlayer(value, value),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.green)),
                              labelText: 'Search'.tr,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: h * 0.25,
              width: w * 0.9,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: h * 0.2,
                    width: w * 0.37,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Obx(
                      () => ListView.builder(
                        itemCount: foundPlayers.value.length,
                        itemBuilder: (context, index) => ListTile(
                          title: Text(
                            foundPlayers.value[index]['name'],
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(foundPlayers.value[index]['country']),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: h * 0.2,
                    width: w * 0.37,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Obx(
                      () => ListView.builder(
                        itemCount: foundPlayers.value.length,
                        itemBuilder: (context, index) => ListTile(
                          title: Text(
                            foundPlayers.value[index]['mobile'],
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(foundPlayers.value[index]['country']),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
