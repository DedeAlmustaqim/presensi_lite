import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import 'package:tap_debouncer/tap_debouncer.dart';

class TugasDinasView extends StatefulWidget {
  const TugasDinasView({Key? key}) : super(key: key);

  Widget build(context, TugasDinasController controller) {
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
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    QDatePicker(
                      label: "Tanggal",
                      validator: Validator.required,
                      value: controller.dateTugas,
                      onChanged: (value) {
                        controller.dateTugas = value;
                      },
                    ),
                    QTextField(
                      label: "No Surat (Optional)",
                      // validator: Validator.required,
                      value: "-",
                      onChanged: (value) {
                        controller.noSrt = value;
                      },
                    ),
                    QTextField(
                      maxLine: 5,
                      label: "Keterangan",
                      validator: Validator.required,
                      value: controller.ketTugas,
                      onChanged: (value) {
                        controller.ketTugas = value;
                      },
                    ),
                    QRadioField(
                      label: "Tugas Dinas pada :",
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
                          "value": 3,
                        }
                      ],
                      onChanged: (value, label) {
                        controller.partDay = value;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          icon: Icon(
                            Icons.data_saver_on_outlined,
                            size: 16,
                            color: Colors.white,
                          ),
                          label: Text(
                            "Proses",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: primaryColor,
                            backgroundColor: primaryColor,
                            side: BorderSide(
                              color: primaryColor,
                            ),
                          ),
                          onPressed: () {
                            controller.confirmData();
                            showCustomDialog(title: "Konfirmasi", children: [
                              Column(
                                children: [
                                  Card(
                                    child: ListTile(
                                      subtitle: Text(
                                        "Mohon periksa kembali data yang akan anda kirimkan",
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Divider(),
                                  Column(
                                    children: [
                                      Text(
                                        "Tugas Dinas",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "Diajukan pada",
                                              style: TextStyle(
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            ":  ",
                                            style: TextStyle(
                                              fontSize: 10.0,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              DateFormat.yMMMMEEEEd('id_ID')
                                                  .format(controller.dateTugas!)
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "Nomor Surat",
                                              style: TextStyle(
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            ":  ",
                                            style: TextStyle(
                                              fontSize: 10.0,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              controller.noSrt.toString(),
                                              style: TextStyle(
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "Keterangan",
                                              style: TextStyle(
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            ":  ",
                                            style: TextStyle(
                                              fontSize: 10.0,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              controller.ketTugas.toString(),
                                              style: TextStyle(
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "Tugas Dinas pada",
                                              style: TextStyle(
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            ":  ",
                                            style: TextStyle(
                                              fontSize: 10.0,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              controller
                                                  .partDayToString(
                                                      controller.partDay!)
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Divider(),
                                      SizedBox(
                                        height: 100.0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            TapDebouncer(
                                              onTap: () =>
                                                  controller.sendTugasData(),
                                              builder: (BuildContext context,
                                                  TapDebouncerFunc? onTap) {
                                                return OutlinedButton.icon(
                                                  icon: Icon(Icons.send),
                                                  label: Text("Kirim"),
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    foregroundColor:
                                                        primaryColor,
                                                    side: BorderSide(
                                                      color: primaryColor,
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    controller.sendTugasData();
                                                  },
                                                );
                                              },
                                            ),
                                            OutlinedButton.icon(
                                              icon: Icon(Icons.exit_to_app),
                                              label: Text("Batal"),
                                              style: OutlinedButton.styleFrom(
                                                foregroundColor: orangeColor,
                                                side: BorderSide(
                                                  color: orangeColor,
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ]);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  State<TugasDinasView> createState() => TugasDinasController();
}
