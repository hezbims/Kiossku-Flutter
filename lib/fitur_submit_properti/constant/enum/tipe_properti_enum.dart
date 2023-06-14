enum TipeProperti{
  lahan("Lahan"),
  lapak("Lapak"),
  gudang("Gudang"),
  kios("Kios");



  const TipeProperti(String s) :
    _str = s;
  final String _str;
  @override
  String toString() => _str;
}