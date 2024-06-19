import 'dart:convert';
import 'dart:io';

import 'package:project_akhir/model/kendaraan.dart';
import 'package:project_akhir/service/kendaraan_service.dart';

class KendaraanController {
  final kendaraanService = KendaraanService();

  Future<Map<String, dynamic>> addKendaraan(Kendaraan kendaraan, File? file) async {
    Map<String, String> data = {
      'nama': kendaraan.namaKendaraan,
      'notelepon': kendaraan.noTelepon,
      'alamat': kendaraan.alamat,
    };

    try {
      var response = await kendaraanService.addKendaraan(data, file);
      if (response.statusCode == 201) {
        return {
          'success': true,
          'message': 'Data berhasil disimpan',
        };
      } else {
        if (response.headers['content-type']!.contains('application/json')) {
          var decodedJson = jsonDecode(response.body);
          return {
            'success': false,
            'message': decodedJson['message'] ?? 'Terjadi kesalahan',
          };
        }
        var decodedJson = jsonDecode(response.body);
        return {
          'success': false,
          'message': decodedJson['message'] ?? 'Terjadi kesalahan saat menyimpan data',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Terjadi kesalahan: $e',
      };
    }
  }

  Future<List<Kendaraan>> getKendaraan() async {
    try {
      List<dynamic> kendaraanData = await kendaraanService.fetchKendaraan();
      if (kendaraanData != null) {
        List<Kendaraan> kendaraan = kendaraanData.map((json) => Kendaraan.fromMap(json)).toList();
        return kendaraan;
      } else {
        return [];
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to get kendaraan: $e');
    }
  }
}