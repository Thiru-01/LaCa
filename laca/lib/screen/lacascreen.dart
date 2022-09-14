import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laca/common.dart';
import 'package:laca/controller/commoncontroller.dart';

class LaCaScreen extends StatelessWidget {
  const LaCaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey imagekey = GlobalKey();
    CommonController controller = Get.find();
    return Padding(
      padding: const EdgeInsets.all(constPadding),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(constRadius)),
            width: double.infinity,
            height: getHeight(context) * 0.4,
            child: InkWell(
                onTap: () async {
                  printInfo(
                      info: imageCache.statusForKey(imagekey).live.toString());
                  final ImagePicker picker = ImagePicker();
                  XFile? image =
                      await picker.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    if (image.name.endsWith(".jpg")) {
                      controller.image = File(image.path).obs;
                      controller.isSelected.value = true;
                    }
                  } else {
                    controller.isSelected.value = false;
                  }
                },
                child: Obx(() => controller.isSelected.value == true
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(constRadius),
                        child: Image.file(
                          controller.image!.value!,
                          key: imagekey,
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.add_photo_alternate,
                            size: 80,
                            color: Colors.grey,
                          ),
                          Text(
                            "Please select image only jpg",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          )
                        ],
                      ))),
          ),
          Obx(() => controller.isSelected.value == true
              ? ElevatedButton(
                  onPressed: () async {
                    String rawUrl =
                        "https://thirugaja2001-fxvgtylzjg2fbhqj.socketxp.com/g_code";
                    Uri url = Uri.parse(rawUrl);
                    http.MultipartRequest request =
                        http.MultipartRequest('POST', url);

                    request.files.add(await http.MultipartFile.fromPath(
                        "media", controller.image!.value!.path,
                        contentType: MediaType("application", 'jpeg')));
                    http.StreamedResponse r = await request.send();
                    String rawData =
                        await r.stream.transform(utf8.decoder).join();
                    Map data = jsonDecode(rawData);
                    print(data);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentColor,
                  ),
                  child: const Text("Send"),
                )
              : const SizedBox.shrink())
        ],
      ),
    );
  }
}
