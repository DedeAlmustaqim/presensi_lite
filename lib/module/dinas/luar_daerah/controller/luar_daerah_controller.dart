
import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import '../view/luar_daerah_view.dart';

class LuarDaerahController extends State<LuarDaerahView> {
    static late LuarDaerahController instance;
    late LuarDaerahView view;

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
        
    