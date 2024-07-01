import 'package:flutter/material.dart';
import 'package:shared/generated/generated.dart';
import 'package:shared/shared.dart';

class StatusReservationView extends StatelessWidget {
  StatusReservationView({required this.status, super.key});

  final String status;

  String sA = 'Approved';
  String sS = 'Submitted';
  String sR = 'Rejected';
  String sC = 'Cancel';
  String sCanceled = 'Canceled';
  String sP = 'Proccess';
  String sCl = 'Closed';

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: status == sS
                ? AppColors.primaryColor.withOpacity(.1)
                : status == sP
                    ? Colors.orange.shade50
                    : status == sA || status == sCl
                        ? Colors.green.shade50
                        : Colors.red.shade50),
        padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
        child: Text(
          title(context, status),
          style: Styles.textSBold.copyWith(
            color: status == sS
                ? AppColors.primaryColor
                : status == sP
                    ? Colors.orange
                    : status == sA || status == sCl
                        ? Colors.green
                        : Colors.red,
          ),
        ));
  }

  String title(BuildContext context, String data) {
    final l10n = context.l10n;
    if (data == sS) {
      return l10n.submitted;
    } else if (data == sA) {
      return l10n.approved;
    } else if (data == sR) {
      return l10n.rejected;
    } else if (data == sC || data == sCanceled) {
      return l10n.cancelled;
    } else if (data == sP) {
      return l10n.process;
    } else if (data == sCl) {
      return l10n.closed;
    }

    return '';
  }
}
