import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laca/common.dart';
import 'package:laca/components/cards.dart';
import 'package:laca/controller/commoncontroller.dart';
import 'package:laca/model/processmodel.dart';
import 'package:laca/service/servicekey.dart';
import 'package:laca/service/uploadingservice.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UploadingService service = UploadingService();
    CommonController commonController = Get.find();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(constPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: getHeight(context) * 0.35,
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              runAlignment: WrapAlignment.spaceEvenly,
              children: [
                for (int i = 0; i < 4; i++)
                  percentCard(context,
                      value: 20, icon: icons[i], name: cardNames[i])
              ],
            ),
          ),
          Text(
            "Recent Proccess".toUpperCase(),
            textAlign: TextAlign.left,
            style: TextStyle(
              color: primaryColor,
              letterSpacing: 1,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          StreamBuilder(
              stream:
                  service.firebaseFirestore.collection(FGENERAL).snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  return Column(
                    children: [
                      for (int index = 0; index < snapshot.data!.size; index++)
                        infoCard(context,
                            snapshot: snapshot.data!.docs[index].data())
                    ],
                  );
                } else {
                  return SizedBox(
                      height: Get.height * 0.5,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Fetching...")
                        ],
                      ));
                }
              })
        ],
      ),
    );
  }
}
