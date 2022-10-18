import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_watermark/image_watermark.dart';
//import 'package:example/image_watermark.dart';

void main() {
  runApp(const MyApp());
}

class Imagwithwatermark extends StatefulWidget {
  const Imagwithwatermark({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'image_watermark',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Imagwithwatermark(),
    );
  }
}

class _HomeScreenState extends State<Imagwithwatermark> {
  final ImagePicker _picker = ImagePicker();
  var imgBytes;
 var Recac;
  var imgBytes2;
  var _image;
  var watermarkedImgBytes;
  bool isLoading = false;
  String watermarkText = "", imgname = "image not selected";
  List<bool> textOrImage = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('image_watermark'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: SizedBox(
            width: 600,
            child: Column(
              children: [
                GestureDetector(
                  onTap: pickImage,
                  child: Container(
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      width: 600,
                      height: 250,
                      child: _image == null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.add_a_photo),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Click here to choose image')
                              ],
                            )
                          : Image.memory(imgBytes,
                              width: 600, height: 200, fit: BoxFit.fitHeight)),
                ),
                ToggleButtons(
                  fillColor: Colors.blue,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  borderWidth: 3,
                  borderColor: Colors.black26,
                  selectedBorderColor: Colors.black54,
                  selectedColor: Colors.black,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '  Text  ',
                      ),
                    ),
                    // second toggle button
                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          '  Image  ',
                        ))
                  ],
                  onPressed: (index) {
                    textOrImage = [false, false];
                    setState(() {
                      textOrImage[index] = true;
                    });
                  },
                  isSelected: textOrImage,
                ),
                const SizedBox(
                  height: 10,
                ),
                textOrImage[0]
                    ? Padding(
                        padding: const EdgeInsets.all(15),
                        child: SizedBox(
                          width: 600,
                          child: TextField(
                            onChanged: (val) {
                              watermarkText = val;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Watermark Text',
                              hintText: 'Watermark Text',
                            ),
                          ),
                        ),
                      )
                    : Row(
                        children: [
                          ElevatedButton(
                              onPressed: pickImage2,
                              child: const Text('Select Watermark image')),
                          Text(imgname)
                        ],
                      ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    if (textOrImage[0]) {
                      watermarkedImgBytes =
                          await image_watermark.addTextWatermark(
                        imgBytes,

                        ///image bytes
                        watermarkText, //watermark text
                        20, //
                        30,
                        color: Colors.black, //default : Colors.white
                      );

                      /// default : imageWidth/2
                    } else {
                      watermarkedImgBytes =
                          await image_watermark.addImageWatermark(
                              imgBytes, //image bytes
                              imgBytes2,
                              imgHeight: 200,
                              imgWidth: 200,
                              dstY: 400,
                              dstX: 400);
                    }

                    setState(() {
                      isLoading = false;
                    });
                  },
                  child: const Text('Add Watermark'),
                ),
                const SizedBox(
                  height: 10,
                ),
                isLoading ? const CircularProgressIndicator() : Container(),
                watermarkedImgBytes == null
                    ? Container()
                    : Image.memory(watermarkedImgBytes),
              ],
            ),
          ),
        ),
      ),
    );
  }

  pickImage() async {
    XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      _image = image;
      var t = await image.readAsBytes();
      imgBytes = Uint8List.fromList(t);
    }
    setState(() {});
  }

  pickImage2() async {
    XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      _image = image;
      imgname = image.name;
      var t = await image.readAsBytes();
      imgBytes2 = Uint8List.fromList(t);
    }
    setState(() {});
  }
}
