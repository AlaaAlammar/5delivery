// ignore_for_file: avoid_print, list_remove_unrelated_type, use_build_context_synchronously, recursive_getters

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tatbekat/addusertogroup/add_controller.dart';
import 'package:tatbekat/constants.dart';
import 'package:tatbekat/deleteuserfromgroup/delete_controller.dart';
import 'package:tatbekat/models/allusers.dart';

class AllUser extends StatefulWidget {
  final int groupId;
  const AllUser({Key? key, required this.groupId}) : super(key: key);

  @override
  State<AllUser> createState() => _AllUserState();
}

class _AllUserState extends State<AllUser> {
  final allusersController = Get.put(AllUsersController());
  final allusersbyController = Get.put(AllUsersByController());

  late int groupId;

  @override
  void initState() {
    super.initState();
    groupId = widget.groupId;
    fetchAllUsersBy();
  }

  Future<void> fetchAllUsersBy() async {
    allusersbyController.fetchAllUsersBy(groupId);
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
            if (allusersController.allusers.isEmpty) {
              return const Center(child: Text("There are no users"));
            } else {
              final differentUsers = allusersController.allusers
                  .where((user) => !allusersbyController.allusersby
                      .any((userBy) => userBy.id == user.id))
                  .toList();

              return SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: const Text(
                            "All Users",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: greyshade200,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                    
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          primary: false,
                          itemCount: differentUsers.length,
                          itemBuilder: (context, index) {
                            final user = differentUsers[index];
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

  Widget userItem(AllUsers user, int userNumber) => GestureDetector(
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
                      ),
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
                              // fontSize: 16,
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
                                // fontSize: 16,
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
                  Icons.person_add_alt_1,
                  color: Colors.green,
                  // size: 30.0,
                ),
                label: const Text('Add To Group'),
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  final token = prefs.getString("token");
                  allusersController.AddUser(groupId, user.id, token!);
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
