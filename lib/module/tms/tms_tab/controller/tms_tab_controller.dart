
import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import '../view/tms_tab_view.dart';

class TmsTabController extends State<TmsTabView> {
    static late TmsTabController instance;
    late TmsTabView view;

    @override
    void initState() {
        instance = this;
        super.initState();
    }

    @override
    void dispose() => super.dispose();

    @override
    Widget build(BuildContext context) => widget.build(context, this);
}
        
    