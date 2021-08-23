import 'package:flutter/material.dart';
import 'package:tinder_clone/pages/register_screen_pages/register_screen_pages.dart';
import 'package:tinder_clone/utilities/providers/providers.dart';
import 'package:provider/provider.dart';
class RegisterScreen extends StatefulWidget {
  static const routeName = 'RegisterScreen';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late PageController _controller;
  List<Widget> pages = [
    PhoneRegisterPage(),
    VerificationPage(),
    EmailRegisterPage(),
    TermsAgreementPage(),
    UserInformationPage(),
  ];
  @override
  void initState() {
    super.initState();
    _controller = PageController();
    context.read<GeneralProvider>().registrationProvider.pageController = _controller;
    context.read<GeneralProvider>().registrationProvider.pageCount = pages.length;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black38,
            iconSize: 28,
            onPressed: (){
              bool success = context.read<GeneralProvider>().registrationProvider.previousPage();
              if(!success){
                Navigator.pop(context);
              }
            },
          ),
        ),
        body: PageView(
          controller: _controller,
          physics: NeverScrollableScrollPhysics(),
          children: pages,
        ),
      ),
    );
  }
}
