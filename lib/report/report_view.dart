// ignore_for_file: avoid_print, list_remove_unrelated_type, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tatbekat/constants.dart';
import 'package:tatbekat/models/report.dart';
import 'package:tatbekat/report/report_controller.dart';

class Reportt extends StatefulWidget {
  const Reportt({Key? key}) : super(key: key);

  @override
  State<Reportt> createState() => _ReporttState();
}

class _ReporttState extends State<Reportt> {
  final reportcontroller = Get.put(ReportController());
  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  Future<void> fetchOrders() async {
    reportcontroller.fetchReport();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/ff.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Obx(() {
            if (reportcontroller.reports.isEmpty) {
              return const Center(
                  child: Text("There are no report to display"));
            } else {
              return SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                    margin: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: const Center(
                            child: Text(
                              "-- File System Report --",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          primary: false,
                          itemCount: reportcontroller.reports.length,
                          itemBuilder: (context, index) {
                            final reportt = reportcontroller.reports[index];
                            final reportNumber = index + 1;
                            return reportItem(reportt, reportNumber);
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

  Widget reportItem(Report report, int reportNumber) => GestureDetector(
        child: Container(
          height: 110,
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
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "the_operation :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        Text(
                          report.theOperation,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Group Name:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        Text(
                          report.groupName,
                          style: const TextStyle(color: Colors.black),
                        ),
                        Row(
                          children: [
                            const Text(
                              " , User Name : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              report.userName,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              " , File Name : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              report.fileName,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Time: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        Text(
                          report.theTime,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Column(
                children: [
                  Icon(Icons.report_gmailerrorred),
                ],
              ),
            ],
          ),
        ),
      );
}
