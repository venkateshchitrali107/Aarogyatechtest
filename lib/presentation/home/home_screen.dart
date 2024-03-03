import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../patient_profile/patient_profile_screen.dart';
import 'widgets/hour_slot_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  int currentDateIndex = 0;

  List<String> doctors = [
    'Dr Alpha',
    'Dr Beta',
    'Dr Gamma',
  ];
  String? dropdownValue;
  List<DateTime> getDates() {
    var now = DateTime.now();
    var oneMonthAgo = now.subtract(const Duration(days: 30));
    var oneMonthFuture = now.add(const Duration(days: 30));

    var dates = <DateTime>[];

    var current = oneMonthAgo;
    while (current.isBefore(oneMonthFuture)) {
      dates.add(current);
      current = current.add(const Duration(days: 1));
    }
    currentDateIndex = dates.indexWhere((element) {
      return element.year == now.year &&
          element.month == now.month &&
          element.day == now.day;
    });
    return dates;
  }

  // Container getTheHourSlot(
  //   int slotTime,
  //   int numberOfAvailableSlots,
  //   BuildContext context,
  // ) {
  //   return Container(
  //     margin: const EdgeInsets.symmetric(horizontal: 4),
  //     height: MediaQuery.of(context).size.width / 4.5,
  //     width: MediaQuery.of(context).size.width / 4.5,
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       shape: BoxShape.circle,
  //       border: Border.all(
  //         color: Colors.black26,
  //         width: 1,
  //       ),
  //       boxShadow: const [
  //         BoxShadow(
  //           color: Colors.black12,
  //           blurRadius: 10,
  //           offset: Offset(0, 5),
  //         ),
  //       ],
  //     ),
  //     child: Center(
  //       child: CustomPaint(
  //         painter: DrawSlotsCircle(numberOfSlots: numberOfAvailableSlots),
  //         child: Center(
  //           child: Text(
  //             '$slotTime',
  //             style: Theme.of(context).textTheme.labelSmall,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget getTheAppointmentSlotChips(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Chip(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        labelPadding: const EdgeInsets.all(0),
        label: Text(
          '8:00 - 8:15',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }

  @override
  void initState() {
    getDates();
    super.initState();
    Future.delayed(
      const Duration(
        seconds: 2,
      ),
    ).then((value) {
      _scrollController.animateTo(
        (currentDateIndex - 1) * 100.0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final dates = getDates();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.grey,
        elevation: 2,
        title: const Text(
          'Appointments',
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pick a Date',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                const Icon(
                  Icons.calendar_month,
                )
              ],
            ),
          ),
          SizedBox(
            height: 140,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dates.length,
              controller: _scrollController,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: index == currentDateIndex ? 3.0 : 0.5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(
                          width: 1,
                          color: (index == currentDateIndex)
                              ? Colors.black38
                              : Colors.transparent,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              DateFormat('MMM').format(dates[index]),
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Text(
                                DateFormat('dd').format(dates[index]),
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                            Text(
                              DateFormat('E').format(dates[index]),
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 32,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: 16,
                    ),
                    child: DropdownButton<String>(
                      hint: const Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          'Doctor',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      value: dropdownValue,
                      underline: const SizedBox(),
                      items:
                          doctors.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(
                          () {
                            dropdownValue = newValue!;
                          },
                        );
                      },
                    ),
                  ),
                ),
                const Row(
                  children: [
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text('AM'),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text('PM'),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 130,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  GetTheHourSlot(5, 1),
                  GetTheHourSlot(6, 2),
                  GetTheHourSlot(7, 4),
                  GetTheHourSlot(8, 0),
                  GetTheHourSlot(9, 3),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  getTheAppointmentSlotChips(context),
                  getTheAppointmentSlotChips(context),
                  getTheAppointmentSlotChips(context),
                  getTheAppointmentSlotChips(context),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const PatientProfileScreen();
                  },
                ),
              );
            },
            child: Text(
              'Schedule an Appointment',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          )
        ],
      ),
    );
  }
}
