import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchWeiget extends StatefulWidget {
  const SearchWeiget({Key? key}) : super(key: key);

  @override
  State<SearchWeiget> createState() => _SearchWeigetState();
}

class _SearchWeigetState extends State<SearchWeiget> {
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

  @override
  void initState() {
    super.initState();
    foundPlayers.value = allPlayers;
  }

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
    } else if (mobile.isNotEmpty) {
      results = allPlayers
          .where((element) => element["mobile"]
              .toString()
              .toLowerCase()
              .contains(mobile.toLowerCase()))
          .toList();
    }
    foundPlayers.value = results;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 48,
        width: 200,
        child: TextFormField(
          onChanged: (value) => filterPlayer(value, value),
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.green)),
            labelText: 'Search',
          ),
        ),
      ),
    );
  }
}

/*Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: foundPlayers.value.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      foundPlayers.value[index]['name'],
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(foundPlayers.value[index]['country']),
                  ),
                ),
              ),
            ),*/
