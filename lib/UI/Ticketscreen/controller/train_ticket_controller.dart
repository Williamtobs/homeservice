import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class TrainTicketNotifier extends ChangeNotifier {
  String type = '';
  String trainStation = '';
  String selectedDate = '';
  String time = '';

  String ticketFees = '0';

  String ticketType = '';

  int? economyAmount;
  int? businessAmount;
  int? upperBusiness;
  int? vip;

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

  List? times;
  List? saturdayTime;
  List? fridayTime;
  List? lagosStation;
  List? ibadanStation;

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
      notifyListeners();
    } else if (args.value is List<DateTime>) {
    } else {}
  }
}

final trainTicketNotifier =
    ChangeNotifierProvider((ref) => TrainTicketNotifier());
