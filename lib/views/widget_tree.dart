import 'package:flutter/material.dart';
import 'package:fly_booking/data/notifier.dart';
import 'package:fly_booking/views/pages/booking_page.dart';
import 'package:fly_booking/views/pages/home_page.dart';
import 'package:fly_booking/views/pages/profile_page.dart';
import 'package:fly_booking/views/pages/settings_page.dart';

import 'widgets/navbar_widget.dart';

List<Widget> pages = [HomePage(), BookingPage(), ProfilePage(), SettingsPage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return pages.elementAt(selectedPage);
        },
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
