import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/bottom_widget.dart';

class ProductAdd extends StatefulWidget {
  const ProductAdd({Key? key}) : super(key: key);

  @override
  State<ProductAdd> createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
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

  File? _imageFile;
  dynamic _pickImageError;
  bool isVideo = false;
  String? _retrieveDataError;

  final ImagePicker _picker = ImagePicker();

  Text? _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      const Text result = Text("_retrieveDataError");
      _retrieveDataError = null;
      return result;
    }
    return null;
  }

  Widget _previewImage() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_imageFile != null) {
      if (kIsWeb) {
        return Image.network(_imageFile!.path);
      } else {
        return Semantics(
            child: Image.file(File(_imageFile!.path)),
            label: 'image_picker_example_picked_image');
      }
    } else if (_pickImageError != null) {
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'You have not yet picked an image.',
        textAlign: TextAlign.center,
      );
    }
  }

  Future<void> retrieveLostData() async {
    // ignore: deprecated_member_use
    final LostData response = await _picker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      isVideo = false;
      setState(() {
        _imageFile = response.file as File?;
      });
    } else {
      _retrieveDataError = response.exception!.code;
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
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ImagePicked())),
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

  void takePhoto(ImageSource source) async {
    // ignore: deprecated_member_use
    final pickedFile = await _picker.getImage(
      source: source,
      // maxWidth: 1000,
      // maxHeight: 1000,
      // imageQuality: 1000,
    );
    _cropImage(pickedFile!.path);
    Navigator.pop(context);
    // setState(() {
    //   _imageFile = pickedFile;
    // });
  }

  void _cropImage(filePath) async {
    File? cropped = (await ImageCropper().cropImage(
      sourcePath: filePath,
      compressFormat: ImageCompressFormat.jpg,
      // aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      // compressQuality: 480,
      // maxHeight: 480,
      // maxWidth: 480,
    ));
    if (cropped != null) {
      setState(() {
        _imageFile = cropped;
      });
    }
  }

  Widget bottomSheet() {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          const Text(
            "Select Image From",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.camera),
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                ),
                const Text(
                  "Camera",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.image),
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                  },
                ),
                const Text(
                  "Gallery",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ]),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget ImagePicked() {
    return _imageFile == null
        ? const Text("")
        : !kIsWeb && defaultTargetPlatform == TargetPlatform.android
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FutureBuilder<void>(
                    future: retrieveLostData(),
                    builder:
                        (BuildContext context, AsyncSnapshot<void> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return const Text(
                            'You have not yet picked an image.',
                            textAlign: TextAlign.center,
                          );
                        case ConnectionState.done:
                          return _previewImage();
                        default:
                          if (snapshot.hasError) {
                            return const Text(
                              'Pick image/video error:',
                              textAlign: TextAlign.center,
                            );
                          } else {
                            return const Text(
                              'You have not yet picked an image.',
                              textAlign: TextAlign.center,
                            );
                          }
                      }
                    },
                  ),
                  TextButton.icon(
                      onPressed: () {
                        setState(() {
                          _imageFile = null;
                        });
                      },
                      icon: const Icon(Icons.cancel_outlined),
                      label: const Text("Cancel\nImage"))
                ],
              )
            : _previewImage();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
