import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson7/navigation_bar/bloc/navigation_bloc.dart';
import 'package:lesson7/navigation_bar/bloc/navigation_event.dart';
import 'package:lesson7/navigation_bar/screens/navigation_bar.dart';
import 'package:lesson7/theme/bloc/theme_bloc.dart';

import '../widgets/settings_menu_item_widget.dart';
import '../widgets/settings_menu_item_with_toggle_widget.dart';
import '../widgets/settings_profile_bar_widget.dart';
import '../widgets/settings_slider_widget.dart';
import '../widgets/settings_submenu_title_widget.dart';
import '../widgets/settings_top_bar_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NavigationBloc>(context)
        .add(NavigationInactiveTabEvent(tabNumber: 0));
    return Scaffold(
      appBar: const TopBar(),
      bottomNavigationBar: const MyNavigationBar(),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProfileBar(),
                const SettingsSubmenuTitle(title: 'Account'),
                const SettingsMenuItem(
                  title: 'Premium plan',
                  description: 'View your plan',
                ),
                const SettingsMenuItem(
                  title: 'Email',
                  description: 'email@example.com',
                ),
                const SettingsSubmenuTitle(title: 'Theme'),
                SettingMenuItemWithToggle(
                  title: 'Use Light Theme',
                  description: 'Turn on to change interface theme to Light.',
                  isOn: !context.watch<ThemeBloc>().state.isDark,
                  onSwitch: () {
                    BlocProvider.of<ThemeBloc>(context).add(ChangeThemeEvent());
                  },
                ),
                const SettingsSubmenuTitle(title: 'Data saver'),
                SettingMenuItemWithToggle(
                  title: 'Audio Quality',
                  description:
                      'Sets your audio quality to low (equivalent to 24kbit/s) and disables artist canvases.',
                  isOn: false,
                  onSwitch: () {},
                ),
                const SettingsSubmenuTitle(title: 'Video Podcasts'),
                SettingMenuItemWithToggle(
                  title: 'Download audio only',
                  description: 'Save video podcasts as audio only.',
                  isOn: false,
                  onSwitch: () {},
                ),
                SettingMenuItemWithToggle(
                  title: 'Stream audio only',
                  description:
                      'Play video podcasts as audio only when not on WiFi.',
                  isOn: false,
                  onSwitch: () {},
                ),
                const SettingsSubmenuTitle(title: 'Playback'),
                SettingMenuItemWithToggle(
                  title: 'Offline mode',
                  description:
                      'When you go offline, you`ll only be able to play the music and podcasts you`ve downloaded.',
                  isOn: false,
                  onSwitch: () {},
                ),
                const SettingsMenuItem(
                  title: 'Crossfade',
                  description: 'Allows you to crossfade between songs',
                ),
                const MySlider(),
                SettingMenuItemWithToggle(
                  title: 'Allow Explicit Content',
                  description: 'Turn on to play explicit content.',
                  isOn: false,
                  onSwitch: () {},
                ),
                SettingMenuItemWithToggle(
                  title: 'Show unplayable songs',
                  description: 'Show songs that are unplayable.',
                  isOn: false,
                  onSwitch: () {},
                ),
                SettingMenuItemWithToggle(
                  title: 'Normalize volume',
                  description: 'Set the same volume level for all tracks.',
                  isOn: false,
                  onSwitch: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
