import '../../../fitur_submit_properti/constant/enum/sewa_jual_enum.dart';

class FilterData{
  final int? maxHarga;
  final int? minHarga;
  final String? provinsi;
  final String? kabupaten;
  final String? kecamatan;
  final String? kelurahan;
  final SewaJual? sewaJual;

  FilterData({
    this.maxHarga,
    this.minHarga,
    this.provinsi,
    this.kabupaten,
    this.kecamatan,
    this.kelurahan,
    this.sewaJual
  });
}