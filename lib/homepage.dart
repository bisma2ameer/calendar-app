import 'package:calendarapp/events.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    int _selectedViewIndex = 0;

    // Labels for the toggle buttons
    final List<String> _viewOptions = ['Month', 'Week', 'Day'];

    void _onDaySelection(DateTime day, DateTime focusedDay) {
      setState(() {
        today = day;
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        leading: IconButton(
          icon: Image.asset('assets/icons/dashboard.png', height: 30,),
          onPressed: () {
            // Open the drawer when the icon is tapped
            Scaffold.of(context).openDrawer();
          },
        ),
      
        // leading: Image.asset('assets/icons/dashboard.png', width: 5,),
        actions: [
          Image.asset(
            'assets/icons/search.png',
            width: 25,
          ),
          const SizedBox(
            width: 40,
          ),
          Image.asset(
            'assets/icons/setting.png',
            width: 25,
          ),
          const SizedBox(
            width: 40,
          ),
          Image.asset(
            'assets/icons/notify.png',
            width: 25,
          ),
          const SizedBox(
            width: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/icons/account.png',
              width: 25,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            const SizedBox(
              height: 60,
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 35),
              leading: Image.asset(
                'assets/icons/dashboard.png',
                height: 30,
              ),
              title: Text(
                "Dashboard",
                style: GoogleFonts.nunito(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 35),
              leading: Image.asset(
                'assets/icons/calendar.png',
                height: 30,
              ),
              title: Text(
                "Calendar",
                style: GoogleFonts.nunito(
                  fontSize: 18,
                ),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 35),
              leading: Image.asset(
                'assets/icons/emial.png',
                height: 30,
              ),
              title: Row(
                children: [
                  Text(
                    "Mail",
                    style: GoogleFonts.nunito(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 120,
                  ),
                  Image.asset(
                    'assets/icons/number-5.png',
                    height: 25,
                  )
                ],
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 35),
              leading: Image.asset(
                'assets/icons/chat.png',
                height: 30,
              ),
              title: Text(
                "Chat",
                style: GoogleFonts.nunito(
                  fontSize: 18,
                ),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 35),
              leading: Image.asset(
                'assets/icons/tasks.png',
                height: 30,
              ),
              title: Text(
                "Tasks",
                style: GoogleFonts.nunito(
                  fontSize: 18,
                ),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 35),
              leading: Image.asset(
                'assets/icons/folder.png',
                height: 30,
              ),
              title: Text(
                "Projects",
                style: GoogleFonts.nunito(
                  fontSize: 18,
                ),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 35),
              leading: Image.asset(
                'assets/icons/file.png',
                height: 30,
              ),
              title: Text(
                "File Manager",
                style: GoogleFonts.nunito(
                  fontSize: 18,
                ),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 35),
              leading: Image.asset(
                'assets/icons/notes.png',
                height: 30,
              ),
              title: Text(
                "Notes",
                style: GoogleFonts.nunito(
                  fontSize: 18,
                ),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 35),
              leading: Image.asset(
                'assets/icons/file.png',
                height: 30,
              ),
              title: Text(
                "Contacts",
                style: GoogleFonts.nunito(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
      endDrawer: const Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Add your widgets here
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Calendar",
                  style: GoogleFonts.nunito(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            20), // Adjust the container's border radius
                        color: Colors.grey[300], // Background color
                    ),
                      child: ToggleButtons(
                        // ignore: sort_child_properties_last
                        children: _viewOptions
                            .map((view) => Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Text(
                                    view,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ))
                            .toList(),
                        isSelected: List.generate(_viewOptions.length,
                            (index) => index == _selectedViewIndex),
                        onPressed: (index) {
                          setState(() {
                            // Update the selected view index
                            _selectedViewIndex = index;
                          });
                        },
                        borderRadius:
                            BorderRadius.circular(20), // Set the border radius to zero
                        borderColor: Colors
                            .transparent,
                          // S
                         // Set the border color to transparent
                      ),
                    ),

                    // Calendar widget based on the selected view
                    if (_selectedViewIndex == 0)
                      const SizedBox(
                        height: 25,
                      ), // Month view
                    Container(
                      padding:
                          EdgeInsets.only(top: 5, bottom: 5, left: 2, right: 2), // Adjust the padding as needed
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            10), // Adjust the radius to control corner roundness
                        color: Colors
                            .white, // You can set the background color here
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TableCalendar(
                        locale: 'en_us',
                        rowHeight: 35,
                        headerStyle: const HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                          titleTextStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold, // Bold the month name
                          ),
                        ),
                        focusedDay: today,
                        onDaySelected: _onDaySelection,
                        availableGestures: AvailableGestures.all,
                        selectedDayPredicate: (day) => isSameDay(day, today),
                        firstDay: DateTime.utc(2000, 01, 01),
                        lastDay: DateTime.utc(2030, 01, 01),
                      ),
                    ),
                    // else if (_selectedViewIndex == 1) // Week view
                    //   Container(
                   
                    //   ),
                    // else if (_selectedViewIndex == 2) // Day view
                    //   Container(
                   
                    //   ),
                  ],
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(14.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Upcoming",
                  style: GoogleFonts.nunito(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            
            Container(padding: const EdgeInsets.all(8),
            height: 300,
            child: UpcomingEventsPage(),
            )
            // Add more widgets as needed
          ],
        ),
      ),
    );
  }
}
