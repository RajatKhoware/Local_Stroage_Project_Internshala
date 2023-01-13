// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'package:flutter/material.dart';
import '../../Data/model/userModel.dart';
import '../common/customText.dart';
import 'widget/list_of_users.dart';

class UsersDataScreen extends StatefulWidget {
  const UsersDataScreen({super.key});

  @override
  State<UsersDataScreen> createState() => _UsersDataScreenState();
}

class _UsersDataScreenState extends State<UsersDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            const CustomText(
                text: "User's Data",
                colors: Colors.black,
                fontsize: 30,
                fontWeight: FontWeight.bold),
            SizedBox(
              width: double.infinity,
              height: 700,
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return ListForUsers(
                    textName: users[index].name,
                    textId: users[index].id,
                  );
                },
              ),
            )
          ],
        )),
      ),
    );
  }
}
