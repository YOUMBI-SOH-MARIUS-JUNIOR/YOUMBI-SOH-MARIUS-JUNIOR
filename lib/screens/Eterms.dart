// ignore_for_file: file_names

import 'package:flutter/material.dart';

class EtermScreen extends StatefulWidget {
  final Function(int) onChangedStep;
  const EtermScreen({
    super.key,
    required this.onChangedStep,
  });

  @override
  State<EtermScreen> createState() => _EtermScreenState();
}

class _EtermScreenState extends State<EtermScreen> {
  late ScrollController _scrollController;
  bool _termsReaded = false;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(
      () {
        if (_scrollController.offset >=
                _scrollController.position.maxScrollExtent &&
            !_scrollController.position.outOfRange) {
          setState(() => _termsReaded = true);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: const Text(
            'Terms & Condutions',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () => widget.onChangedStep(0),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            bottom: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                          "These Terms and Conditions constitute a legally binding agreement made between you, whether personally or on behalf of an entity (“you”) and [business entity name] (“we”, “us” or “our”), concerning your access to and use of the [application] application as well as other media form, media channel, mobile websites related, linked, or otherwise connected thereto (collectively, the “App”). You agree that by accessing the Application, you have read, understood, and agree to be bound by all of these Terms and Conditions Use. IF YOU DO NOT AGREE WITH ALL THESE TERMS and CONDITIONS, THEN YOU ARE EXPRESSLY PROHIBITED FROM USING THE APPLICATION AND YOU MUST DISCONTINUE USE IMMEDIATELY.\n       Supplemental terms and conditions or documents that may be posted on the App from time to time are hereby expressly incorporated herein by reference. We reserve the right, in our sole discretion, to make changes or modifications to these Terms and Conditions to any time and for any reasons. We will alert you about any changes by updating the “Last updated” date of these Terms and Conditions and you waive any right to receive specific notice of each such change. It your responsibility to periodically review these Terms and Conditions to stay informed of updates. You will be subjected to, and will be deemed to have been made aware of and to have accepted, the changes in any revised Terms and Conditions by your continued use of the App after the date such revised Terms are posted.\n       The information provided on the Application is not intended for distribution to or use by any person or entity in any jurisdiction or country where such distribution or use would be contrary to law or regulation or which would subject us to any registration within such jurisdiction or country. Accordingly, those persons who chose to access the App from other location do so their own initiative and solely responsibility for compliance with local laws, if and to the extent local laws are applicable.\n       Option 1: The Application is intended for users of at least 18 years old. Persons under the age of 13 are not permitted to register for the Application.\n        Option 2: [The App is intended for users who are at least 13 year of age.] All users who are minors in the jurisdiction in which they reside (generally under the age of 18) must have the permission of, and be directly supervised by, their parent or guardian to use the App. If you are a minor, you must have your parent or guardian read and agree to these Terms of Use."),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: !_termsReaded ? null : () => widget.onChangedStep(4),
                child: Text(
                  'Read & Accepted '.toUpperCase(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
