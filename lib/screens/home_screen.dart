import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_manager/components/constants.dart';
import 'package:password_manager/controllers/pswd_controller.dart';
import 'package:password_manager/screens/add_password.dart';
import 'package:password_manager/components/icon_map.dart' as CustomIcon;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController rController;

  @override
  void initState() {
    super.initState();

    rController = new TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    rController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pswdControllerP = Get.find<PswdController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(KBackgroundColors),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
                Text(
                  'Passwordz',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.to(AddPassword());
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            TabBar(
              isScrollable: true,
              controller: rController,
              indicatorColor: Colors.white,
              tabs: <Widget>[
                TabButtons('Collection'),
                TabButtons('Shop'),
                TabButtons('Recommend'),
                TabButtons('Activity'),
                TabButtons('Fashion'),
              ],
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: GetBuilder(
                builder: (PswdController pswdController) {
                  return ListView.builder(
                    itemCount: pswdController.passwords.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onLongPress: () {
                          pswdControllerP
                              .deletePassword(pswdController.passwords[index]);
                        },
                        leading: Image(
                          image: CustomIcon.icons[
                                  pswdController.passwords[index].appName] ??
                              AssetImage('assets/images/lock2.png'),
                          height: 40.0,
                        ),
                        title: Text(
                          pswdController.passwords[index].appName,
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          pswdController.passwords[index].uname,
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.copy_all,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            pswdControllerP
                                .copyPassword(pswdController.passwords[index]);
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabButtons extends StatelessWidget {
  final String _text;
  const TabButtons(this._text);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        _text,
        style: TextStyle(
          fontSize: 15.0,
          color: Color(0xFFCECECE),
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
