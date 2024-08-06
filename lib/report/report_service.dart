// ignore_for_file: avoid_print, non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tatbekat/models/report.dart';
import 'package:tatbekat/utils/server_config.dart';

class ReportService {
  Future<List<Report>> getReport() async {
    final response = await http.get(
      Uri.parse(ServerConfig.domainNameServer + ServerConfig.report),
    );

    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      return responseData.map((data) => Report.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load report');
    }
  }
}
