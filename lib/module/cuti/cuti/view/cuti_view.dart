import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';

class CutiView extends StatefulWidget {
  const CutiView({Key? key}) : super(key: key);

  Widget build(context, CutiController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cuti"),
        actions: const [],
      ),
      body: SafeArea(
        child: Container(
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
                    "Cuti",
                    style: TextStyle(fontSize: 12),
                  ),
                  subtitle: Text(
                    "Ajukan Cuti pada tanggal yang ditentukan",
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
                    QTextField(
                      label: "No Surat",
                      validator: Validator.required,
                      value: null,
                      onChanged: (value) {},
                    ),
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
                      label: "Jenis Cuti",
                      validator: Validator.required,
                      items: [
                        {
                          "label":
                              "Cuti Besar, Cuti dengan Alasan Penting dan Cuti Bersalin",
                          "value": "1",
                        },
                        {
                          "label":
                              "Cuti Sakit dilampiri Surat Keterangan Dokter",
                          "value": "2",
                        },
                        {
                          "label": "Cuti Tahunan, Cuti bersalin anak ke-3, dst",
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
        ),
      ),
    );
  }

  @override
  State<CutiView> createState() => CutiController();
}
