import 'package:atei_bartim/shared/util/dialog/show_info_dialog.dart';
import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';

class MainNavigationController extends State<MainNavigationView> {
  static late MainNavigationController instance;
  late MainNavigationView view;

  @override
  initState() {
    // UserDataService.init();
    // isPrivacy();
    instance = this;
    print(privacy);
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
    privacy = await DB.getPrivacy();

    if (privacy == null || !privacy!) {
      showPrivacyDialog(message: "message", title: "", context: context);
    }
  }
}
