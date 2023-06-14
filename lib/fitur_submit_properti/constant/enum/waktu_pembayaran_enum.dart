enum WaktuPembayaran{
  tahunan("tahunan"),
  bulanan("bulanan");

  final String _str;
  const WaktuPembayaran(String s) : _str = s;
  @override
  String toString() => _str;
}