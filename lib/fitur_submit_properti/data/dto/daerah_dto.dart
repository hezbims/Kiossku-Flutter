class DaerahDto{
  factory DaerahDto.fromJson(Map<String , dynamic> json){
    return DaerahDto(id: json['id']!, name: json['nama']!);
  }

  final String id;
  final String name;
  DaerahDto({required this.id , required this.name});

  // bool operator ==(dynamic other) =>
  //     other != null &&
  //         other is DaerahDto &&
  //         this.id == other.id;
  //
  // @override
  // int get hashCode => super.hashCode;
}