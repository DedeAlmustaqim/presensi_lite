import 'package:flutter/material.dart';
import 'package:presensi/core.dart';
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
                gradient: LinearGradient(
                  transform: GradientRotation(1.0),
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    primaryColor,
                    secondaryColor,
                  ],
                ),
              ),
              child: Column(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 60.0,
                      backgroundImage: NetworkImage(
                        UserDataService.userData!.img.toString(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
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
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x19000000),
                            blurRadius: 5,
                            offset: Offset(0, 0),
                          ),
                        ],
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
                          Divider(),
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
                          Divider(),
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
                    leading: Icon(Icons.privacy_tip),
                    minLeadingWidth: 0.0,
                    title: Text(
                      'Kebijakan dan Privasi',
                      style: TextStyle(color: textColor1),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.info),
                    minLeadingWidth: 0.0,
                    title: Text(
                      'Tentang',
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
