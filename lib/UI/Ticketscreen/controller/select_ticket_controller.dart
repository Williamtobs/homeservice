import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectTicketNotifier extends ChangeNotifier {
  String ibadanLagos = 'Ibadan to Lagos';
  String lagosIbadan = 'Lagos to Ibadan';

  String descriptionIbadan =
      'Purchase a Train ticket from Ibadan to Lagos without stress';

  String descriptionLagos =
      'Purchase a Train ticket from Lagos to Ibadan without stress';
}

final selectTicketNotifier =
    ChangeNotifierProvider((ref) => SelectTicketNotifier());
