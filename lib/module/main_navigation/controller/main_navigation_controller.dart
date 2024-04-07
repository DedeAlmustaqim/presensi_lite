import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';

class MainNavigationController extends State<MainNavigationView> {
  static late MainNavigationController instance;
  late MainNavigationView view;

  @override
  initState() {
    // UserDataService.init();
    isUpdate();

    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  bool? privacy;

  int selectedIndex = 0;
  updateIndex(int newIndex) {
    selectedIndex = newIndex;
    setState(() {});
  }

  isPrivacy() async {
    var isAgree = await UserDataService().getIsAgree();
    print(isAgree);
    if (isAgree == "false") {
      await showPrivacyDialog(context: context, message: "", title: "");
    } else {
      return;
    }
  }

  isUpdate() async {
    var appVersion = AppConfig.version;
    var isUpdate = await VersiService().getVersion();
    if (appVersion!.compareTo(isUpdate!) > 0) {
      //Versi Atei lebih besar dari server
      await isPrivacy();
    } else if (appVersion.compareTo(isUpdate) < 0) {
      //Versi Atei lebih kecil dari server
      Get.offAll(VersionView());
    } else {
      //Versi Atei sama dari server
      await isPrivacy();
    }

    // if (double.parse(AppConfig.version!) < isUpdate!) {
    //   await showPrivacyDialog(context: context, message: "", title: "");
    // } else {
    //   isPrivacy();
    // }
  }
}
