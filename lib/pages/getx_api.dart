import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ViewApiListData extends StatefulWidget {
  const ViewApiListData({Key? key}) : super(key: key);

  @override
  State<ViewApiListData> createState() => _ViewApiListDataState();
}

class _ViewApiListDataState extends State<ViewApiListData> {
  DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('API Show Feedback Data'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.backspace_rounded,
              size: 40,
            ),
            color: Colors.blueGrey,
          ),
        ),
        body: Obx(
          () {
            if (DataController.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: DataTable(
                          columns: const <DataColumn>[
                            DataColumn(
                              label: Text(
                                'Id Number',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'User Id',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Title Name',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ],
                          rows: DataController.listOfData
                              .map((e) => DataRow(cells: [
                                    DataCell(
                                      Text('${e.id}'),
                                    ),
                                    DataCell(
                                      Text('${e.userId}'),
                                    ),
                                    DataCell(
                                      Text(e.title),
                                    ),
                                  ]))
                              .toList()),
                    ),
                  ));
            }
          },
        ));
  }
}

class DataModel {
  int id;
  int userId;
  String title;
  String body;

  DataModel(
      {required this.id,
      required this.userId,
      required this.body,
      required this.title});

  factory DataModel.fromJson(Map<String, dynamic> parsedJson) {
    return DataModel(
        id: parsedJson['id'],
        userId: parsedJson['userId'],
        title: parsedJson['title'],
        body: parsedJson['body']);
  }
}

class DataController extends GetxController {
  static var isLoading = true.obs;
  static var listOfData = <dynamic>[].obs;

  @override
  void onInit() {
    listOfData.clear();
    getData();
    super.onInit();
  }

  static Future getData() async {
    http.Response response = await http
        .get(Uri.parse(('https://jsonplaceholder.typicode.com/posts')));
    if (response.statusCode == 200) {
      //listOfData = json.decode(response.body);
      //print(json.decode(response.body).length);

      listOfData.clear();
      for (int i = 0; i < json.decode(response.body).length; i++) {
        DataModel dataModel = DataModel.fromJson(json.decode(response.body)[i]);
        listOfData.add(DataModel(
            id: dataModel.id,
            userId: dataModel.userId,
            body: dataModel.body,
            title: dataModel.title));
      }
      // print(listOfData.toJson());
      isLoading(false);
    } else {
      isLoading(true);
    }
  }
}
