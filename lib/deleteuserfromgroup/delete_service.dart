// ignore_for_file: avoid_print, non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tatbekat/config/header/set_header.dart';
import 'package:tatbekat/constants.dart';
import 'package:tatbekat/models/userwithpivot.dart';
import 'package:tatbekat/utils/server_config.dart';

class AllUsersByService {
  Future<List<UserWith>> getAllusersby(int groupId) async {
    final response = await http.get(
      Uri.parse(ServerConfig.domainNameServer + ServerConfig.getalluserby + groupId.toString()),
    );

    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      return responseData.map((data) => UserWith.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load all users with');
    }
  }

  Future<void> deleteUser(int groupId,int userId, String token) async {
    try {
      final response = await http.post(
          Uri.parse("${ServerConfig.domainNameServer}${ServerConfig.deleteuser}$groupId/delete-user/$userId"),
          headers: setHeaders(useToken: true));

      if (response.statusCode == 200) {
        print('user deleted');
        Get.dialog(
          AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: const BorderSide(color: blueChill, width: 2.0),
            ),
            content: SizedBox(
              height: 90,
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      "User Deleted Success !",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.all(10),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          blueChill,
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      child: const Text(
                        "OK",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      } else {
        print('Failed to delete user. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error deleting user: $error');
    }
  }
}
