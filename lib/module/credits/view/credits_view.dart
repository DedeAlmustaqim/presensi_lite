import 'package:flutter/material.dart';
import 'package:atei_bartim/core.dart';
import '../controller/credits_controller.dart';

class CreditsView extends StatefulWidget {
  CreditsView({Key? key}) : super(key: key);

  Widget build(context, CreditsController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: Text("Tim Pengembang"),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 10.0,
                      ),
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            8.0,
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "FREDISEN MADIANU, S.Kom",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "Kepala Bidang PENYELENGGARAAN E-GOVERNMENT",
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "NIP. 198607272011011016",
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Wrap(
                                children: [
                                  Text(
                                    "Project Manager,",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    "QA Engineer,",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    "Test Engineer,",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 10.0,
                      ),
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            8.0,
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "FRISCIA ANTHONY, S.T",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "Pranata Komputer Ahli Muda",
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "NIP. 198303172011011009",
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: [
                                    Text(
                                      "QA Engineer,",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    Text(
                                      "Test Engineer,",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    Text(
                                      "DevOps Engineer,",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    Text(
                                      "System Administrator,",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    Text(
                                      "Database Administrator,",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    Text(
                                      "Business Analyst,",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    Text(
                                      "Security ,",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    Text(
                                      "Technical Support",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 10.0,
                      ),
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            8.0,
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "DEDE ALMUSTAQIM, S.Kom",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "Pranata Komputer Ahli Pertama",
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "NIP. 198908252024211014",
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: [
                                    Text(
                                      "UI/UX Designer,",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    Text(
                                      "Frontend Developer,",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    Text(
                                      "Backend Developer,",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    Text(
                                      "Mobile Developer,",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    Text(
                                      "DevOps Engineer,",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    Text(
                                      "Data Scientist / Data Analyst,",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    Text(
                                      "Database Designer/Data Architect ,",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 10.0,
                      ),
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            8.0,
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Terima Kasih Khusus",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "HUSAINI, SE",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "NIP. 199701212022021001",
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: [
                                    Text(
                                      "ATEI Logo Desainer,",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<CreditsView> createState() => CreditsController();
}
