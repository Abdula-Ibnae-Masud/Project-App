import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/bottom_widget.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String dropdownValue = "--Select Unit--";
  List item = [
    "--Select Unit--",
    "Pcs",
    "Kgs",
    "Liter",
    "Dozen",
    "Grams",
    "Bales",
    "Barrel",
    "Boxes",
    "Container",
    "Containers",
    "Cartons",
    "Cones",
    "Gallons",
    "Gross",
    "Lbs",
    "Meters",
    "MT",
    "Packs",
    "Pairs",
    "Pallets",
    "Pounds",
    "Rolls",
    "Sets",
    "Sheets",
    "Spools",
    "Square Feet",
    "Square Meter",
    "Tons",
    "Yeards"
  ];
  File? imageFile;

  Future<File?> _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker()
        // ignore: deprecated_member_use
        .getImage(source: ImageSource.gallery, maxHeight: 300, maxWidth: 300);
    _cropImage(pickedFile!.path);
    Navigator.pop(context);
    return null;
  }

  Future<File?> _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker()
        // ignore: deprecated_member_use
        .getImage(source: ImageSource.camera, maxHeight: 300, maxWidth: 300);
    _cropImage(pickedFile!.path);
    Navigator.pop(context);
    return null;
  }

  void _cropImage(filePath) async {
    File? cropped = (await ImageCropper().cropImage(
      sourcePath: filePath,
      // compressFormat: ImageCompressFormat.jpg,
      // aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      // compressQuality: 100,
      maxHeight: 300,
      maxWidth: 300,
    ));
    if (cropped != null) {
      setState(() {
        imageFile = cropped;
        //Image.file(File(imageFile!.path));
      });
    }
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
        title: Text("product".tr),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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
                        prefixIcon: const Icon(
                          Icons.feed_outlined,
                          color: Colors.black,
                        ),
                        labelText: "product-name".tr,
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
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.attach_money,
                          color: Colors.black,
                        ),
                        labelText: "cost".tr,
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
                        prefixIcon: const Icon(
                          Icons.attach_money,
                          color: Colors.black,
                        ),
                        labelText: "discount-free".tr,
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
                        prefixIcon: const Icon(
                          Icons.attach_money,
                          color: Colors.black,
                        ),
                        labelText: "discount".tr,
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
                Container(
                    height: 48,
                    width: w * 0.8,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          const Icon(Icons.feed_outlined),
                          DropdownButtonHideUnderline(
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
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 48,
                  width: w * 0.8,
                  child: TextFormField(
                    //enabled: false,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.feed_outlined,
                          color: Colors.black,
                        ),
                        labelText: "detail".tr,
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
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      primary: Colors.blue,
                    ),
                    child: Center(
                      child: Text(
                        "product-img".tr,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                          isDismissible: true,
                          context: context,
                          builder: ((builder) => bottomSheet()));
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    height: 150,
                    width: w * 0.8,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: imageFile != null
                        ? GestureDetector(
                            onTap: () {
                              _showImageDialog();
                            },
                            child: Image.file(imageFile!),
                          )
                        : GestureDetector(
                            onTap: () {
                              _showImageDialog();
                            },
                            child: const Icon(
                              Icons.camera_enhance_rounded,
                              color: Colors.green,
                            ),
                          )),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: _showImageDialog(),
    );
  }

  _showImageDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Select Image From"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    _getFromCamera();
                  },
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.camera),
                      ),
                      Text("Camera")
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    _getFromGallery();
                  },
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.image),
                      ),
                      Text("Gallery")
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
