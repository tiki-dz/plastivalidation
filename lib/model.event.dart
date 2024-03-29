
import 'package:sizer/sizer.dart';

class EventModel {
  int id;
  String name;
  String description;
  String price;
  String organiser;
  String address;
  String eventImage;
  String ticketImage;
  DateTime startDate;
  DateTime endDate;
  int ticketNb;
  String category ;

  EventModel(
      {required this.category,required this.id,
      required this.name,
      required this.description,
      required this.organiser,
      required this.address,
      required this.eventImage,
      required this.ticketImage,
      required this.ticketNb,
      required this.startDate,
      required this.endDate,
      required this.price});

  factory EventModel.fromJson(Map<String, dynamic> item) {
    return EventModel(
      category:
        item["SubCategories"] ==null ? "": item["SubCategories"][0]["Category"]["name"] ,
        price: item["price"] == null ? "2300" : item["price"].toString(),
        id: item["idEvent"],
        name: item["name"],
        description: item["description"],
        organiser: item["organiser"],
        address: item["address"],
        eventImage: item["eventImage"],
        ticketImage: item["ticketImage"],
        ticketNb: item["ticketNb"],
        startDate: DateTime.parse(item["startDate"]),
        endDate: DateTime.parse(item["endDate"]));
  }

  String startDateTitleFormat() {
    String date = weekDays[startDate.weekday]+","+monthsAn[startDate.month] +
        " " +
        startDate.day.toString() +
        ", " +
        startDate.year.toString();
    return date;
  }



  String city() {
    return "";
    return address.split(',').first;
  }

  String addressExact() {
    return "";
    return address.split(',')[2];
  }

  String nameHome() {
    var length = name.length;
    return length > 20 ? (name).substring(0, 16) + "..." : name;
  }

  String nameDetailEvent() {
    var length = name.length;
    return length > 20 ? name.substring(0, 20) + "..." : name;
  }

  double nameSizePurchase() {
    var length = name.length;
    return length > 20 ? 10.sp : 13.sp;
  }

  bool previous(){
    return startDate.difference(DateTime.now()).inDays<0;
  }

  String agoOrAfterDate() {
    DateTime now = DateTime.now();
    if (startDate.isAfter(now)) {
      if (startDate.difference(now).inDays < 2) {
        return "reste one day";
      }
      if (startDate.difference(now).inDays < 7) {
        return "reste moins d'une semaine";
      }

      return "reste plus d'une semaine";
    } else {
      if (startDate.difference(now).inDays < -2) {
        return "one day ago";
      }
      if (startDate.difference(now).inDays < -7) {
        return "moins d'une semaine ago";
      }

      return "plus d'une semaine ago";
    }
  }

  @override
  String toString() {
    return 'EventModel{id: $id, name: $name, description: $description, organiser: $organiser, address: $address, eventImage: $eventImage, ticketImage: $ticketImage, startDate: $startDate, endDate: $endDate, ticketNb: $ticketNb}';
  }
}
List<String> monthsAn = [
  '',
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

List<String> weekDays = [
  '',
  'Sunday',
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday'
];