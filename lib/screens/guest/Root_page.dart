import 'package:flutter/material.dart';
import 'package:matrix/screens/Guest.dart';
import 'package:matrix/screens/guest/Solutions.dart';
import 'package:matrix/screens/guest/product_page.dart';
import 'package:matrix/screens/services/UserService.dart';


class RPageScreen extends StatefulWidget {
  late final Function(int) onChangedStep;
   

  @override
  State<RPageScreen> createState() => _RPageScreenState();
}

class _RPageScreenState extends State<RPageScreen> {
   final UserService _userService = UserService();
  int currentPage = 0;
  List<Widget> pages = [
    SolutionsScreen(),
    productScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text(
          'About us',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      drawer: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text('fotso aroll'),
                  accountEmail: Text('fotsoaroll@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    child: Image.asset(
                      'images/LOGOmatrix_200x200px.jpg',
                      fit: BoxFit.cover,
                      width: 90,
                      height: 90,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.language_outlined,
                    color: Colors.green,
                  ),
                  title: Text('change language'),
                ),
                ListTile(
                  leading: Icon(
                    Icons.notifications,
                    color: Colors.green,
                  ),
                  title: Text('Request'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.green,
                  ),
                  title: Text('Settings'),
                  onTap: () => null,
                ),
                Divider(),
                ListTile(
            title: Text('Logout'),
            leading: Icon(Icons.exit_to_app),
            onTap: () async {
              
                    await _userService.logout();

                    // ignore: use_build_context_synchronously
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GuestScreen(),
                      ),
                      (route) => false,
                    );
            }
          ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          bottom: 15.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                        "              MATRIX TELECOMS S.A is an operator working in the networking and telecommunications sector in Cameroon that provides IP based services and solutions. The creation of matrix telecoms resulted from the ambition and idea of its founders, to provide to corporate, private and or public and other international organizations operating in the triangular territory of Cameroon, a dynamic company in the networking and telecommunications sector with technical experience to offer proven and better benefits, based on highly advanced services and support them in their technological improvement. Consequently, with more than 20 years of proven experience in the networking and telecommunication sector in Cameroon, MATRIX TELECOMS S.A is covering all areas of internet services, telephony, data transfer, and other value-added services (VPN, VoIP, videoconferencing, video surveillance etc.).\n                  MATRIX TELECOMS S.A is of the companies of the ICCNET group. Since the creation of ICCNET in 1997, it has followed a course full of buckle and role. Indeed, the history of the enterprise begins in 1997 when the International Computer Center Network (ICCNET) whose activity is to provides Internet access, headed by Clovis TCHOKONTE. Established in Yaoundé, ICCNET will operate in quasi-monopoly situation for approximately nine (9) years. In the middle of the year 2006, the media corroborate the entry of two giants’ firms (competitors) in to sector of networking, MTN and ORANGE, that is today specialized in the distribution of mobile telephony services. Exhaust by the arrival of these giants’ competitors with imposing resources, ICCNET will, in July of the year 2006; merge with two other Internet Service Provider (ISP) known as Douala.com and CREOLINK Communications. This merge will bring up the birth of MATRIX Telecoms in July 2006, headed by Clovis TCHOKONTE with the motto “connecting people, inspiring solutions” place of ICCNET and Douala.com, and Joseph MBOCK in place of CREOLINK Communication.\n "),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const SolutionsScreen();
                    },
                  ),
                );
              },
              child: Text(
                'solutions & services'.toUpperCase(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('floating action button');
        },
        child: const Icon(Icons.message_sharp),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home), label: 'solutions & services'),
          NavigationDestination(
              icon: Icon(Icons.production_quantity_limits), label: 'product'),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
