import 'package:arca/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/icons.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text('Info',
            style: TextStyle(color: Colors.white, fontSize: 20)),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
          splashRadius: 24,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.info,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: info(),
    );
  }
}

Widget info() {
  final _mentors = [
    'Andreu Ibáñez Perales',
    'Victor Carreras',
    'Alejandro Illán Marcos',
    'Pau Francino'
  ];

  /// Property that defines the author email.
  final _authorEmail = 'arturculleres@gmail.com';

  /// Property that defines the author GitHub profile name.
  final _authorGitHub = 'Arturito01';

  /// Property that defines the author LinkedIn profile name.
  final _authorLinkedIn = 'arturculleres';

  /// Property that defines the organization Instagram.
  final _orgInstagram = '_liquidgalaxy';

  /// Property that defines the organization Twitter.
  final _orgTwitter = '_liquidgalaxy';

  /// Property that defines the organization GitHub profile name.
  final _orgGitHub = 'LiquidGalaxyLAB';

  /// Property that defines the organization LinkedIn profile name.
  final _orgLinkedIn = 'google-summer-of-code---liquid-galaxy-project';

  /// Property that defines the organization website URL.
  final _orgWebsite = 'www.liquidgalaxy.eu';

  /// Opens the email app with the given [email] in it.
  void _sendEmail(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri, mode: LaunchMode.externalApplication);
    }
  }

  /// Opens the [account]'s GitHub profile.
  void _openGitHub(String account) async {
    final Uri ghLaunchUri = Uri.https('github.com', '/$account');

    if (await canLaunchUrl(ghLaunchUri)) {
      await launchUrl(ghLaunchUri, mode: LaunchMode.externalApplication);
    }
  }

  /// Opens the [account]'s LinkedIn profile.
  void _openLinkedIn(String account) async {
    final Uri liLaunchUri = Uri.https('linkedin.com', '/$account');

    if (await canLaunchUrl(liLaunchUri)) {
      await launchUrl(liLaunchUri, mode: LaunchMode.externalApplication);
    }
  }

  /// Opens the [account]'s Instagram profile.
  void _openInstagram(String account) async {
    final Uri liLaunchUri = Uri.https('instagram.com', '/$account');

    if (await canLaunchUrl(liLaunchUri)) {
      await launchUrl(liLaunchUri, mode: LaunchMode.externalApplication);
    }
  }

  /// Opens the [account]'s Twitter profile.
  void _openTwitter(String account) async {
    final Uri liLaunchUri = Uri.https('twitter.com', '/$account');

    if (await canLaunchUrl(liLaunchUri)) {
      await launchUrl(liLaunchUri, mode: LaunchMode.externalApplication);
    }
  }

  /// Opens the given [link].
  void _openLink(String link) async {
    final Uri liLaunchUri = Uri.parse(link);

    if (await canLaunchUrl(liLaunchUri)) {
      await launchUrl(liLaunchUri, mode: LaunchMode.externalApplication);
    }
  }

  EdgeInsets _defaultPadding() {
    return const EdgeInsets.only(top: 32);
  }

  /// Builds a [Text] that will be used to show the section [title].
  Text _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white70,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  /// Builds a [Widget] that will be used to render a paragraph according to the
  /// given [text].
  Widget _buildDescriptionParagraph(String text) {
    const tab = '        ';

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        '$tab$text',
        textAlign: TextAlign.justify,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  children: [
                    Container(
                      height: 240,
                      width: 240,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(bottom: 16),
                      child: const Image(
                          image: AssetImage('assets/images/ARCA.png')),
                    ),
                    const Text(
                      'Agro Robot Control App',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: _defaultPadding(),
                child: Column(
                  children: [
                    _buildSectionTitle('Author'),
                    const Text(
                      'Artur Cullerés Cervera',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          iconSize: 30,
                          icon: const Icon(
                            Icons.mail_rounded,
                            color: Colors.white,
                          ),
                          splashRadius: 24,
                          tooltip: _authorEmail,
                          onPressed: () {
                            _sendEmail(_authorEmail);
                          },
                        ),
                        IconButton(
                          iconSize: 30,
                          splashRadius: 24,
                          icon: const Icon(
                            SVT.github,
                            color: Colors.white,
                          ),
                          tooltip: _authorGitHub,
                          onPressed: () {
                            _openGitHub(_authorGitHub);
                          },
                        ),
                        IconButton(
                          iconSize: 30,
                          icon: const Icon(
                            SVT.linkedin_in,
                            color: Colors.white,
                          ),
                          splashRadius: 24,
                          tooltip: _authorLinkedIn,
                          onPressed: () {
                            _openLinkedIn('in/$_authorLinkedIn');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: _defaultPadding(),
                child: Column(
                  children: [
                    _buildSectionTitle('Lleida Liquid Galaxy LAB support'),
                    const Text(
                      'Albert Ricart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          iconSize: 30,
                          icon: const Icon(
                            Icons.mail_rounded,
                            color: Colors.white,
                          ),
                          splashRadius: 24,
                          tooltip: 'albertricart2@gmail.com',
                          onPressed: () {
                            _sendEmail('albertricart2@gmail.com');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: _defaultPadding(),
                child: Column(
                  children: [
                    _buildSectionTitle('Mentors'),
                    ..._mentors
                        .map(
                          (mentor) => Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                mentor,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
              Padding(
                padding: _defaultPadding(),
                child: Column(children: [
                  _buildSectionTitle('Organization Contact/Social'),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        iconSize: 30,
                        icon: const Icon(
                          SVT.instagram,
                          color: Colors.white,
                        ),
                        splashRadius: 24,
                        tooltip: '@$_orgInstagram',
                        onPressed: () {
                          _openInstagram(_orgInstagram);
                        },
                      ),
                      IconButton(
                        iconSize: 30,
                        icon: const Icon(
                          SVT.twitter,
                          color: Colors.white,
                        ),
                        splashRadius: 24,
                        tooltip: '@$_orgTwitter',
                        onPressed: () {
                          _openTwitter(_orgTwitter);
                        },
                      ),
                      IconButton(
                        iconSize: 30,
                        splashRadius: 24,
                        icon: const Icon(
                          SVT.github,
                          color: Colors.white,
                        ),
                        tooltip: _orgGitHub,
                        onPressed: () {
                          _openGitHub(_orgGitHub);
                        },
                      ),
                      IconButton(
                        iconSize: 30,
                        icon: const Icon(
                          SVT.linkedin_in,
                          color: Colors.white,
                        ),
                        splashRadius: 24,
                        tooltip:
                            'Liquid Galaxy Project (Google Summer of Code)',
                        onPressed: () {
                          _openLinkedIn('company/$_orgLinkedIn');
                        },
                      ),
                      IconButton(
                        iconSize: 30,
                        icon: const Icon(
                          Icons.language_rounded,
                          color: Colors.white,
                        ),
                        splashRadius: 24,
                        tooltip: _orgWebsite,
                        onPressed: () {
                          _openLink('https://$_orgWebsite');
                        },
                      ),
                      IconButton(
                        iconSize: 24,
                        icon: const Icon(
                          SVT.google_play,
                          color: Colors.white,
                        ),
                        splashRadius: 24,
                        tooltip: 'Liquid Galaxy LAB',
                        onPressed: () {
                          _openLink(
                              'https://play.google.com/store/apps/developer?id=Liquid+Galaxy+LAB');
                        },
                      ),
                    ],
                  ),
                ]),
              ),
              Padding(
                padding: _defaultPadding(),
                child: Column(children: [
                  _buildSectionTitle('Logos'),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      left: 30,
                      right: 32,
                    ),
                    padding: const EdgeInsets.all(16),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 5,
                        color: Colors.grey.shade600,
                      ),
                      color: Colors.white,
                    ),
                    child: const Image(
                        image: AssetImage('assets/images/logos.png')),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32, left: 20, right: 20),
                child: Column(children: [
                  _buildSectionTitle('Project description'),
                  _buildDescriptionParagraph("ARCA is a dashboard application that allows better control of their fields, to all farmers who want to take their business to a more technological environment."),
                  _buildDescriptionParagraph("The data is visible both into the application and into the Google Earth (running on the Liquid Galaxy rig) as placemarks, polygons, ballons and more")
                ]),
              ),
              SizedBox(
                height: defaultPadding * 5,
              )
            ],
          ),
        ),
      ),
    ],
  );
}
