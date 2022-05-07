import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class TrainTicketNotifier extends ChangeNotifier {
  // var ibadanLagos = false;
  // var lagosIbadan = false;
  // var ibadanAbeokuta = false;
  // var abeokutaIbadan = false;
  String type = '';
  String trainStation = '';
  String selectedDate = '';
  String time = '';

  String ticketFees = '0';

  String ticketType = '';

  String economyAmount = '2,500';
  String businessAmount = '3,500';
  String upperBusiness = '5,000';
  String vip = '6,000';
  String day = '';

  void economyChecked(String ticketType, String price) {
    this.ticketType = ticketType;
    ticketFees = price;
    notifyListeners();
  }

  Map<String, bool> lagosValues = {
    'Mobolaji Johnson (Ebute Metta Station) Lagos': false,
    'Babatunde Raji Fashola (Agege Station) Lagos': false,
  };

  Map<String, bool> ibadanValues = {
    'Samuel Ladoke Akintola (Omi-Adio Station) Ibadan': false,
    'Obafemi Awolowo (Moniya Station) Ibadan': false,
  };

  List stations = [
    'Wole soyinka train station',
    'Omi Adio',
    'Lagos Station',
    'Abeokuta Station'
  ];

  List times = ['8:00 am', '4:00 pm'];
  List saturdayTime = ['8:00 am', '1:00 pm', '4:00 pm'];
  List fridayTime = ['8:00 am', '12:00 pm', '4:00 pm'];

  void selectTime(String time) {
    this.time = time;
    notifyListeners();
  }

  void selectedStation(String trainStation) {
    this.trainStation = trainStation;
    notifyListeners();
  }

  void selectedType(String type) {
    this.type = type;
    notifyListeners();
  }

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
    } else if (args.value is DateTime) {
      DateFormat formatter = DateFormat('dd-MM-yyyy');
      DateFormat getDate = DateFormat('EEEE');
      selectedDate = formatter.format(args.value);
      day = getDate.format(args.value);
      print(selectedDate);
      print(day);
      notifyListeners();
    } else if (args.value is List<DateTime>) {
    } else {}
  }
}

final trainTicketNotifier =
    ChangeNotifierProvider((ref) => TrainTicketNotifier());
