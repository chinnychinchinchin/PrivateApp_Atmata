import 'package:flutter/material.dart';
import 'workstation.dart';
import 'trajectory_pool_page.dart';
import 'joystick_instructions_page.dart';
import 'virtual_joystick_instructions_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.cyan[800]!,
        colorScheme: ColorScheme.dark(
          primary: Colors.cyan[800]!,
          secondary: Colors.cyan[800]!,
        ),
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          _buildPage(
            context,
            'App Navigation',
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSectionHeader(context, 'Control Modes'),
                  _buildNavigationTile(
                    context,
                    icon: Icons.settings,
                    title: 'Access Control Modes',
                    subtitle: 'Click the gear icon at the top left-hand side of the screen to access the control modes.',
                  ),
                  _buildNavigationTile(
                    context,
                    icon: Icons.settings_applications,
                    title: 'Pre-programmed Control',
                    subtitle: 'Access various pre-programmed control modes.',
                  ),
                  _buildNavigationTile(
                    context,
                    icon: Icons.videogame_asset,
                    title: 'Manual Control',
                    subtitle: 'Control manually using the joystick.',
                  ),
                  _buildNavigationTile(
                    context,
                    icon: Icons.repeat,
                    title: 'Repeat Camera Motion',
                    subtitle: 'Access, view, and deploy trajectories from saved camera motions.',
                  ),
                  SizedBox(height: 20),
                  _buildSectionHeader(context, 'Real-Time Stats'),
                  _buildNavigationTile(
                    context,
                    icon: Icons.bar_chart,
                    title: 'View Real-Time Stats',
                    subtitle: 'Click on the icon at the top right-hand side of the screen to view real-time stats.',
                  ),
                  SizedBox(height: 20),
                  _buildSectionHeader(context, 'App Drawer'),
                  _buildNavigationTile(
                    context,
                    icon: Icons.menu,
                    title: 'Access App Drawer',
                    subtitle: 'Click the top-left pancake stack icon to access:',
                  ),
                  _buildNavigationTile(
                    context,
                    icon: Icons.person,
                    title: 'Profile',
                    subtitle: 'View and edit your profile.',
                  ),
                  _buildNavigationTile(
                    context,
                    icon: Icons.question_answer,
                    title: 'Tutorial & FAQs',
                    subtitle: 'Access tutorials and FAQs.',
                  ),
                  _buildNavigationTile(
                    context,
                    icon: Icons.contact_mail,
                    title: 'Contact Us',
                    subtitle: 'Get in touch with us.',
                  ),
                  _buildNavigationTile(
                    context,
                    icon: Icons.logout,
                    title: 'Log Out',
                    subtitle: 'Log out from the app.',
                  ),
                  SizedBox(height: 20),
                  _buildSectionHeader(context, 'Quick Controls'),
                  _buildNavigationTile(
                    context,
                    icon: Icons.swipe,
                    title: 'Quick Controls',
                    subtitle: 'Swipe up from the bottom of the screen to access quick controls. Swipe down to dismiss. These controls are available only when the shot is in progress.',
                  ),
                  SizedBox(height: 20),
                  _buildSectionHeader(context, 'Help'),
                  _buildNavigationTile(
                    context,
                    icon: Icons.help,
                    title: 'Help',
                    subtitle: 'Click on the icon at the bottom right-hand side of the screen to access help and navigation instructions.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => WorkstationPage()));
        },
        child: Icon(Icons.check),
      ),
    );
  }

  Widget _buildPage(BuildContext context, String title, Widget content) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Expanded(child: content),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.cyan[800],
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildNavigationTile(BuildContext context,
      {required IconData icon, required String title, required String subtitle}) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: Icon(icon, color: Colors.cyan[800]),
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
      ),
    );
  }
}
