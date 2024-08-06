// ignore_for_file: avoid_print, list_remove_unrelated_type, use_build_context_synchronously, recursive_getters

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tatbekat/constants.dart';
import 'package:tatbekat/deleteuserfromgroup/delete_controller.dart';
import 'package:tatbekat/models/userwithpivot.dart';

class AllUsersBy extends StatefulWidget {
  final int groupId;
  const AllUsersBy({Key? key, required this.groupId}) : super(key: key);

  @override
  State<AllUsersBy> createState() => _AllUsersByState();
}

class _AllUsersByState extends State<AllUsersBy> {
  final allusersbyController = Get.put(AllUsersByController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bac.webp'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Obx(() {
            if (allusersbyController.allusersby.isEmpty) {
              return const Center(
                  child: Text("There are no users in this group "));
            } else {
              return SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      children: [
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          primary: false,
                          itemCount: allusersbyController.allusersby.length,
                          itemBuilder: (context, index) {
                            final user = allusersbyController.allusersby[index];
                            final userNumber = index + 1;
                            return userItem(user, userNumber);
                          },
                        ),
                        const SizedBox(
                          height: 25,
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
          }),
        ],
      ),
    );
  }

  Widget userItem(UserWith user, int userNumber) => GestureDetector(
        child: Container(
          //width: 300,
          height: 80,
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: panache,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: greyshade200,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // const SizedBox(
              //   width: 70,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                      Icon(Icons.person),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            user.name,
                            style: const TextStyle(
                              //fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            user.email,
                            style: const TextStyle(
                                //fontSize: 16,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              // const SizedBox(
              //   width: 10,
              // ),
              ElevatedButton.icon(
                icon: const Icon(
                  Icons.person_remove_alt_1,
                  color: Colors.green,
                  size: 30.0,
                ),
                label: const Text('Delete From Group'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Delete User'),
                        content: const Text(
                            'Are you sure you want to delete this user ?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancle'),
                          ),
                          TextButton(
                            onPressed: () async {
                              final prefs =
                                  await SharedPreferences.getInstance();
                              final token = prefs.getString("token");
                              allusersbyController.deleteUser(
                                  user.pivot.groupId, user.id, token!);
                              Navigator.of(context).pop();
                            },
                            child: const Text('Yes'),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
