import 'package:image_picker/image_picker.dart';

class Properti {
  final String judulPromosi;
  final int harga;
  final String tipeProperti;
  final String waktuPembayaran;
  final String fixNego;
  final String sewaJual;
  final String provinsi;
  final String kota;
  final String kecamatan;
  final String kelurahan;
  final int luasLahan;
  final int luasBangunan;
  final int tingkat;
  final int kapasitasListrik;
  final String alamat;
  final String fasilitas;
  final String deskripsi;
  final int panjang;
  final int lebar;
  final List<XFile> images;

  Properti({
    required this.tipeProperti,
    required this.judulPromosi,
    required this.harga,
    required this.waktuPembayaran,
    required this.fixNego,
    required this.sewaJual,
    required this.provinsi,
    required this.kota,
    required this.kecamatan,
    required this.kelurahan,
    required this.luasLahan,
    required this.luasBangunan,
    required this.tingkat,
    required this.kapasitasListrik,
    required this.alamat,
    required this.fasilitas,
    required this.deskripsi,
    required this.panjang,
    required this.lebar,
    required this.images
  });
}