import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/component/atom/atom.dart';
import 'package:shared/shared.dart';
import 'package:shared/utils/app_date_convert.dart';

class MonthYearFilter extends StatefulWidget {
  const MonthYearFilter({super.key, required this.onApply});

  final Function(MonthYear) onApply;

  @override
  State<MonthYearFilter> createState() => _MonthYearFilterState();
}

class MonthYear {
  final String month;
  final String year;
  MonthYear({
    required this.month,
    required this.year,
  });
}

class _MonthYearFilterState extends State<MonthYearFilter> {
  List<String> years = [];
  int indexYear = 10;
  int indexMonth = 0;
  String yearSelected = '';

  @override
  void initState() {
    getYear();
    indexMonth = DateTime.now().month - 1;
    yearSelected = DateTime.now().year.toString();
    super.initState();
  }

  void getYear() {
    final yearNow = DateTime.now().year;
    years.clear();
    for (var i = yearNow - 10; i < yearNow; i++) {
      years.add('$i');
    }

    for (var i = yearNow; i <= yearNow + 10; i++) {
      years.add('$i');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: Row(
            children: [
              Expanded(
                child: ListWheelScrollView.useDelegate(
                    physics: const FixedExtentScrollPhysics(),
                    controller:
                        FixedExtentScrollController(initialItem: indexMonth),
                    itemExtent: 30,
                    useMagnifier: true,
                    magnification: 1.6,
                    perspective: 0.005,
                    onSelectedItemChanged: (value) {
                      setState(() {
                        indexMonth = value;
                      });
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        return Text(months[index],
                            style: Styles.textLBold.copyWith(
                              color: indexMonth == index
                                  ? AppColors.primaryColor
                                  : Colors.grey,
                            ));
                      },
                      childCount: months.length,
                    )),
              ),
              10.pw(),
              Expanded(
                child: ListWheelScrollView.useDelegate(
                    physics: const FixedExtentScrollPhysics(),
                    controller:
                        FixedExtentScrollController(initialItem: indexYear),
                    itemExtent: 30,
                    useMagnifier: true,
                    magnification: 1.6,
                    perspective: 0.005,
                    onSelectedItemChanged: (value) {
                      setState(() {
                        indexYear = value;
                        yearSelected = years[indexYear];
                      });
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        return Text(years[index],
                            style: Styles.textLBold.copyWith(
                              color: indexYear == index
                                  ? AppColors.primaryColor
                                  : Colors.grey,
                            ));
                      },
                      childCount: years.length,
                    )),
              ),
            ],
          ),
        ),
        10.ph(),
        AppButton(
            title: 'Terapkan',
            onPressed: () {
              context.pop();
              widget.onApply.call(MonthYear(
                  month: (indexMonth + 1).toString(), year: yearSelected));
            })
      ],
    );
  }
}
