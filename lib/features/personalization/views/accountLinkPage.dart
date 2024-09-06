import 'package:appmanager/classes/selectedAccountLink/localSelectedAccountLink.dart';
import 'package:appmanager/constants/constColor.dart';
import 'package:flutter/material.dart';
import 'package:spwidget/common_widgets/widget/appbar/appBarWidget.dart';

class AccountLinkPageView extends StatefulWidget {
  const AccountLinkPageView({super.key});

  @override
  State<AccountLinkPageView> createState() => _AccountLinkPageViewState();
}

class _AccountLinkPageViewState extends State<AccountLinkPageView> {
  bool? isLightGoogle = LocalSelectedAccountLink.getSelectedGoogle();
  bool? isLightFacebook = LocalSelectedAccountLink.getSelectedFacebook();


  @override
  void initState(){
    super.initState();
    if(isLightFacebook == null){
      LocalSelectedAccountLink.setSelectedFacebook(false);
    }
    if(isLightGoogle == null){
      LocalSelectedAccountLink.setSelectedGoogle(false);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        showBackArrows: true,
        backgroundColor: MColor.primary,
        iconColor: Colors.white,
        title: Text("Account link", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
      ),
      body: Container(
        color: Colors.grey[200],
        child: CustomScrollView(
          slivers: [
            SliverList(delegate: SliverChildListDelegate(
              [
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.all(8),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Facebook"),
                      Switch(value: isLightFacebook!,activeColor: MColor.primary, onChanged: (bool value){
                        setState(() {
                          LocalSelectedAccountLink.setSelectedFacebook(!isLightFacebook!);
                          isLightFacebook = LocalSelectedAccountLink.getSelectedFacebook();
                        });
                      }),
                    ],
                  ),
                ),
                Divider(height: 0,),
                Container(
                  padding: EdgeInsets.all(8),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Google"),
                      Switch(value: isLightGoogle!,activeColor: MColor.primary, onChanged: (bool value){
                        setState(() {
                          LocalSelectedAccountLink.setSelectedGoogle(!isLightGoogle!);
                          isLightGoogle = LocalSelectedAccountLink.getSelectedGoogle();
                        });
                      }),
                    ],
                  ),
                ),

              ]
            ))
          ],
        ),
      ),
    );
  }
}
