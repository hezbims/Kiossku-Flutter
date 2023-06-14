enum FixNego{
  fix("Fix"),
  nego("Nego");

  const FixNego(String s) : _str = s;
  final String _str;
  @override
  String toString() => _str;
}