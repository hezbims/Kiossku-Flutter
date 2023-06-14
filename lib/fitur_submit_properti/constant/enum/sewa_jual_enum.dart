
enum SewaJual{

  sewa("Sewa"),
  jual("Jual");

  const SewaJual(String s) : _str = s;
  final String _str;

  @override
  String toString() => _str;
}