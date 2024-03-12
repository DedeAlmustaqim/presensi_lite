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
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      QDatePicker(
                        label: "Dari",
                        validator: Validator.required,
                        onChanged: (value) {
                          controller.dateCutiFrom = value;
                        },
                      ),
                      QDatePicker(
                        label: "Sampai",
                        validator: Validator.required,
                        value: null,
                        onChanged: (value) {
                          controller.dateCutiTo = value;
                        },
                      ),
                      QTextField(
                        label: "No Surat",
                        validator: Validator.required,
                        value: "-",
                        onChanged: (value) {
                          controller.noSrt = value;
                        },
                      ),
                      QDropdownField(
                        label: "Jenis Cuti",
                        validator: Validator.required,
                        items: [
                          {
                            "label":
                                "Cuti Besar, Cuti dengan Alasan Penting dan Cuti Bersalin",
                            "value": "7",
                          },
                          {
                            "label":
                                "Cuti Sakit dilampiri Surat Keterangan Dokter",
                            "value": "8",
                          },
                          {
                            "label":
                                "Cuti Tahunan, Cuti bersalin anak ke-3, dst",
                            "value": "9",
                          }
                        ],
                        onChanged: (value, label) {
                          controller.jnsCuti = value;
                        },
                      ),
                      QTextField(
                        maxLine: 5,
                        label: "Keterangan",
                        validator: Validator.required,
                        onChanged: (value) {
                          controller.ketCuti = value;
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
                                          "Cuti",
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
                                                "Dari",
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
                                                    .format(controller
                                                        .dateCutiFrom!)
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
                                                "Sampai",
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
                                                    .format(
                                                        controller.dateCutiTo!)
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
                                              child: controller.noSrt != null
                                                  ? Text(
                                                      controller.noSrt
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 10.0,
                                                      ),
                                                    )
                                                  : Text(
                                                      "-",
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
                                                controller.ketCuti.toString(),
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
                                              OutlinedButton.icon(
                                                icon: Icon(Icons.send),
                                                label: Text("Kirim"),
                                                style: OutlinedButton.styleFrom(
                                                  foregroundColor: primaryColor,
                                                  side: BorderSide(
                                                    color: primaryColor,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  controller.sendCuti();
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
                          const SizedBox(
                            width: 10.0,
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
      ),
    );
  }

  @override
  State<CutiView> createState() => CutiController();
}
