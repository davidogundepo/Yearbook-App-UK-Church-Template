class NoblemenNetwork {
  String autoBio;
  String dob;
  String qualification;
  String staffPosition;
  String yearOfInception;
  String regionOfOrigin;
  String nationality;
  String hobbies;
  String bestMoment;
  String worstMoment;
  String snapchat;
  String tikTok;
  String philosophy;
  String email;
  String facebook;
  String id;
  String image;
  String instagram;
  String name;
  String phone;
  String twitter;
  String whyChurchUnit;
  String linkedIn;

  NoblemenNetwork.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    autoBio = data['autobio'];
    dob = data['dob'];
    email = data['email'];
    facebook = data['facebook'];
    image = data['image'];
    instagram = data['instagram'];
    name = data['name'];
    phone = data['phone'];
    bestMoment = data['best_moment'];
    worstMoment = data['worst_moment'];
    twitter = data['twitter'];
    snapchat = data['snapchat'];
    tikTok = data['tiktok'];
    qualification = data['qualification'];
    yearOfInception = data['year_of_inception'];
    staffPosition = data['staff_position'];
    regionOfOrigin = data['region_of_origin'];
    nationality = data['nationality'];
    hobbies = data['hobbies'];
    philosophy = data['philosophy'];
    whyChurchUnit = data['why_church_unit'];;
  }

}