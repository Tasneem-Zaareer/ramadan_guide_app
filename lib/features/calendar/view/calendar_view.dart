import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  CalendarViewState createState() => CalendarViewState();
}

class CalendarViewState extends State<CalendarView> {
  final DateTime _currentDate = DateTime.now();
  DateTime _currentDate2 = DateTime.now();
  String _currentMonth = DateFormat.yMMM().format(DateTime.now());
  DateTime _targetDateTime = DateTime.now();

  static final Widget _eventIcon = Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(1000)),
      border: Border.all(color: Colors.blue, width: 2.0),
    ),
    child: Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );

  final EventList<Event> _markedDateMap = EventList<Event>(events: {
    DateTime(2025, 2, 10): [
      Event(
        date: DateTime(2025, 2, 10),
        title: 'Event 1',
        icon: _eventIcon,
      ),
      Event(
        date: DateTime(2025, 2, 10),
        title: 'Event 2',
        icon: _eventIcon,
      ),
    ],
  });

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Get the current theme
    ThemeData currentTheme = Theme.of(context);

    final calendarCarouselNoHeader = CalendarCarousel<Event>(
      todayBorderColor: currentTheme.brightness == Brightness.light
          ? currentTheme.colorScheme.primary
          : currentTheme.colorScheme.secondary, // Border color based on theme
      onDayPressed: (date, events) {
        setState(() => _currentDate2 = date);
      },
      daysHaveCircularBorder: true,
      showOnlyCurrentMonthDate: false,
      weekendTextStyle: TextStyle(
        color: currentTheme.brightness == Brightness.light
            ? currentTheme.colorScheme.secondary
            : currentTheme.colorScheme.onSurface, // Weekend text color
      ),
      thisMonthDayBorderColor: currentTheme.colorScheme.surface,
      weekFormat: false,
      firstDayOfWeek: 4,
      markedDatesMap: _markedDateMap,
      height: MediaQuery.of(context).size.height * 0.5,
      selectedDateTime: _currentDate2,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateCustomShapeBorder: CircleBorder(side: BorderSide(color: currentTheme.colorScheme.tertiary)),
      markedDateCustomTextStyle: TextStyle(
        fontSize: 18,
        color: currentTheme.colorScheme.primary,
      ),
      showHeader: false,
      todayTextStyle: TextStyle(
        color: currentTheme.colorScheme.primary,
      ),
      todayButtonColor: currentTheme.colorScheme.tertiary,
      selectedDayTextStyle: TextStyle(
        color: currentTheme.colorScheme.onPrimary,
      ),
      minSelectedDate: DateTime(_currentDate.year - 100, _currentDate.month),
      maxSelectedDate: DateTime(_currentDate.year + 100, _currentDate.month),
      selectedDayBorderColor: currentTheme.colorScheme.primary,
      selectedDayButtonColor: currentTheme.colorScheme.primaryContainer,

      prevDaysTextStyle: TextStyle(
        fontSize: 16,
        color: currentTheme.colorScheme.secondary,
      ),
      inactiveDaysTextStyle: TextStyle(
        color: currentTheme.colorScheme.tertiaryContainer,
        fontSize: 16,
      ),
      onCalendarChanged: (DateTime date) {
        setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
    );

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20.h),
            Container(
              margin: EdgeInsets.only(
                top: 30.0,
                bottom: 16.0,
                left: 16.0,
                right: 16.0,
              ),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_left),
                    onPressed: () {
                      setState(() {
                        _targetDateTime = DateTime(_targetDateTime.year - 1, _targetDateTime.month);
                        _currentMonth = DateFormat.yMMM().format(_targetDateTime);
                      });
                    },
                  ),
                  Expanded(
                    child: Text(
                      _currentMonth,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                        color: currentTheme.colorScheme.onSurface, // Text color for month
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_right),
                    onPressed: () {
                      setState(() {
                        _targetDateTime = DateTime(_targetDateTime.year + 1, _targetDateTime.month);
                        _currentMonth = DateFormat.yMMM().format(_targetDateTime);
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: calendarCarouselNoHeader,
            ),
          ],
        ),
      ),
    );
  }
}
