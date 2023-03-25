import 'package:flutter/material.dart';
import 'package:lesson5/navigation_bar/screens/navigation_bar.dart';

import '../widgets/settings_menu_item_widget.dart';
import '../widgets/settings_menu_item_with_toggle_widget.dart';
import '../widgets/settings_profile_bar_widget.dart';
import '../widgets/settings_slider_widget.dart';
import '../widgets/settings_submenu_title_widget.dart';
import '../widgets/settings_top_bar_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key, required Function changeTab})
      : _changeTab = changeTab,
        super(key: key);

  final Function _changeTab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const TopBar(),
      bottomNavigationBar: MyNavigationBar(
          changeTab: (int index) {
            Navigator.pop(context);
            _changeTab(index);
          },
          pageNumber: 0),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileBar(),
                SettingsSubmenuTitle(title: 'Account'),
                SettingsMenuItem(
                  title: 'Premium plan',
                  description: 'View your plan',
                ),
                SettingsMenuItem(
                  title: 'Email',
                  description: 'email@example.com',
                ),
                SettingsSubmenuTitle(title: 'Data saver'),
                SettingMenuItemWithToggle(
                  title: 'Audio Quality',
                  description:
                      'Sets your audio quality to low (equivalent to 24kbit/s) and disables artist canvases.',
                ),
                SettingsSubmenuTitle(title: 'Video Podcasts'),
                SettingMenuItemWithToggle(
                  title: 'Download audio only',
                  description: 'Save video podcasts as audio only.',
                ),
                SettingMenuItemWithToggle(
                  title: 'Stream audio only',
                  description:
                      'Play video podcasts as audio only when not on WiFi.',
                ),
                SettingsSubmenuTitle(title: 'Playback'),
                SettingMenuItemWithToggle(
                  title: 'Offline mode',
                  description:
                      'When you go offline, you`ll only be able to play the music and podcasts you`ve downloaded.',
                ),
                SettingsMenuItem(
                  title: 'Crossfade',
                  description: 'Allows you to crossfade between songs',
                ),
                MySlider(),
                SettingMenuItemWithToggle(
                  title: 'Allow Explicit Content',
                  description: 'Turn on to play explicit content.',
                ),
                SettingMenuItemWithToggle(
                  title: 'Show unplayable songs',
                  description: 'Show songs that are unplayable.',
                ),
                SettingMenuItemWithToggle(
                  title: 'Normalize volume',
                  description: 'Set the same volume level for all tracks.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
