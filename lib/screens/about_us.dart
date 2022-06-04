import 'package:bootcamp_project/constants/color_constants.dart';
import 'package:bootcamp_project/widgets/build_AppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        "Hakkımızda",
        Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Text(
              "Biz Kimiz?",
              style: GoogleFonts.poppins(
                  fontSize: 20, color: ColorConstants.darkblue),
            ),
            Text(
              "2022 Yılında kurulan Core takımı, uygulama oluşturma faaliyetlerini Oyun ve Uygulama Akademisi’nin öncülüğünde 2022 Bootcamp sürecinde müzisyenler ve müzikle alakalı bilgi edinmek  isteyen kullanıcılar için üretmiş oldukları  'Müzisyenler için Sosyal medya projesi' ile kariyer hayatlarına başlamış bulunmaktadır. Projelerinde tamamiyle insanlara müzik konusunda özgüven kazandırma, birbirleriyle kaliteli bir ortamda iletişime geçme,tecrübe paylaşımı yapma ve kullanıcıların müziklerini sorunsuz bir şekilde birbirleri ile paylaşma amacıyla çalışmışlardır. Uygulama içerisinde kullanıcılara sağlanan blog yazabilme, ilan oluşturabilme ve kendi orkestrasını yaratabilme özellikleri üzerinde çalışmalarını sürdürmektedirler. Core olarak;  kitlemize  hitap edecek teknolojileri ve hizmetleri günden güne sizler için güncelliyoruz ve sizlere sunmaktan mutluluk duyuyoruz.",
              style: GoogleFonts.poppins(
                  fontSize: 15, color: ColorConstants.black),
            ),
            SizedBox(height: 20),
            Divider(thickness: 0.2, color: ColorConstants.darkblue),
            Text(
              "İletişim",
              style: GoogleFonts.poppins(
                  fontSize: 20, color: ColorConstants.darkblue),
            ),
            Text(
              "info@senfonia.com",
              style: GoogleFonts.poppins(
                  fontSize: 15, color: ColorConstants.black),
            ),
          ],
        ),
      ),
    );
  }
}
