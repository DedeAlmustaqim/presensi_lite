import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ProfileView extends StatefulWidget {
  ProfileView({Key? key}) : super(key: key);

  Widget build(context, ProfileController controller) {
    controller.view = this;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 30.0, bottom: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                image: DecorationImage(
                  image: AssetImage("assets/icon/header.png"),
                  fit: BoxFit.cover,
                ),
              ),
              // Tampilkan ini bila controller.imageFile == null
              child: Center(
                child: Column(
                  children: [
                    if (controller.imageFile != null)
                      CircleAvatar(
                        radius: 75,
                        backgroundImage: FileImage(controller.imageFile!),
                      ),
                    if (controller.imageFile == null)
                      // UserDataService.userData!.img.toString()
                      CircleAvatar(
                        radius: 75.0,
                        backgroundImage: CachedNetworkImageProvider(
                            UserDataService.userData!.img.toString()),
                        child: Column(
                          children: [
                            Spacer(),
                            InkWell(
                              onTap: () {
                                controller.getImage();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(6.0),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Text(
                                  "Ganti Foto",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (controller.imageFile != null)
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors
                                    .blue // Warna latar belakang sesuai kebutuhan Anda
                                ),
                            onPressed: () {
                              controller.uploadPhoto();
                            },
                            child: Text(
                              'Simpan',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        if (controller.imageFile != null)
                          ElevatedButton(
                            onPressed: () {
                              controller.delImagePick();
                            },
                            child: Text('Batal'),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListTile(
                    leading: Icon(Icons.person),
                    minLeadingWidth: 0.0,
                    trailing: ZoomTapAnimation(
                      onTap: () {
                        controller.showDetail();
                      },
                      child: Icon(
                        controller.isDetail
                            ? MdiIcons.chevronUp
                            : MdiIcons.chevronDown,
                        size: 24.0,
                      ),
                    ),
                    title: Text(
                      UserDataService.userData!.name.toString(),
                      style: TextStyle(color: textColor1),
                    ),
                  ),
                  Divider(),
                  if (controller.isDetail)
                    Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 80.0,
                                  child: Text(
                                    "Unit Kerja",
                                    style: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                  ),
                                ),
                                Text(
                                  ":",
                                  style: TextStyle(
                                    fontSize: 10.0,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: Container(
                                    child: Text(
                                      UserDataService.userData!.nmUnit
                                          .toString(),
                                      softWrap: true,
                                      style: TextStyle(
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 80.0,
                                  child: Text(
                                    "NIP",
                                    style: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                  ),
                                ),
                                Text(
                                  ":",
                                  style: TextStyle(
                                    fontSize: 10.0,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: Container(
                                    child: Text(
                                      UserDataService.userData!.nip.toString(),
                                      softWrap: true,
                                      style: TextStyle(
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 80.0,
                                  child: Text(
                                    "Jabatan",
                                    style: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                  ),
                                ),
                                Text(
                                  ":",
                                  style: TextStyle(
                                    fontSize: 10.0,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: Container(
                                    child: Text(
                                      UserDataService.userData!.jabatan
                                          .toString(),
                                      softWrap: true,
                                      style: TextStyle(
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ListTile(
                    leading: Icon(Icons.email),
                    minLeadingWidth: 0.0,
                    title: Text(
                      UserDataService.userData!.email.toString(),
                      style: TextStyle(color: textColor1),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            child: Center(
                              child: Container(
                                padding: EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Form(
                                  key: controller.formKey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Ubah Password",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 10.0),
                                      QTextFieldPass(
                                        label: "Password Baru",
                                        helper: "Minimal 8 Karakter",
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Password baru tidak boleh kosong';
                                          }
                                          if (value.length < 8) {
                                            return 'Password baru harus memiliki minimal 8 karakter';
                                          }
                                          return null;
                                        },
                                        value: null,
                                        onChanged: (value) {
                                          controller.newPass = value;
                                        },
                                      ),
                                      QTextFieldPass(
                                        label: "Konfirmasi Password",
                                        helper:
                                            "Harus sama dengan Kolom Password",
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Konfirmasi password tidak boleh kosong';
                                          }
                                          if (value != controller.newPass) {
                                            return 'Konfirmasi password harus sama dengan password baru';
                                          }
                                          return null;
                                        },
                                        value: null,
                                        onChanged: (value) {
                                          controller.confirmPass = value;
                                        },
                                      ),
                                      SizedBox(height: 20.0),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: dangerColor,
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "Batal",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10.0),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: primaryColor,
                                            ),
                                            onPressed: () {
                                              controller.update_pass();
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "Simpan",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    leading: Icon(Icons.key),
                    minLeadingWidth: 0.0,
                    title: Text(
                      'Ubah Password',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      UrlLauncher.privacyPolicy();
                    },
                    leading: Icon(Icons.privacy_tip),
                    minLeadingWidth: 0.0,
                    title: Text(
                      'Kebijakan dan Privasi',
                      style: TextStyle(color: textColor1),
                    ),
                  ),
                  Divider(),
                  InkWell(
                    onTap: () {
                      controller.doLogout();
                    },
                    child: ListTile(
                      leading: Icon(Icons.exit_to_app),
                      minLeadingWidth: 0.0,
                      title: Text(
                        'Logout',
                        style: TextStyle(color: textColor1),
                      ),
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<ProfileView> createState() => ProfileController();
}
