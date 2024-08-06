// ignore_for_file: avoid_print, list_remove_unrelated_type, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tatbekat/addusertogroup/add_controller.dart';
import 'package:tatbekat/addusertogroup/add_view.dart';
import 'package:tatbekat/allgroups/allgroups_controller.dart';
import 'package:tatbekat/components/custom_text_field.dart';
import 'package:tatbekat/constants.dart';
import 'package:tatbekat/deleteuserfromgroup/delete_controller.dart';
import 'package:tatbekat/deleteuserfromgroup/delete_view.dart';
import 'package:tatbekat/models/group.dart';
import 'package:tatbekat/report/report_view.dart';

class AllGroups extends StatefulWidget {
  const AllGroups({Key? key}) : super(key: key);

  @override
  State<AllGroups> createState() => _AllGroupsState();
}

class _AllGroupsState extends State<AllGroups> {
  final allgroupsController = Get.put(AllGroupsController());
  final AllUsersController allUserController = Get.put(AllUsersController());
  final AllUsersByController allUserByController =
      Get.put(AllUsersByController());

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  Future<void> fetchOrders() async {
    allgroupsController.fetchAllGroups();
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
            if (allgroupsController.allgroups.isEmpty) {
              return const Center(
                  child: Text("There are no groups to display"));
            } else {
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "All Groups ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: greyshade200,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Get.to(const Reportt());
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.report),
                                      Text("Generate Report"),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          primary: false,
                          itemCount: allgroupsController.allgroups.length,
                          itemBuilder: (context, index) {
                            final group = allgroupsController.allgroups[index];
                            final groupNumber = index + 1;
                            return groupItem(group, groupNumber);
                          },
                        ),
                        const SizedBox(
                          height: 70,
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Center(child: Text("Add Group")),
                content: CustomTextField(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    keyBoared: TextInputType.text,
                    lableText: "group name",
                    onChange: (value) {
                      allgroupsController.group_name = value;
                    },
                    icon: const Icon(Icons.drive_file_rename_outline_sharp)),
                actions: <Widget>[
                  TextButton(
                    child: const Text("Cancel"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  ElevatedButton(
                    child: const Text("Add"),
                    onPressed: () async {
                      await allgroupsController.addGroupOnClick();
                      allgroupsController.fetchAllGroups();
                      Navigator.pop(context);
                      print("add group");
                    },
                  ),
                ],
              );
            },
          );
        },
        label: const Text(
          'Add Group',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: const Icon(Icons.add),
        backgroundColor: blueChill,
      ),
    );
  }

  Widget groupItem(Group group, int groupNumber) => GestureDetector(
        // onTap: () async {
        //   var groupId = group.id;
        //   await orderdetailsController.fetchOrderDetails(groupId);
        //   Get.to(OrderDetails());
        // },
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
              const Column(
                children: [
                  Icon(Icons.group),
                ],
              ),
              // const SizedBox(
              //   width: 70,
              // ),
              SizedBox(
                // width: 700,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Group Number : ",
                          style: TextStyle(
                              // fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          "$groupNumber",
                          style: const TextStyle(
                              // fontSize: 16,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Group Name : ",
                          style: TextStyle(
                              // fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          group.group_name,
                          style: const TextStyle(
                              // fontSize: 16,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Created at : ",
                          style: TextStyle(
                              // fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          group.created_at,
                          style: const TextStyle(
                              // fontSize: 16,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ElevatedButton.icon(
                icon: const Icon(
                  Icons.delete_outline,
                  color: Colors.green,
                  // size: 30.0,
                ),
                label: const Text('Delete Group'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Delete Group'),
                        content: const Text(
                            'Are you sure you want to delete the group?'),
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
                              allgroupsController.deleteGroup(group.id, token!);
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
              // const SizedBox(
              //   width: 20,
              // ),
              ElevatedButton.icon(
                icon: const Icon(
                  Icons.person_add_alt_sharp,
                  color: Colors.green,
                  // size: 30.0,
                ),
                label: const Text('Add User'),
                onPressed: () async {
                  var groupId = group.id;
                  await allUserController.fetchAllUsers();
                  Get.to(AllUser(
                    groupId: groupId,
                  ));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              // const SizedBox(
              //   width: 20,
              // ),
              ElevatedButton.icon(
                icon: const Icon(
                  Icons.groups_2,
                  color: Colors.green,
                  // size: 30.0,
                ),
                label: const Text('Users In Group'),
                onPressed: () async {
                  var groupId = group.id;
                  await allUserByController.fetchAllUsersBy(groupId);
                  Get.to(AllUsersBy(
                    groupId: groupId,
                  ));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
