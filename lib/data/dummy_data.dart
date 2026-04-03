// lib/data/dummy_data.dart

import 'models/flower_model.dart';

class DummyData {
  DummyData._();

  static List<FlowerModel> getFlowersData() {
    return const [
      FlowerModel(
        nama: 'Mawar Merah',
        gambar: 'assets/images/img_mawar_merah.jpg',
        deskripsi: 'Mawar merah adalah bunga yang paling populer di dunia dengan kelopak halus dan aroma wangi yang khas.',
        bahasaBunga: 'Cinta yang mendalam, hasrat, dan keberanian. Melambangkan perasaan romantis yang tulus dan abadi.',
        asalDaerah: 'Asia Barat & Eropa',
      ),
      FlowerModel(
        nama: 'Mawar Putih',
        gambar: 'assets/images/img_mawar_putih.png',
        deskripsi: 'Mawar putih memancarkan keanggunan dengan kelopaknya yang bersih dan murni.',
        bahasaBunga: 'Kemurnian, ketulusan, dan kesucian. Sering digunakan dalam pernikahan sebagai simbol cinta sejati.',
        asalDaerah: 'Asia & Eropa',
      ),
      FlowerModel(
        nama: 'Tulip Merah',
        gambar: 'assets/images/img_tulip_merah.png',
        deskripsi: 'Tulip merah adalah bunga musim semi yang ikonik dengan bentuk cangkir yang elegan.',
        bahasaBunga: 'Deklarasi cinta yang sempurna. Mengungkapkan perasaan "Aku mencintaimu" dengan cara yang paling indah.',
        asalDaerah: 'Turki & Belanda',
      ),
      FlowerModel(
        nama: 'Lavender',
        gambar: 'assets/images/img_lavender.jpg',
        deskripsi: 'Lavender dikenal dengan warna ungu lembut dan aromanya yang menenangkan jiwa.',
        bahasaBunga: 'Ketenangan, kesetiaan, dan keheningan. Melambangkan rasa cinta yang diam namun mendalam.',
        asalDaerah: 'Mediterania',
      ),
      FlowerModel(
        nama: 'Bunga Matahari',
        gambar: 'assets/images/img_bunga_matahari.jpg',
        deskripsi: 'Bunga matahari selalu menghadap ke arah matahari, mencerminkan kesetiaan dan keceriaan.',
        bahasaBunga: 'Kesetiaan, kebahagiaan, dan harapan. Simbol kekaguman yang hangat kepada seseorang.',
        asalDaerah: 'Amerika Utara',
      ),
      FlowerModel(
        nama: 'Sakura',
        gambar: 'assets/images/img_sakura.jpg',
        deskripsi: 'Sakura atau bunga ceri Jepang mekar singkat namun meninggalkan kesan yang tak terlupakan.',
        bahasaBunga: 'Keindahan yang fana, kehidupan yang singkat namun bermakna. Melambangkan kelembutan dan kecantikan.',
        asalDaerah: 'Jepang & Korea',
      ),
      FlowerModel(
        nama: 'Anggrek Bulan',
        gambar: 'assets/images/img_anggrek_bulan.jpg',
        deskripsi: 'Anggrek bulan adalah bunga nasional Indonesia yang anggun dengan kelopak lebar berwarna putih.',
        bahasaBunga: 'Keanggunan, kemewahan, dan keindahan abadi. Simbol cinta yang halus dan penuh pesona.',
        asalDaerah: 'Indonesia',
      ),
      FlowerModel(
        nama: 'Melati',
        gambar: 'assets/images/img_melati.png',
        deskripsi: 'Melati adalah bunga nasional Indonesia yang dikenal dengan aroma wanginya yang lembut dan memikat.',
        bahasaBunga: 'Kesucian, kerendahan hati, dan kasih sayang. Dalam budaya Indonesia melambangkan cinta yang tulus.',
        asalDaerah: 'Asia Selatan & Asia Tenggara',
      ),
      FlowerModel(
        nama: 'Lotus',
        gambar: 'assets/images/img_lotus.png',
        deskripsi: 'Lotus tumbuh di air berlumpur namun mekar dengan indah dan bersih ke permukaan.',
        bahasaBunga: 'Pencerahan spiritual, kebangkitan, dan kemurnian jiwa. Simbol keindahan yang lahir dari kesulitan.',
        asalDaerah: 'Asia & Australia',
      ),
      FlowerModel(
        nama: 'Dahlia',
        gambar: 'assets/images/img_dahlia.jpg',
        deskripsi: 'Dahlia memiliki kelopak berlapis yang rumit dengan warna-warna yang kaya dan beragam.',
        bahasaBunga: 'Komitmen abadi, keanggunan, dan kekuatan batin. Melambangkan ikatan yang tidak mudah goyah.',
        asalDaerah: 'Meksiko & Amerika Tengah',
      ),
    ];
  }
}