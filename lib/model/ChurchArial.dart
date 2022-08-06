
class ChurchArial {
  String image;
  String toastName;

  ChurchArial.fromMap(Map<String, dynamic> data) {
    image = data['image'];
    toastName = data['toastname'];
  }
}