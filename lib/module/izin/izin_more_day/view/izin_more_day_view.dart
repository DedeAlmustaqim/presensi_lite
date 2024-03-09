import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';

class IzinMoreDayView extends StatefulWidget {
  const IzinMoreDayView({Key? key}) : super(key: key);

  Widget build(context, IzinMoreDayController controller) {
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
                "Izin Lebih dari Satu Hari",
                style: TextStyle(fontSize: 12),
              ),
              subtitle: Text(
                "AjukanIzin Lebih dari Satu Hari pada tanggal yang ditentukan",
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
                  label: "Dari",
                  validator: Validator.required,
                  value: null,
                  onChanged: (value) {
                    print("value: $value");
                  },
                ),
                QDatePicker(
                  label: "Sampai",
                  validator: Validator.required,
                  value: null,
                  onChanged: (value) {
                    print("value: $value");
                  },
                ),
                QDropdownField(
                  label: "Jenis Izin",
                  validator: Validator.required,
                  items: [
                    {
                      "label": "Izin Alasan Tertentu",
                      "value": "1",
                    },
                    {
                      "label": "Sakit",
                      "value": "2",
                    }
                  ],
                  onChanged: (value, label) {},
                ),
                QTextField(
                  maxLine: 5,
                  label: "Keterangan",
                  validator: Validator.required,
                  value: null,
                  onChanged: (value) {},
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
  State<IzinMoreDayView> createState() => IzinMoreDayController();
}
