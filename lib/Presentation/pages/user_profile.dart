// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:local_stroage/Presentation/common/customText.dart';
import 'package:local_stroage/Presentation/pages/widget/profile_fields.dart';

class UserProfileScreen extends StatelessWidget {
  final String name;
  final String id;
  final String age;
  final String gender;
  final Function() signOut;
  const UserProfileScreen({
    Key? key,
    required this.name,
    required this.id,
    required this.age,
    required this.gender,
    required this.signOut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          leading: IconButton(
            icon: const Icon(CupertinoIcons.back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: const [
            Icon(CupertinoIcons.bookmark_solid),
            SizedBox(width: 5)
          ],
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
            width: 300,
            height: 250,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Colors.white),
            child: Column(
              children: <Widget>[
                ProfileField(textKey: "Name", textValue: name),
                ProfileField(textKey: "ID", textValue: id),
                ProfileField(textKey: "Age", textValue: age),
                ProfileField(textKey: "Gender", textValue: gender),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    signOut();
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 200,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 255, 0, 0)),
                    child: const Center(
                        child: CustomText(
                            text: "Sign-out",
                            colors: Colors.white,
                            fontsize: 20,
                            fontWeight: FontWeight.normal)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
