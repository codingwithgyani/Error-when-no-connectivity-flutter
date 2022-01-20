import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'connectivity_provider.dart';
import 'no_internet.dart';
class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ConnectivityProvider>(context, listen: false).startMonitoring();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageUI(context),
    );
  }
  Widget pageUI(context) {
    return Consumer<ConnectivityProvider>(
      builder: (consumerContext, model, child) {
        print(model.isOnline);
        if (model.isOnline == true) {
       return   SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              height: MediaQuery
                  .of(consumerContext)
                  .size
                  .height,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.shade200,
                      offset: Offset(2, 4),
                      blurRadius: 5,
                      spreadRadius: 2)
                ],
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xffE6E6E6),
                    Color(0xff14279B),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Shows Error When No Internet Conectivity' ,
                      style: GoogleFonts.portLligatSans(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                 



                ],
              ),
            ),
          );
        } else {
          return NoInternet();
        }
        return Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
