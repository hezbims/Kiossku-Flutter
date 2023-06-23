abstract class NavRoute{
  static const homeRoute = "/home";
  static const loginRoute = "/login";
  static const submitPropertiRoute = "/submitProperti";
  static const form1SubmitPropertiRoute = "/form1SubmitPropertiRoute";
  static const form2SubmitPropertiRoute = "/form2SubmitPropertiRoute";
  static const form3SubmitPropertiRoute = "/form3SubmitPropertiRoute";
  static const finishSubmitRoute = "/finishSubmitRoute";
  static const detailPropertiBaseRoute = "/detailPropertiRoute/:id";
  static String getDetailPropertiRoute(int idProperti) =>
      "/detailPropertiRoute/$idProperti";

}