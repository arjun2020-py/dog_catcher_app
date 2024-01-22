import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dog_catcher_app/utils/custom_color/custom_color.dart';
import 'package:dog_catcher_app/utils/custom_font_family/custom_font_family.dart';
import 'package:dog_catcher_app/utils/custom_widget/dog_catcher_divder_widget.dart';
import 'package:dog_catcher_app/utils/custom_widget/dog_catcher_text_widget.dart';
import 'package:dog_catcher_app/utils/custom_widget/dog_cather_sizedbox_widget.dart';
import 'package:dog_catcher_app/utils/interlization/interlization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/custom_images/custom_images.dart';
import '../compoents/custom_list_tile.dart';

class ScreenDetailedHome extends StatelessWidget {
  ScreenDetailedHome({super.key, required this.id}) {
    _reference =
        FirebaseFirestore.instance.collection('report_dog_list').doc(id);
    _futureData = _reference.get();
  }

  final String id;
  late DocumentReference _reference;
//_reffernce.get() --> returns Future<DocumentSnapShot>
//_reffernce.snapshot() --> stream<DocumentSnapShot>

  late Future<DocumentSnapshot> _futureData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor().appMainColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CustomColor().appTenaryColor,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios_new)),
        title: DogCatcherTextWIdget(
            text: LocalName.dogDetails.tr,
            color: CustomColor().appBlackColor,
            fontSize: 25,
            fontFamily: CustomFontFamily().PoppinsFamily,
            fontWeight: FontWeight.w700),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: FutureBuilder(
        future: _futureData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Some error is occured ${snapshot.error}'),
            );
          }
          if (snapshot.hasData) {
            //Get the data.
            DocumentSnapshot documentSnapshot = snapshot.data;
            Map data = documentSnapshot.data() as Map;

            //display the data.
            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                      backgroundColor: CustomColor().appWhiteColor,
                      radius: 40,
                      child: Image.asset(
                        CustomImages().profileImage,
                        width: 100,
                      )),
                  title: DogCatcherTextWIdget(
                      text: 'John smith',
                      color: CustomColor().appBlackColor,
                      fontSize: 20,
                      fontFamily: CustomFontFamily().PoppinsFamily,
                      fontWeight: FontWeight.w700),
                  subtitle: DogCatcherTextWIdget(
                      text: 'john@gmail.com',
                      color: CustomColor().appBlackColor,
                      fontSize: 18,
                      fontFamily: CustomFontFamily().PoppinsFamily,
                      fontWeight: FontWeight.w300),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    children: [
                      Stack(alignment: Alignment.topRight, children: [
                        Image.network(data['image']),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite,
                            color: CustomColor().appGreenColor,
                          ),
                        ),
                      ]),
                      verticalSizedBox(10),
                      Row(
                        children: [
                          DogCatcherTextWIdget(
                              text: data['name'],
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
                                        color: CustomColor().appBlackColor)),
                                TextSpan(
                                    text: 'm',
                                    style: TextStyle(
                                        color: CustomColor().appBlackColor))
                              ])),
                            )
                          ])
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    DogCatcherDivderWidget(),
                    CustomListTileWidget(
                      icons: Icons.location_on,
                      title: LocalName.location.tr,
                      subTitle: data['location'],
                    ),
                    DogCatcherDivderWidget(),
                    CustomListTileWidget(
                      icons: Icons.saved_search,
                      title: LocalName.gender.tr,
                      subTitle: data['gender'],
                      tralingIconColor: CustomColor().appTransparntColor,
                    ),
                    DogCatcherDivderWidget(),
                    CustomListTileWidget(
                      icons: Icons.speaker_notes,
                      title: LocalName.size.tr,
                      subTitle: 'Medium',
                      tralingIconColor: CustomColor().appTransparntColor,
                    ),
                    DogCatcherDivderWidget(),
                    CustomListTileWidget(
                      icons: Icons.file_open,
                      title: LocalName.note.tr,
                      subTitle:
                          data['add_note'],
                      tralingIconColor: CustomColor().appTransparntColor,
                    )
                  ],
                )
              ],
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
