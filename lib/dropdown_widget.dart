import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_cordinate/location_controller.dart';

class DropdownWidget extends StatefulWidget {
  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  // final locationController locationController = Get.find();

  final locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => DropdownButton<String>(
            hint: Text('Pilih Provinsi'),
            value: locationController.selectedProvinceId,
            items: locationController.provinces.map<DropdownMenuItem<String>>(
              (Map<String, dynamic> province) {
                return DropdownMenuItem<String>(
                  value: province['id'],
                  child: Text(province['name']),
                );
              },
            ).toList(),
            onChanged: (value) {
              setState(() {
                locationController.selectedRegencyId = null;
                locationController.selectedDistrictId = null;
                locationController.selectedVillageId = null;
                locationController.selectedProvinceId = value;
              });

              // Ambil data kabupaten/kota berdasarkan provinsi yang dipilih
              locationController.fetchRegencies(value!);
            },
          ),
        ),
        SizedBox(height: 16.0), // Beri jarak antara dropdown pertama dan kedua
        Obx(
          () => DropdownButton<String>(
            hint: Text('Pilih Kabupaten/Kota'),
            value: locationController.selectedRegencyId,
            items: locationController.regencies.map<DropdownMenuItem<String>>(
              (Map<String, dynamic> regency) {
                return DropdownMenuItem<String>(
                  value: regency['id'],
                  child: Text(regency['name']),
                );
              },
            ).toList(),
            onChanged: (value) {
              setState(() {
                locationController.selectedDistrictId = null;
                locationController.selectedVillageId = null;
                locationController.selectedRegencyId = value!;
              });

              // Lakukan sesuatu dengan nilai yang dipilih (id)
              locationController.fetchDistrict(value!);
            },
          ),
        ),
        SizedBox(height: 16.0), // Beri jarak antara dropdown pertama dan kedua
        Obx(
          () => DropdownButton<String>(
            hint: Text('Pilih Kab/Kota'),
            value: locationController.selectedDistrictId,
            items: locationController.districts.map<DropdownMenuItem<String>>(
              (Map<String, dynamic> district) {
                return DropdownMenuItem<String>(
                  value: district['id'],
                  child: Text(district['name']),
                );
              },
            ).toList(),
            onChanged: (value) {
              setState(() {
                locationController.selectedVillageId = null;
                locationController.selectedDistrictId = value!;
              });

              // Lakukan sesuatu dengan nilai yang dipilih (id)
              locationController.fetchVillages(value!);
            },
          ),
        ),
        SizedBox(height: 16.0), // Beri jarak antara dropdown pertama dan kedua
        Obx(
          () => DropdownButton<String>(
            hint: Text('Pilih Kecamatan'),
            value: locationController.selectedVillageId,
            items: locationController.villages.map<DropdownMenuItem<String>>(
              (Map<String, dynamic> village) {
                return DropdownMenuItem<String>(
                  value: village['id'],
                  child: Text(village['name']),
                );
              },
            ).toList(),
            onChanged: (value) {
              setState(() {
                locationController.selectedVillageId = value!;
              });

              // Lakukan sesuatu dengan nilai yang dipilih (id)
            },
          ),
        ),
      ],
    );
  }
}
