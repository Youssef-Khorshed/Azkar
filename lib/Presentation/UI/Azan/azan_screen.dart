// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:azkar_application_/Presentation/UI/Azan/loadingList.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:azkar_application_/Presentation/Logic/bloc/azkar_bloc.dart';

class Model {
  String name;
  String time;
  String image;
  Model({
    required this.name,
    required this.time,
    required this.image,
  });
}

class AzanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //initializeSharedPreferences();
    return Scaffold(
      backgroundColor: Colors.transparent,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   actions: [
      //     const Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 8.0),
      //       child: Icon(Icons.notifications_active),
      //     ),
      //     Switch.adaptive(
      //         //activeColor: Color(0xff4b4a26),
      //         value: false,
      //         onChanged: (value) {
      //           // setState(() {
      //           //   isAzanSwitched = value;
      //           //   if (isAzanSwitched) {
      //           //     NotificationServices.schedulePrayerNotifications();
      //           //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //           //         content:
      //           //             Center(child: Text('تم تفعيل اشعارات الآذان'))));
      //           //   } else {
      //           //     NotificationServices.canclePrayerNotifications();
      //           //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //           //         content: Center(
      //           //             child: Text('تم الغاء تفعيل اشعارات الآذان'))));
      //           //   }
      //           // }
      //           // );
      //           // saveAzanSwitcherToSharedPreferences();
      //         }),
      //   ],
      // ),

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            actions: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(Icons.notifications_active),
              ),
              Switch.adaptive(
                  //activeColor: Color(0xff4b4a26),
                  value: false,
                  onChanged: (value) {
                    // setState(() {
                    //   isAzanSwitched = value;
                    //   if (isAzanSwitched) {
                    //     NotificationServices.schedulePrayerNotifications();
                    //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    //         content:
                    //             Center(child: Text('تم تفعيل اشعارات الآذان'))));
                    //   } else {
                    //     NotificationServices.canclePrayerNotifications();
                    //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    //         content: Center(
                    //             child: Text('تم الغاء تفعيل اشعارات الآذان'))));
                    //   }
                    // }
                    // );
                    // saveAzanSwitcherToSharedPreferences();
                  }),
            ],
            backgroundColor: Colors.transparent,
            title: const Text(
              'مواعيد الصلاة',
            ),
            expandedHeight: MediaQuery.of(context).size.height * .34,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * .1),
                child: Image.asset(
                  'assets/images/praying.png',
                  height: MediaQuery.of(context).size.height * .1,
                  width: MediaQuery.of(context).size.width * .2,
                ),
              ),
            ),
          ),
          BlocBuilder<AzkarBloc, AzkarState>(
            builder: (context, state) {
              final bloc = BlocProvider.of<AzkarBloc>(context);

              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(20)),
                      child: AniamtedItem(
                        index: index,
                        itemcount: bloc.timesOfAzan.length,
                        item: CustomAzanTimesWidget(
                          image: bloc.timesOfAzan[index].image,
                          name: bloc.timesOfAzan[index].name,
                          time: bloc.timesOfAzan[index].time,
                        ),
                      ),
                    );
                  },
                  childCount: bloc.timesOfAzan.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CustomAzanTimesWidget extends StatelessWidget {
  const CustomAzanTimesWidget({
    super.key,
    required this.image,
    required this.name,
    required this.time,
  });
  final String image;
  final String name;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
      child: Row(
        children: [
          Text(
            time,
            style: const TextStyle(fontSize: 20, fontFamily: 'Tajawal'),
          ),
          const Spacer(
            flex: 1,
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 20, fontFamily: 'Tajawal'),
          ),
          const SizedBox(
            width: 25,
          ),
          Image.asset(
            image,
            height: MediaQuery.of(context).size.height * .05,
          ),
        ],
      ),
    );
  }
}
