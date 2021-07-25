import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ShortcutLinks extends StatelessWidget {
  const ShortcutLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(24, 12, 24, 24),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
                onPressed: () {
                  _launchURL(
                      'https://console.firebase.google.com/u/0/project/malaysia-waktu-solat/config');
                },
                child: const Text('Open MPT Firebase Remote Config')),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  _launchURL('https://www.e-solat.gov.my/');
                },
                child: const Text('Open JAKIM e-solat page')),
          ],
        ),
      ),
    );
  }

  void _launchURL(String link) async => await canLaunch(link)
      ? await launch(link)
      : throw 'Could not launch $link';
}
