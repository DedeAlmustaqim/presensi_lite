import 'dart:io';

import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';

class ProfileController extends State<ProfileView> {
  static late ProfileController instance;
  late ProfileView view;
  bool isDetail = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? newPass;
  String? confirmPass;

  final picker = ImagePicker();
  File? imageFile;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  showDetail() async {
    setState(() {
      isDetail = !isDetail;
    });
  }

  delImagePick() async {
    setState(() {
      imageFile = null;
    });
  }

  Future<void> getImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 40, // Sesuaikan nilai kualitas sesuai kebutuhan Anda
    );

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> uploadPhoto() async {
    if (imageFile != null) {
      try {
        showLoading();

        // Kompresi gambar sebelum di-upload

        // Panggil fungsi uploadPhoto yang sudah dibuat sebelumnya
        try {
          String apiUrl =
              '${AppConfig.baseUrl}/api/user/upload_photo'; // Ganti dengan URL endpoint Anda
          String fileName = imageFile!.path.split('/').last;

          FormData formData = FormData.fromMap({
            'image': await MultipartFile.fromFile(
              imageFile!.path,
              filename: fileName,
            ),
            'id':
                '${AuthService.id}', // Ganti dengan nilai sesuai kebutuhan Anda
          });

          await Dio().post(
            apiUrl,
            data: formData,
            options: Options(
              headers: {
                "Content-Type": "application/json",
                "Authorization": "Bearer ${AuthService.token}",
              },
            ),
          );
          hideLoading();
          UserDataService.getUser();
          setState(() {
            imageFile = null;
          });

          // Handle response sesuai kebutuhan Anda
          // Misalnya, tampilkan pesan sukses atau error
        } catch (error) {
          // Handle error sesuai kebutuhan Anda
        }

        hideLoading();
      } catch (error) {
        hideLoading();

        // Handle error sesuai kebutuhan Anda
      }
    } else {
      // Tampilkan pesan bahwa foto belum dipilih
    }
  }

  update_pass() async {
    if (formKey.currentState?.validate() ?? false) {
      showLoading();
      try {
        hideLoading();
        var success =
            await UserDataService().changePass(newPass!, confirmPass!);

        if (success) {
          showInfoDialog(message: "Berhasil ubah Password", title: '');
        } else {
          showInfoDialog(message: "Gagal ubah Password", title: '');
        }
      } on Exception {
        hideLoading();
      }
    }
  }
}
