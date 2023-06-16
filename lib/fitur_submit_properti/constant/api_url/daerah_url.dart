abstract class DaerahUrl{
  static const _baseUrl = "https://ibnux.github.io/data-indonesia/";

  static const provinsiUrl = "${_baseUrl}provinsi.json";
  static String getKabupatenUrl(String id){
    return "${_baseUrl}kabupaten/$id.json";
  }
  static String getKecamatanUrl(String id){
    return "${_baseUrl}kecamatan/$id.json";
  }
  static String getKelurahanUrl(String id){
    return "${_baseUrl}kelurahan/$id.json";
  }
}