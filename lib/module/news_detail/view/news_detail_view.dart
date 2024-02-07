import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:presensi/core.dart';

class NewsDetailView extends StatefulWidget {
  final Map item;
  NewsDetailView({Key? key, required this.item}) : super(key: key);

  Widget build(context, NewsDetailController controller) {
    controller.view = this;
    final TextEditingController _textEditingController =
        TextEditingController();
    if (controller.comment == "") {
      _textEditingController.clear(); // Mengosongkan TextFormField
    }
    DateTime postTimeNews = DateTime.parse(item['created_at']);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        item['thumbnail'],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 25,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 24.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 5,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              padding: EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item["title"],
                    style: TextStyle(fontSize: 20.0, color: textColor1),
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    DateFormat('dd MMMM yyyy', 'id').format(postTimeNews),
                    style: TextStyle(
                      fontSize: 10.0,
                    ),
                  ),
                  Divider(),
                  HtmlWidget(
                    item["content"],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 5,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _textEditingController,
                    maxLength: 500,
                    maxLines: 4,
                    decoration: InputDecoration(
                      labelText: "Berikan Komentar",
                    ),
                    onChanged: (value) {
                      if (value.isEmpty) {
                        // Jika nilai berubah menjadi string kosong, atur nilai TextFormField ke kosong juga
                        controller.comment =
                            ""; // Atur nilai controller.comment ke string kosong
                      } else {
                        controller.comment =
                            value; // Atur nilai controller.comment ke nilai yang dimasukkan pengguna
                      }
                    },
                    onFieldSubmitted: (value) {},
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(
                            UserDataService.userData!.img.toString() +
                                '?v=' +
                                DateTime.now()
                                    .millisecondsSinceEpoch
                                    .toString(),
                          ),
                        ),
                      ),
                      Text(
                        UserDataService.userData!.name.toString(),
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      ElevatedButton.icon(
                        icon: Icon(
                          Icons.send,
                          size: 14,
                          color: Colors.white,
                        ),
                        label: Text(
                          "Kirim",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  12), // You can reduce padding if needed
                          textStyle: TextStyle(
                            fontSize:
                                12, // You can reduce the text size if needed
                          ),
                        ),
                        onPressed: () {
                          controller.sendComments();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Builder(builder: (context) {
              return ListView.builder(
                padding: EdgeInsets.only(
                  top: 10.0,
                ),
                itemCount: controller.newsComments.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  var itemComment = controller.newsComments[index];
                  return Container(
                    margin: EdgeInsets.only(
                      left: 10.0,
                      right: 10,
                      bottom: 5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 2,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(15.0),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        SizedBox(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    NetworkImage(itemComment['img']),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          itemComment['name'],
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: textColor1),
                                        ),
                                        Spacer(),
                                        if (itemComment['id_user'] ==
                                            AppConfig.id)
                                          InkWell(
                                            onTap: () async {
                                              await showDialog<void>(
                                                context: context,
                                                barrierDismissible: true,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    backgroundColor:
                                                        Colors.white,
                                                    title: const Text(
                                                      'Konfirmasi',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    content:
                                                        const SingleChildScrollView(
                                                      child: ListBody(
                                                        children: <Widget>[
                                                          Text(
                                                              'Apakah Anda yakin untuk hapus komentar?'),
                                                        ],
                                                      ),
                                                    ),
                                                    actions: <Widget>[
                                                      ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor: Colors
                                                              .white, // Warna latar belakang tombol "No"
                                                        ),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text(
                                                          "No",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black), // Warna teks tombol "No"
                                                        ),
                                                      ),
                                                      ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor: Colors
                                                              .red, // Warna latar belakang tombol "Yes"
                                                        ),
                                                        onPressed: () async {
                                                          await controller.delNews(
                                                              idNews:
                                                                  itemComment[
                                                                      'id']);
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text(
                                                          "Yes",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white), // Warna teks tombol "Yes"
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: Text(
                                              "Hapus Komentar",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10.0,
                                                  color: orangeColor),
                                            ),
                                          ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Divider(),
                                    Text(
                                      itemComment['comment'],
                                      style: TextStyle(
                                        fontSize: 14.0,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          DateFormat('EEEE, dd MMMM yyyy', 'id')
                                              .format(DateTime.parse(
                                                  itemComment['created_at'])),
                                          style: TextStyle(
                                            fontSize: 8.0,
                                          ),
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
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  @override
  State<NewsDetailView> createState() => NewsDetailController(item['id']);
}
