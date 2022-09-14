import 'package:flutter/material.dart';
import 'package:laca/common.dart';
import 'package:laca/components/cards.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      value: 20.1,
                      color: colors[i],
                      icon: icons[i],
                      name: cardNames[i])
              ],
            ),
          ),
          Text(
            "Recent Proccess".toUpperCase(),
            textAlign: TextAlign.left,
            style: TextStyle(
              color: primaryColor,
              letterSpacing: 4,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          Column(
            children: List.generate(
                4, (index) => infoCard(context, name: "thiru gaja")),
          )
        ],
      ),
    );
  }
}
