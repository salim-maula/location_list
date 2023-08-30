import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LocationController extends GetxController {
  RxList<Map<String, dynamic>> provinces = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> regencies = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> districts = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> villages = <Map<String, dynamic>>[].obs;

  
  String? selectedProvinceId; // Variabel untuk menyimpan nilai provinsi yang dipilih
  String? selectedRegencyId;
  String? selectedDistrictId;
  String? selectedVillageId;

  @override
  void onInit() {
    super.onInit();
    fetchProvinces();
  }

  Future<void> fetchProvinces() async {
    final response = await http.get(
        Uri.parse('https://emsifa.github.io/api-wilayah-indonesia/api/provinces.json'));

    if (response.statusCode == 200) {
      final List<dynamic> decodedData = json.decode(response.body);
      provinces.value = decodedData.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load provinces');
    }
  }

  Future<void> fetchRegencies(String provinceId) async {
    final response = await http.get(
        Uri.parse('https://emsifa.github.io/api-wilayah-indonesia/api/regencies/$provinceId.json'));

    if (response.statusCode == 200) {
      final List<dynamic> decodedData = json.decode(response.body);
      regencies.value = decodedData.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load regencies');
    }
  }

  Future<void> fetchDistrict(String regencyId) async {
    final response = await http.get(
        Uri.parse('https://emsifa.github.io/api-wilayah-indonesia/api/districts/$regencyId.json'));

    if (response.statusCode == 200) {
      final List<dynamic> decodedData = json.decode(response.body);
      districts.value = decodedData.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load regencies');
    }
  }

  Future<void> fetchVillages(String districtId) async {
    final response = await http.get(
        Uri.parse('https://emsifa.github.io/api-wilayah-indonesia/api/villages/$districtId.json'));

    if (response.statusCode == 200) {
      final List<dynamic> decodedData = json.decode(response.body);
      villages.value = decodedData.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load regencies');
    }
  }
}
