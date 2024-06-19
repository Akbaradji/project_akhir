import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_akhir/controller/kendaraan_controller.dart';
import 'package:project_akhir/model/kendaraan.dart';
import 'package:project_akhir/screen/maps_screen.dart';
import 'package:project_akhir/screen/screen_pertama.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  File? _image;
  final _imagePicker = ImagePicker();
  String? _alamat;

  final _formKey = GlobalKey<FormState>();
  final _namaKendaraanController = TextEditingController();
  final _noTeleponController = TextEditingController();
  final _alamatController = TextEditingController();

  final KendaraanController _kendaraanController = KendaraanController();

  Future<void> getImage() async {
    final XFile? pickerFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    setState(
      () {
        if (pickerFile != null) {
          _image = File(pickerFile.path);
        } else {
          print('No image selected');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Kendaraan'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _namaKendaraanController,
                decoration: const InputDecoration(labelText: 'Nama Kendaraan'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama kendaraan tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _noTeleponController,
                decoration: const InputDecoration(labelText: 'No Telepon'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'No telepon tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _alamatController,
                decoration: const InputDecoration(labelText: 'Alamat'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Alamat tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: getImage,
                child: const Text('Upload Image'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    final kendaraan = Kendaraan(
                      namaKendaraan: _namaKendaraanController.text,
                      noTelepon: _noTeleponController.text,
                      alamat: _alamatController.text,
                      gambar: _image?.path ?? '',
                    );

                    _kendaraanController
                        .addKendaraan(kendaraan, _image)
                        .then((result) {
                      if (result['success']) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(result['message'])));
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PertamaScreen()),
                          (route) => false,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(result['message'])));
                      }
                    });
                  }
                },
                child: const Text('Simpan'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MapsScreen(),
                    ),
                  );

                  if (result != null && result is LatLng) {
                    setState(() {
                      _alamatController.text =
                          '${result.latitude}, ${result.longitude}';
                    });
                  }
                },
                child: const Text('Pilih Lokasi di Peta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
