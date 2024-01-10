import 'package:flutter/material.dart';
import 'package:matrix/screens/guest/sms.dart';

class SolutionsScreen extends StatefulWidget {
  const SolutionsScreen({super.key});

  @override
  State<SolutionsScreen> createState() => _SolutionsScreenState();
}

class _SolutionsScreenState extends State<SolutionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text(
          'Solutions & Services',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {
              debugPrint('Actions');
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('images/SMART HOTEL.jpeg'),
            Divider(
              color: Colors.green,
            ),
            Image.asset('images/VIDEO CONFERENCE.JPG'),
            Divider(
              color: Colors.green,
            ),
            Text(
                '     It is an online technology that allows users in different locations to hold face-to-face meetings without having to move to a single location together.\n     This technology is particularly convenient for business users in different cities or even different countries because its saves time, expenses, and hassles associated with business travel.\n Meetings are often more effective over video call and can be held at any time. Due to this, it enables companies to make decisions within smaller time frames solving urgent problems more quickly and also enabling companies to react to market changes faster.'),
            Image.asset('images/VIDEO SURVEILLANCE.JPG'),
            Divider(
              color: Colors.green,
            ),
            Text(
                '     Video surveillance consists of monitoring a place from a distance, thanks to the help of surveillance cameras. There are different types of devices allowing video surveillance: position and state sensors that detect movement or a change of state, sound sensors or image sensors.\n     In these different cases, the signals emitted by the system all end up in the video surveillance center which then analyzes the information retrieved and determine the risks accordingly and provide an appropriate solution. '),
            Image.asset('images/INTERNET.JPG'),
            Divider(
              color: Colors.green,
            ),
            Text(
                '     With the help of the technology WIMAX, MATRIX TELECOMS offers a powerful connection at very high speed. \n     They offer their customers internet services such as connection sharing used to distribute the internet connection to several workstations within the client companies thanks to Ethernet cables of the RJ45 type or even by wireless fidelity, and also by the interconnection of sites used to put network computers in order to facilitate teamwork and improve the speed of exchanges in the client companies.'),
            Image.asset('images/VPN.JPG'),
            Divider(
              color: Colors.green,
            ),
            Text(
                '     VPN stands for virtual private network and describes the opportunity to establish a protected network connection when using public networks. VPNs encrypt your internet traffic and disguise your online identity and this makes it more difficult for third parties to track your activities online and steal data.\n      A VPN hides your IP address by letting the network redirect it through a specially configured remote server run by a VPN host. This means that when you surf online with a VPN, the VPN server becomes the source of your data making your ISP and third parties to not see the website you visit or what data you send and receive online.'),
            Image.asset('images/MPLS.JPG'),
            Divider(
              color: Colors.green,
            ),
            Text(
                '     Multiprotocol label switching is a mechanism for routing traffic within a telecommunication network as data travels from one network node to the next.\n     MPLS can provide applications including VPN, Traffic Engineering, and Quality of service.'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return MessageScreen();
                    },
                  ),
                );
              },
              child: Text(
                'send a message'.toUpperCase(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
