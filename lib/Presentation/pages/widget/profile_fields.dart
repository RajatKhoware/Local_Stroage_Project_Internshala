import 'package:flutter/material.dart';
import 'package:local_stroage/Presentation/common/customText.dart';

class ProfileField extends StatelessWidget {
  final String textKey;
  final String textValue;
  const ProfileField({
    Key? key,
    required this.textKey,
    required this.textValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
        width: 300,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            CustomText(
                text: textKey,
                colors: Colors.white,
                fontsize: 15,
                fontWeight: FontWeight.normal),
            const CustomText(
                text: ":",
                colors: Colors.white,
                fontsize: 15,
                fontWeight: FontWeight.normal),
            CustomText(
                text: textValue,
                colors: Colors.white,
                fontsize: 15,
                fontWeight: FontWeight.bold),
          ]),
        ),
      ),
    );
  }
}
