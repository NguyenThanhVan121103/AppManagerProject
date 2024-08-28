import 'package:appmanager/constants/constColor.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spwidget/common_widgets/widget/appbar/appBarWidget.dart';

class AccountLinkPageView extends StatefulWidget {
  const AccountLinkPageView({super.key});

  @override
  State<AccountLinkPageView> createState() => _AccountLinkPageViewState();
}

class _AccountLinkPageViewState extends State<AccountLinkPageView> {
  bool isLightFacebook = true;
  bool isLightGoogle = true;


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
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Facebook"),
                        Switch(value: isLightFacebook,activeColor: MColor.primary, onChanged: (bool value){
                          setState(() {
                            isLightFacebook = !isLightFacebook;
                          });
                        }),
                      ],
                    ),
                  ),
                ),
                Divider(height: 0,),
                Container(
                  padding: EdgeInsets.all(8),
                  color: Colors.white,
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Google"),
                        Switch(value: isLightGoogle,activeColor: MColor.primary, onChanged: (bool value){
                          setState(() {
                            isLightGoogle = !isLightGoogle;
                          });
                        }),
                      ],
                    ),
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
