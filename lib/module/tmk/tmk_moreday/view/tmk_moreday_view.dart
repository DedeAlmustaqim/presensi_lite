import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../controller/tmk_moreday_controller.dart';

class TmkMoredayView extends StatefulWidget {
  const TmkMoredayView({Key? key}) : super(key: key);

  Widget build(context, TmkMoredayController controller) {
    controller.view = this;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.info,
                  size: 24.0,
                ),
                title: Text(
                  "Ajukan TMK",
                  style: TextStyle(fontSize: 12),
                ),
                subtitle: Text(
                  "Ajukan tidak masuk kerja lebih dari 1 hari",
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
                margin: const EdgeInsets.all(5.0),
                child: FormBuilder(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      QDropdownField(
                        label: "Jenis TMK",
                        validator: Validator.required,
                        items: [
                          {
                            "label": "Tugas Dinas",
                            "value": "1",
                          },
                          {
                            "label": "Alasan tertentu",
                            "value": "2",
                          },
                          {
                            "label": "Cuti",
                            "value": "2",
                          },
                          {
                            "label": "Izin Belajar",
                            "value": "2",
                          }
                        ],
                        value: "-",
                        onChanged: (value, label) {},
                      ),
                      QTextField(
                        maxLine: 5,
                        label: "Keterangan",
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
                      Row(
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
                )),
          ],
        ),
      ),
    );
  }

  @override
  State<TmkMoredayView> createState() => TmkMoredayController();
}
