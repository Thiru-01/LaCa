// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laca/common.dart';
import 'package:laca/components/cards.dart';
import 'package:laca/controller/commoncontroller.dart';
import 'package:laca/service/server.dart';
import 'package:laca/service/uploadingservice.dart';

class LaCaScreen extends StatelessWidget {
  const LaCaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey imagekey = GlobalKey();
    TextEditingController textEditingController = TextEditingController();
    Rx<TextEditingController> processController = TextEditingController().obs;
    UploadingService uploadingService = UploadingService();
    Server server = Server();
    RxBool makeReadonly = false.obs;
    CommonController controller = Get.find();
    textEditingController.text = controller.getUrl();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.all(constPadding),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Obx(() => TextFormField(
                    controller: textEditingController,
                    readOnly: controller.haveValue.value,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () {
                      controller.containText.value =
                          formKey.currentState!.validate();
                      FocusManager.instance.primaryFocus!.unfocus();
                    },
                    validator: (value) {
                      RegExp pattern = RegExp(
                          r"^(http(s)?:\/\/)[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!$&'\(\)\*\+,;=.]+$");
                      if (value != null && pattern.hasMatch(value)) {
                        controller.setUrl(value);
                        return null;
                      } else {
                        controller.haveValue.value = false;
                        Get.showSnackbar(
                            snackBar(context, text: "Please enter valid url"));
                        return "Please enter the valid url";
                      }
                    },
                    style: TextStyle(
                        color: controller.haveValue.isFalse
                            ? Colors.black
                            : Colors.grey),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Please provide flask server url",
                        suffixIcon: Icon(
                          FontAwesomeIcons.link,
                          size: 20,
                        )),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: constPadding),
                child: TextFormField(
                  controller: processController.value,
                  textInputAction: TextInputAction.done,
                  onEditingComplete: () {
                    controller.containText.value =
                        formKey.currentState!.validate();
                    FocusManager.instance.primaryFocus!.unfocus();
                  },
                  textCapitalization: TextCapitalization.sentences,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      controller.containText.value = false;
                      Get.showSnackbar(snackBar(context,
                          text: "Please enter the name of the process"));
                      return "Please enter the name";
                    } else {
                      controller.containText.value = true;
                      return null;
                    }
                  },
                  style: TextStyle(
                      color: makeReadonly.isFalse ? Colors.black : Colors.grey),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Name of the process",
                      suffixIcon: Icon(
                        FontAwesomeIcons.connectdevelop,
                        size: 30,
                      )),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: constPadding, bottom: constPadding),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(constRadius)),
                width: double.infinity,
                height: getHeight(context) * 0.4,
                child: InkWell(
                    onTap: () async {
                      final ImagePicker picker = ImagePicker();
                      XFile? image =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (image != null) {
                        controller.isSelected.value = false;
                        controller.image = File(image.path).obs;
                        controller.isSelected.value = true;
                      } else {
                        controller.isSelected.value = false;
                      }
                    },
                    child: Obx(() => controller.isSelected.value == true
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(constRadius),
                            child: Image.file(
                              controller.image!.value!,
                              fit: BoxFit.cover,
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
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              )
                            ],
                          ))),
              ),
              Obx(() => controller.isSelected.value == true &&
                      controller.containText.isTrue
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              showLoaderDialog(context);
                              Map data = await server.getResponse(
                                  link: textEditingController.text,
                                  imagePath: controller.image!.value!.path);

                              if (data['length'] > 0) {
                                await uploadingService.uploadFire(context,
                                    name: processController.value.text,
                                    data: data,
                                    timestamp: DateTime.now()
                                        .millisecondsSinceEpoch
                                        .toString());
                                controller.isSelected.value = false;
                                controller.image = null;
                                processController.value.clear();
                                Navigator.pop(context);
                                controller.response = data.obs;
                                controller.bottomIndex.value = 2;
                                controller.pageController.animateToPage(2,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease);
                              } else {
                                Navigator.pop(context);
                                Get.showSnackbar(snackBar(context,
                                    text:
                                        "Server is busy please try after some times"));
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              fixedSize:
                                  Size(Get.width * 0.3, Get.height * 0.05)),
                          child: const Text("Send"),
                        ),
                        ElevatedButton(
                            onPressed: () => controller.haveValue.value = false,
                            style: ElevatedButton.styleFrom(
                                fixedSize:
                                    Size(Get.width * 0.3, Get.height * 0.05)),
                            child: const Text(
                              "Change url",
                            ))
                      ],
                    )
                  : const SizedBox.shrink())
            ],
          ),
        ),
      ),
    );
  }
}
