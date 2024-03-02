import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import '../controller/tugas_dinas_controller.dart';

class TugasDinasView extends StatefulWidget {
  const TugasDinasView({Key? key}) : super(key: key);

  Widget build(context, TugasDinasController controller) {
    controller.view = this;
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: ListTile(
              leading: Icon(
                Icons.info,
                size: 24.0,
              ),
              title: Text(
                "Tugas Dinas",
                style: TextStyle(fontSize: 12),
              ),
              subtitle: Text(
                "Ajukan Tugas Dinas pada jam Check In/Out dengan tanggal yang ditentukan",
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            child: Column(
              children: [
                QDatePicker(
                  label: "Tanggal",
                  validator: Validator.required,
                  value: null,
                  onChanged: (value) {
                    print("value: $value");
                  },
                ),
                QTextField(
                  maxLine: 5,
                  label: "Keterangan",
                  validator: Validator.required,
                  value: null,
                  onChanged: (value) {},
                ),
                QRadioField(
                  label: "Dinas pada :",
                  validator: Validator.atLeastOneitem,
                  items: [
                    {
                      "label": "Check IN",
                      "value": 1,
                    },
                    {
                      "label": "Check Out",
                      "value": 2,
                    },
                    {
                      "label": "Full Time",
                      "value": 2,
                    }
                  ],
                  onChanged: (value, label) {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton.icon(
                      icon: Icon(Icons.send),
                      label: Text("Kirim"),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: primaryColor,
                        side: BorderSide(
                          color: primaryColor,
                        ),
                      ),
                      onPressed: () {},
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    OutlinedButton.icon(
                      icon: Icon(Icons.refresh),
                      label: Text("Reset"),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: dangerColor,
                        side: BorderSide(
                          color: dangerColor,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  State<TugasDinasView> createState() => TugasDinasController();
}
