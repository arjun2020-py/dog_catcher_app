import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dog_catcher_app/screen/main/home/view/screen_deailed_home.dart';
import 'package:dog_catcher_app/utils/custom_color/custom_color.dart';
import 'package:dog_catcher_app/utils/custom_font_family/custom_font_family.dart';
import 'package:dog_catcher_app/utils/custom_widget/dog_catcher_text_widget.dart';
import 'package:dog_catcher_app/utils/custom_widget/dog_cather_sizedbox_widget.dart';
import 'package:dog_catcher_app/utils/interlization/interlization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/custom_widget/dog_catcher_divder_widget.dart';
import '../../../auth/firebase_auth_implemention/fire_auth_services.dart';
import '../compoents/custom_elev_button.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key}) {
    _stream = _collectionReference.snapshots();
  }
  final FirebaseAuthServices _authServices = FirebaseAuthServices();
  CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('report_dog_list');

  late Stream<QuerySnapshot> _stream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor().appMainColor,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: CustomColor().appTransparntColor,
          title: DogCatcherTextWIdget(
              text: LocalName.dogCatcher.tr,
              color: CustomColor().appBlackColor,
              fontSize: 25,
              fontFamily: CustomFontFamily().PoppinsFamily,
              fontWeight: FontWeight.w700),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: 25,
                  color: CustomColor().appBlackColor,
                )),
            IconButton(
                onPressed: () {
                  _authServices.signOut();
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: _stream,
          builder: (context, snapshot) {
            print('----------------------------r000');
            //check error
            if (snapshot.hasError) {
              return Center(
                child: GetSnackBar(
                  message: 'Some error is occured ${snapshot.error}',
                ),
              );
            }

            //check if data arrived
            if (snapshot.hasData) {
              //get the data
              QuerySnapshot<Object?>? querySnapshot = snapshot.data;
              List<QueryDocumentSnapshot> documents = querySnapshot!.docs;

              //convert the documents to Maps
              List<Map> items = documents.map((e) => {
                'id':e.id,
                'name':e['name'],
                'location':e['location'],
                'add_note':e['add_note'],
                'gender':e['gender'],
                'image':e['image']
              }).toList();

              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  //Get the item at this index
                  Map thisItem = items[index];

                  //Return the widget for the list items
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: InkWell(
                      onTap: () => Get.to(ScreenDetailedHome()),
                                          child: Card(
                        color: CustomColor().appTenaryColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(alignment: Alignment.topRight, children: [
                              thisItem.containsKey('image')
                                  ? Image.network('${thisItem['image']}')
                                  : Image.asset('assets/images/dog .png'),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_border,
                                  color: CustomColor().appGreenColor,
                                ),
                              )
                            ]),
                            Row(
                              children: [
                                DogCatcherTextWIdget(
                                    text: '${thisItem['name']}',
                                    color: CustomColor().appBlackColor,
                                    fontSize: 15,
                                    fontFamily: CustomFontFamily().PoppinsFamily,
                                    fontWeight: FontWeight.w300),
                                horizontalSizedBox(150),
                                Stack(children: [
                                  Icon(Icons.location_on_outlined),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 18),
                                    child: RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: '500',
                                          style: TextStyle(
                                              color:
                                                  CustomColor().appBlackColor)),
                                      TextSpan(
                                          text: 'm',
                                          style: TextStyle(
                                              color: CustomColor().appBlackColor))
                                    ])),
                                  )
                                ])
                              ],
                            ),
                            DogCatcherTextWIdget(
                                text: '${thisItem['gender']}',
                                color: CustomColor().appBlackColor,
                                fontSize: 15,
                                fontFamily: CustomFontFamily().PoppinsFamily,
                                fontWeight: FontWeight.w300),
                            DogCatcherDivderWidget(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomElevButton(
                                  icon: Icons.close,
                                ),
                                horizontalSizedBox(20),
                                CustomElevButton(icon: Icons.favorite)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            //Show loader
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
