// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:local_stroage/Presentation/common/customText.dart';
import 'package:local_stroage/Presentation/pages/user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListForUsers extends StatefulWidget {
  final String textName;
  final String textId;

  const ListForUsers({
    Key? key,
    required this.textName,
    required this.textId,
  }) : super(key: key);

  @override
  State<ListForUsers> createState() => _ListForUsersState();
}

class _ListForUsersState extends State<ListForUsers> {
  late String _age = '';
  late String _gender = '';
  bool isSigneIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200,
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 2.5),
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Name :${widget.textName}",
                      colors: Colors.black,
                      fontsize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      text: "Id :${widget.textId}",
                      colors: Colors.black,
                      fontsize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: isSigneIn
                    ? () {
                        _saveData(context);
                      }
                    : () {
                        _showDialog(context);
                      },
                child: Container(
                  width: 100,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black),
                  child: Center(
                    child: CustomText(
                        text: isSigneIn ? "Sign-Out" : "Sign-In",
                        colors: Colors.white,
                        fontsize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter your Age and Gender'),
          content: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Age'),
                  onChanged: (value) {
                    _age = value;
                  },
                ),
                const SizedBox(height: 5),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Gender'),
                  onChanged: (value) {
                    _gender = value;
                  },
                ),
                TextButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    _saveData(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

//! Fuction for saving the user data #Sign-IN
  void _saveData(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('name', widget.textName);
    prefs.setString('id', widget.textId);
    prefs.setString('age', _age);
    prefs.setString('gender', _gender);
    isSigneIn = true;
    setState(() {});
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserProfileScreen(
          name: prefs.getString('name') ?? "",
          id: prefs.getString('id') ?? "",
          age: prefs.getString('age') ?? "",
          gender: prefs.getString('gender') ?? "",
          signOut: signOut,
        ),
      ),
    );
  }

//! Fuction for deleting the user data #Sign-Out
  void signOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('name');
    prefs.remove('id');
    prefs.remove('age');
    prefs.remove('gender');
    isSigneIn = false;
    setState(() {});
  }
}
