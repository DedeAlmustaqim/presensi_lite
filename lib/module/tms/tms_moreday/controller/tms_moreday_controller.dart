
import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import '../view/tms_moreday_view.dart';

class TmsMoredayController extends State<TmsMoredayView> {
    static late TmsMoredayController instance;
    late TmsMoredayView view;

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
        
    