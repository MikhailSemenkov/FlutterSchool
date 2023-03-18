import 'package:flutter/material.dart';

class SettingsDrawer extends StatelessWidget {
  const SettingsDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        children: [
          const _TopBar(),
          Container(
            padding: const EdgeInsets.all(20),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ProfileBar(),
                _SettingsSubmenuTitle(title: 'Account'),
                _SettingsMenuItem(
                  title: 'Premium plan',
                  description: 'View your plan',
                ),
                _SettingsMenuItem(
                  title: 'Email',
                  description: 'email@example.com',
                ),
                _SettingsSubmenuTitle(title: 'Data saver'),
                _SettingMenuItemWithToggle(
                  title: 'Audio Quality',
                  description:
                      'Sets your audio quality to low (equivalent to 24kbit/s) and disables artist canvases.',
                ),
                _SettingsSubmenuTitle(title: 'Video Podcasts'),
                _SettingMenuItemWithToggle(
                  title: 'Download audio only',
                  description: 'Save video podcasts as audio only.',
                ),
                _SettingMenuItemWithToggle(
                  title: 'Stream audio only',
                  description:
                      'Play video podcasts as audio only when not on WiFi.',
                ),
                _SettingsSubmenuTitle(title: 'Playback'),
                _SettingMenuItemWithToggle(
                  title: 'Offline mode',
                  description:
                      'When you go offline, you`ll only be able to play the music and podcasts you`ve downloaded.',
                ),
                _SettingsMenuItem(
                  title: 'Crossfade',
                  description: 'Allows you to crossfade between songs',
                ),
                MySlider(),
                _SettingMenuItemWithToggle(
                  title: 'Allow Explicit Content',
                  description: 'Turn on to play explicit content.',
                ),
                _SettingMenuItemWithToggle(
                  title: 'Show unplayable songs',
                  description: 'Show songs that are unplayable.',
                ),
                _SettingMenuItemWithToggle(
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

class _TopBar extends StatelessWidget {
  const _TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(color: Color(0xff333333)),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Settings',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileBar extends StatelessWidget {
  const _ProfileBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.tealAccent),
            ),
            const Text(
              'U',
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
          ],
        ),
        const SizedBox(width: 10),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'User',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'View Profile',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
        const Expanded(child: SizedBox()),
        IconButton(
          highlightColor: Colors.grey,
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_forward_ios,
            size: 10,
          ),
        ),
      ],
    );
  }
}

class _SettingsSubmenuTitle extends StatelessWidget {
  const _SettingsSubmenuTitle({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _SettingsMenuItem extends StatelessWidget {
  const _SettingsMenuItem({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
        overlayColor: MaterialStatePropertyAll(Colors.transparent),
        padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 0,
          ),
        ),
      ),
      onPressed: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          Text(
            description,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _SettingMenuItemWithToggle extends StatefulWidget {
  const _SettingMenuItemWithToggle(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  final String title;
  final String description;

  @override
  State<_SettingMenuItemWithToggle> createState() =>
      _SettingMenuItemWithToggleState();
}

class _SettingMenuItemWithToggleState
    extends State<_SettingMenuItemWithToggle> {
  bool light = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                Text(
                  widget.description,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Switch(
            value: light,
            onChanged: (value) {
              setState(() {
                light = value;
              });
            },
            activeColor: Colors.green,
          )
        ],
      ),
    );
  }
}

class MySlider extends StatefulWidget {
  const MySlider({Key? key}) : super(key: key);

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  double sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Off'),
        Slider(
          min: 0,
          max: 12,
          activeColor: Colors.green,
          inactiveColor: Colors.grey,
          thumbColor: Colors.green,
          value: sliderValue,
          onChanged: (double value) {
            setState(() {
              sliderValue = value;
            });
          },
        ),
        const Text('12 s'),
      ],
    );
  }
}
