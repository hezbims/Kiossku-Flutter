class PropertiPreview{
  final int id;
  final String tipeProperti;
  final String judulPromosi;
  final String alamat;
  final int harga;
  final String? waktuPembayaran;
  final String thumbnail;

  PropertiPreview({
    required this.id,
    required this.tipeProperti,
    required this.judulPromosi,
    required this.alamat,
    required this.harga,
    this.waktuPembayaran,
    required this.thumbnail
  });
}