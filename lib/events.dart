import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpcomingEventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulated list of upcoming events
    List<Map<String, dynamic>> upcomingEvents = [
      {
        'time': '7:00 PM - 7:30 PM',
        'eventName': 'Soccer Practice    ',
        'icon': 'assets/icons/p1.png',
        'icon1': 'assets/icons/p2.png',
      },
      {
        'time': '7:30 PM - 8:00 PM',
        'eventName': 'Grocery Shopping',
        'icon': 'assets/icons/p2.png',
        'icon1': 'assets/icons/p3.png',
      },
      {
        'time': '8:00 PM - 8:30 PM',
        'eventName': 'Meeting                 ',
        'icon': 'assets/icons/p3.png',
        'icon1': 'assets/icons/p2.png',
      },
      // Add more time slots and events as needed
    ];

    return Scaffold(
      body: ListView.builder(
        itemCount: upcomingEvents.length,
        itemBuilder: (context, index) {
          final timeSlot = upcomingEvents[index]['time'];
          final eventName = upcomingEvents[index]['eventName'];
          final iconPath = upcomingEvents[index]['icon'];
          final icon1Path = upcomingEvents[index]['icon1'];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    20), // Adjust the container's border radius
                color: Colors.grey[300], // Background color
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Shadow color
                    spreadRadius: 2, // Spread radius
                    blurRadius: 5, // Blur radius
                    offset: Offset(0, 3), // Offset in the x, y direction
                  ),
                ],
              ),
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      timeSlot,
                      style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(eventName,
                        style: GoogleFonts.nunito(
                    ),),
                        SizedBox(
                          width: 85,
                        ),
                        Image.asset(
                          iconPath,
                          height: 30,
                        ),
                        SizedBox(width: 5),
                        Image.asset(
                          icon1Path,
                          height: 30,
                        ),
                      ],
                    ),
                  ],
                ),
                onTap: () {
                  // Handle event tap action
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
