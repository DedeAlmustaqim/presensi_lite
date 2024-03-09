import 'package:atei_bartim/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class PrivacyDialog extends StatefulWidget {
  final bool isChecked;

  const PrivacyDialog({Key? key, required this.isChecked}) : super(key: key);

  @override
  _PrivacyDialogState createState() => _PrivacyDialogState();
}

class _PrivacyDialogState extends State<PrivacyDialog> {
  // var url = AppConfig.baseUrl;
  acceptPrivacy() async {
    var response = await Dio().post(
      "${AppConfig.baseUrl}/api/user/is_agree",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AuthService.token}",
        },
      ),
      data: {"id": AuthService.id},
    );
    Map obj = response.data;
    print(obj['success']);
    return obj['success'];
  }

  late bool _isChecked;

  String html =
      '<p>Kebijakan Privasi</p><p>Terakhir diperbarui: 05 Februari 2024</p><p>Kebijakan Privasi ini menjelaskan kebijakan dan prosedur kami tentang pengelolaan informasi dan data Anda saat menggunakan Layanan ini serta memberikan informasi tentang hak privasi Anda dan bagaimana hukum melindungi Anda.</p><p>Kami menggunakan data pribadi Anda untuk menyediakan dan meningkatkan Layanan. Dengan menggunakan Layanan ini, Anda menyetujui pengelolaan informasi dan data sesuai dengan Kebijakan Privasi ini.</p><h3>Penafsiran dan Definisi</h3><p><strong>Penafsiran</strong> Kata-kata yang huruf pertamanya diawali huruf besar memiliki makna yang didefinisikan dalam kondisi-kondisi berikut. Definisi-definisi berikut akan memiliki makna yang sama terlepas dari apakah mereka muncul dalam bentuk tunggal atau jamak.</p><p><strong>Definisi</strong> Untuk tujuan Kebijakan Privasi ini:</p><ul>	<li><strong>Akun</strong>: Merujuk pada Nomor Identitas Kependudukan yang dimiliki oleh karyawan Pemerintah Kabupaten Barito Timur, yang digunakan untuk mengakses layanan kehadiran elektronik Pemerintah Kabupaten Barito Timur.</li>	<li><strong>Aplikasi</strong>: Merujuk pada ATEI Bartim yang merupakan singkatan dari &quot;Absensi Elektronik Informasi&quot; Kabupaten Barito Timur, sebuah program perangkat lunak yang disediakan oleh Digital Native bekerja sama dengan Pemerintah Kabupaten Barito Timur untuk menyediakan layanan kehadiran elektronik.</li><li><strong>Pemerintah</strong>: Diacu sebagai &quot;Pemerintah&quot;, &quot;Kami&quot;, &quot;Kami&quot;, atau &quot;Kami&quot; dalam Perjanjian ini, merujuk pada Pemerintah Kabupaten Barito Timur, Jalan A. Yani Nomor 24, Tamiang Layang.</li><li><strong>Kuki</strong>: Adalah file-file kecil yang ditempatkan pada Komputer Anda, perangkat seluler, atau perangkat lainnya oleh sebuah situs web, yang berisi detail riwayat penjelajahan Anda di situs web tersebut di antara banyak penggunaannya.</li><li><strong>Negara</strong>: Merujuk pada Indonesia.</li><li><strong>Perangkat</strong>: Berarti setiap perangkat yang dapat mengakses Layanan seperti komputer, ponsel, atau tablet digital.</li><li><strong>Data Pribadi</strong>: Setiap informasi yang terkait dengan data yang dimiliki oleh karyawan Pemerintah Kabupaten Barito Timur yang dapat diidentifikasi atau dapat diidentifikasi.</li><li><strong>Layanan</strong>: Merujuk pada Aplikasi atau Situs Web atau keduanya.</li><li><strong>Penyedia Layanan</strong>: Merujuk pada individu atau entitas hukum yang mengelola data atas nama Pemerintah Kabupaten Barito Timur. Ini berkaitan dengan perusahaan pihak ketiga atau individu yang dipekerjakan oleh Pemerintah Kabupaten Barito Timur untuk memfasilitasi layanan, memberikan layanan atas nama Pemerintah Kabupaten Barito Timur.</li>	<li><strong>Data Penggunaan</strong>: Merujuk pada data yang dikumpulkan secara otomatis, baik dihasilkan oleh penggunaan Layanan atau dari infrastruktur Layanan itu sendiri (misalnya, durasi kunjungan halaman).</li><li><strong>Situs Web</strong>: Merujuk pada Presensi Elektronik Barito Timur, dapat diakses dari <a href="https://presensi.baritotimurkab.go.id/" target="_new">https://presensi.baritotimurkab.go.id</a>.</li><li><strong>Anda</strong>: Merujuk pada karyawan Pemerintah Kabupaten Barito Timur yang mengakses atau menggunakan layanan kehadiran elektronik sesuai dengan peraturan yang berlaku.</li></ul><h3>Pengumpulan dan Penggunaan Data Pribadi Anda</h3><h4>Jenis Data yang Dikumpulkan</h4><p><strong>Data Pribadi</strong></p><p>Saat menggunakan Layanan Kami, Kami dapat meminta Anda untuk memberikan kepada Kami beberapa informasi yang dapat diidentifikasi secara pribadi yang dapat digunakan untuk menghubungi atau mengidentifikasi Anda. Informasi yang dapat diidentifikasi secara pribadi dapat mencakup, namun tidak terbatas pada:</p><ul><li>Nama</li><li>Nomor Identitas Kependudukan</li>	<li>Nomor Induk Pegawai </li><li>Alamat email</li><li>Posisi Pegawai Negeri Sipil</li></ul><p><strong>Data Penggunaan</strong></p><p>Data Penggunaan dikumpulkan secara otomatis saat menggunakan Layanan.</p><p>Data Penggunaan dapat mencakup informasi seperti alamat Protokol Internet Perangkat Anda, jenis browser, versi browser, halaman Layanan kami yang Anda kunjungi.</p><p>Saat Anda mengakses Layanan melalui perangkat seluler, kami dapat mengumpulkan beberapa informasi secara otomatis, seperti lokasi perangkat Anda, termasuk alamat IP perangkat seluler Anda.</p><p><strong>Informasi yang Dikumpulkan saat Menggunakan Aplikasi</strong></p>p>Saat menggunakan Aplikasi Kami, untuk menyediakan fitur-fitur Aplikasi Kami, Kami dapat mengumpulkan, dengan izin Anda sebelumnya:</p><ul><li>Informasi tentang lokasi Anda</li><li>Foto dan informasi lain dari kamera dan perpustakaan foto Perangkat Anda</li></ul><p>Kami menggunakan informasi ini untuk tujuan fitur-fitur Layanan Kami. Informasi lokasi Anda digunakan untuk menentukan apakah lokasi Anda sesuai untuk kehadiran kerja, sedangkan perangkat kamera digunakan untuk proses kehadiran dengan memindai kode QR di halaman <a href="https://presensi.baritotimurkab.go.id/" target="_new">https://presensi.baritotimurkab.go.id</a>.</p><p>Anda dapat mengaktifkan atau menonaktifkan akses ke informasi ini kapan saja, melalui pengaturan Perangkat Anda.</p><h4>Teknologi Pelacakan dan Kuki</h4><p>Kami menggunakan Kuki dan teknologi pelacakan serupa untuk melacak aktivitas di Layanan Kami dan menyimpan beberapa informasi. Teknologi pelacakan yang digunakan adalah balok, tag, dan skrip untuk mengumpulkan dan melacak informasi dan untuk meningkatkan dan menganalisis Layanan Kami. Teknologi yang Kami gunakan dapat mencakup:</p><ul>	<li><strong>Kuki atau Kuki Peramban</strong>: Sebuah kuki adalah file kecil yang ditempatkan pada Perangkat Anda. Anda dapat menginstruksikan peramban Anda untuk menolak semua Kuki atau untuk menunjukkan ketika sebuah Kuki dikirim. Namun, jika Anda tidak menerima Kuki, Anda mungkin tidak dapat menggunakan beberapa bagian dari Layanan kami. Kecuali Anda telah mengatur pengaturan peramban Anda sehingga akan menolak Kuki, Layanan kami dapat menggunakan Kuki.</li>	<li><strong>Balok Web</strong>: Bagian-bagian tertentu dari Layanan kami dan email kami dapat berisi file elektronik kecil yang dikenal sebagai balok web (juga disebut sebagai gambar gif, tag piksel, dan gambar gif satu piksel) yang memperbolehkan Pemerintah, misalnya, untuk menghitung pengguna yang telah mengunjungi halaman-halaman tersebut atau membuka sebuah email dan untuk statistik situs web lainnya yang terkait (misalnya, mencatat popularitas suatu bagian tertentu dan memverifikasi integritas sistem dan server).</li></ul><p>Kuki dapat berupa Kuki &quot;Persistent&quot; atau &quot;Sesi&quot;. Kuki Persisten tetap ada pada Komputer pribadi atau perangkat seluler Anda saat Anda offline, sedangkan Kuki Sesi dihapus segera setelah Anda menutup peramban web Anda. Anda dapat mempelajari lebih lanjut tentang kuki di artikel situs web TermsFeed.</p><p>Kami menggunakan kedua Kuki Sesi dan Kuki Persisten untuk tujuan yang diuraikan di bawah ini:</p><ul><li><strong>Kuki yang Diperlukan/Essensial</strong>: Tipe: Kuki Sesi. Dikelola oleh: Kami. Tujuan: Kuki-kuki ini penting untuk menyediakan Anda dengan layanan yang tersedia melalui Situs Web dan untuk memungkinkan Anda menggunakan beberapa fitur-fitur nya. Mereka membantu untuk mengautentikasi pengguna dan mencegah penggunaan fraudulensi dari akun pengguna. Tanpa Kuki-kuki ini, layanan yang Anda minta tidak dapat disediakan, dan Kami hanya menggunakan Kuki-kuki ini untuk menyediakan Anda dengan layanan-layanan tersebut.</li>	<li><strong>Kuki Penerimaan Kebijakan/Pemberitahuan Kuki</strong>: Tipe: Kuki Persisten. Dikelola oleh: Kami. Tujuan: Kuki-kuki ini mengidentifikasi apakah pengguna telah menerima penggunaan kuki pada Situs Web.</li><li><strong>Kuki Fungsionalitas</strong>: Tipe: Kuki Persisten. Dikelola oleh: Kami. Tujuan: Kuki-kuki ini memungkinkan kami untuk mengingat pilihan yang Anda buat saat Anda menggunakan Situs Web, seperti mengingat detail login Anda atau preferensi bahasa Anda. Tujuan dari Kuki-kuki ini adalah untuk memberikan Anda pengalaman yang lebih pribadi dan untuk menghindari Anda harus memasukkan preferensi Anda setiap kali Anda menggunakan Situs Web.</li></ul><p>Untuk informasi lebih lanjut tentang kuki yang kami gunakan dan pilihan Anda mengenai kuki, silakan kunjungi Kebijakan Kuki kami atau bagian Kuki dari Kebijakan Privasi kami.</p><h3>Penggunaan Data Pribadi Anda</h3><p>Pemerintah dapat menggunakan Data Pribadi untuk tujuan-tujuan berikut:</p><ul><li>Untuk menyediakan dan memelihara Layanan kami: termasuk memantau penggunaan Layanan kami.</li><li>Untuk mengelola Akun Anda: untuk mengelola pendaftaran Anda sebagai pengguna Layanan. Data Pribadi yang Anda berikan dapat memberi Anda akses ke fungsionalitas-fungsionalitas yang berbeda dari Layanan yang tersedia untuk Anda sebagai pengguna terdaftar.</li><li>Untuk menghubungi Anda: Untuk menghubungi Anda melalui email, panggilan telepon, SMS, atau bentuk-bentuk komunikasi elektronik lainnya yang setara, seperti pemberitahuan push aplikasi seluler tentang pembaruan atau komunikasi informatif terkait dengan fungsionalitas, layanan, termasuk pembaruan keamanan, bila diperlukan atau masuk akal untuk pelaksanaannya.</li>	<li>Untuk mengelola permintaan Anda: Untuk menanggapi dan mengelola permintaan layanan Anda kepada kami.</li><li>Untuk Pelaporan: Kami dapat menggunakan informasi Anda untuk tujuan pelaporan ketenagakerjaan, seperti analisis data kehadiran, pembayaran tunjangan, dan sejenisnya.</li></ul><p>Kami dapat membagikan informasi pribadi Anda dalam situasi-situasi berikut:</p><ul><li>Dengan Afiliasi: Kami dapat membagikan informasi Anda dengan afiliasi kami, dengan syarat bahwa afiliasi tersebut mematuhi Kebijakan Privasi ini. Afiliasi yang dimaksud adalah Pemerintah Pusat dan Kementerian yang menjadi bagian dari koordinasi lintas fungsional pemerintah.</li><li>Dengan Persetujuan Anda: Kami dapat mengungkapkan Informasi Pribadi Anda untuk tujuan lain dengan persetujuan Anda.</li></ul><h3>Pemeliharaan Data Pribadi Anda</h3><p>Pemerintah akan menyimpan Data Pribadi Anda hanya selama yang diperlukan untuk tujuan-tujuan yang diuraikan dalam Kebijakan Privasi ini. Kami akan menyimpan dan menggunakan Data Pribadi Anda sejauh yang diperlukan untuk mematuhi kewajiban hukum kami (misalnya, jika kami diwajibkan untuk menyimpan data Anda untuk mematuhi hukum yang berlaku), menyelesaikan perselisihan, dan menegakkan perjanjian dan kebijakan hukum kami.</p><p>Pemerintah juga akan menyimpan Data Penggunaan untuk tujuan analisis internal. Data Penggunaan biasanya disimpan untuk periode waktu yang lebih singkat, kecuali ketika data ini digunakan untuk memperkuat keamanan atau untuk meningkatkan fungsionalitas Layanan Kami, atau Kami secara hukum diwajibkan untuk menyimpan data ini untuk jangka waktu yang lebih lama.</p><h3>Transfer Data Pribadi Anda</h3><p>Informasi Anda, termasuk Data Pribadi, diproses di pusat data nasional yang dimiliki oleh Pemerintah Pusat dan pusat komputasi Kabupaten Barito Timur. Perlindungan data tunduk pada undang-undang dan peraturan yang berlaku di Indonesia.</p><p>Pemerintah akan mengambil semua langkah yang wajar diperlukan untuk memastikan bahwa data Anda diperlakukan dengan aman dan sesuai dengan Kebijakan Privasi ini, dan tidak ada transfer Data Pribadi Anda akan terjadi ke organisasi lain kecuali kontrol yang memadai diimplementasikan, termasuk keamanan data Anda dan informasi pribadi lainnya.</p><h3>Hapus Data Pribadi Anda</h3><p>Anda memiliki hak untuk menghapus atau meminta bantuan kami dalam menghapus Data Pribadi Anda yang kami kelola, asalkan Anda tidak lagi menjadi bagian dari karyawan Pemerintah Kabupaten Barito Timur.</p><p>Anda dapat memperbarui, mengubah, atau menghapus informasi Anda kapan saja dengan menghubungi kami untuk meminta akses, koreksi, atau penghapusan informasi pribadi Anda yang kami kelola di layanan kami.</p><p>Namun, harap dicatat bahwa kami mungkin perlu menyimpan beberapa informasi saat kami memiliki kewajiban hukum atau dasar hukum yang valid untuk melakukannya.</p><h3>Pengungkapan Data Pribadi Anda</h3><h4>Penegakan hukum</h4><p>Dalam keadaan tertentu, Pemerintah dapat diwajibkan untuk mengungkapkan Data Pribadi Anda jika diamanatkan oleh hukum atau sebagai respons terhadap permintaan yang sah oleh otoritas yudisial atau lembaga pemerintah lainnya.</p><h4>Persyaratan hukum lainnya</h4><p>Pemerintah dapat mengungkapkan Data Pribadi Anda dengan keyakinan baik bahwa tindakan tersebut diperlukan untuk:</p><ul><li>Mematuhi kewajiban hukum</li><li>Mencegah atau menyelidiki tindakan yang salah mungkin terjadi sehubungan dengan Layanan</li><li>Melindungi terhadap tanggung jawab hukum</li></ul><h3>Keamanan Data Pribadi Anda</h3><p>Keamanan Data Pribadi Anda penting bagi Kami, namun ingat bahwa tidak ada metode transmisi melalui internet, atau metode penyimpanan elektronik yang 100% aman. Meskipun Kami berusaha menggunakan cara yang dapat diterima secara komersial untuk melindungi Data Pribadi Anda, Kami tidak dapat menjamin keamanan absolutnya.</p><h3>Privasi Anak-Anak</h3><p>Layanan Kami tidak dimaksudkan untuk siapa pun di bawah usia 13 tahun. Layanan Kami secara khusus ditujukan untuk karyawan pemerintah yang bekerja di bawah Pemerintah Kabupaten Barito Timur.</p><h3>Tautan ke Situs Web Lain</h3><p>Layanan Kami hanya berisi tautan ke situs web dengan domain baritotimurkab.go.id dan subdomain yang terafiliasi dengannya. Kami tidak memiliki kontrol atas dan tidak bertanggung jawab atas konten, kebijakan privasi, atau praktik di luar tautan web di bawah domain baritotimurkab.go.id dan subdomain yang terafiliasinya.</p><h3>Perubahan pada Kebijakan Privasi ini</h3><p>Kami dapat memperbarui Kebijakan Privasi kami dari waktu ke waktu. Kami akan memberi tahu Anda tentang setiap perubahan dengan memposting Kebijakan Privasi baru ini di halaman ini.</p><p>Kami akan memberi tahu Anda melalui email dan/atau pemberitahuan lainnya di Layanan kami.</p>';
  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        'Kebijakan Privasi',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HtmlWidget(
              html,
              textStyle: TextStyle(fontSize: 12),
            ).animate().fadeIn(),
            SizedBox(height: 11),
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value ?? false;
                    });
                  },
                ),
                Expanded(child: Text('Saya menyetujui kebijakan privasi')),
              ],
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: _isChecked
              ? () async {
                  // await acceptPrivacy();
                  try {
                    bool isSuccess = await acceptPrivacy();
                    if (isSuccess) {
                      Navigator.of(context).pop(true);
                      await UserDataService.init();
                      // await MainNavigationController().isPrivacy();
                      await Get.offAll(MainNavigationView());
                    } else {
                      showInfoDialog(
                          message: "Gagal Menyimpan Data", title: "Gagal");
                    }
                  } on Exception catch (err) {
                    showInfoDialog(message: err.toString(), title: "Gagal");
                  }
                }
              : null,
          child: Column(
            children: [
              Text('Setuju'),
            ],
          ),
        ),
        TextButton(
          onPressed: () async {
            SystemNavigator.pop();
          },
          child: Text(
            'Tidak Setuju',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}

Future<bool?> showPrivacyDialog({
  required BuildContext context,
  required String message,
  required String title,
  Icon? icon,
  bool isIcon = true,
  bool isChecked = false,
}) async {
  return showDialog<bool>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return PrivacyDialog(
        isChecked: isChecked,
      );
    },
  );
}
