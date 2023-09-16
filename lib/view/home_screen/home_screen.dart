import 'package:blood_donation_app/controller/donor_provider.dart';
import 'package:blood_donation_app/controller/internetconnectivity_provider.dart';
import 'package:blood_donation_app/helpers.dart/colors.dart';
import 'package:blood_donation_app/widgets/appbar_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: appBackgroundColor,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppBarWidget(
              title: "Donors List",
            )),
        floatingActionButton: floatingActionButton(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Consumer<DonorProvider>(
          builder: (context, provider, child) {
            if (provider.donors.isEmpty) {
              Provider.of<InternetConnectivityProvider>(context, listen: false)
                  .getInternetConnectivity(context);
              provider.fetchDonors();
              return const Center(child: Text('no data'));
            }
            return ListView.builder(
              itemCount: provider.donors.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot donorSnap =
                    provider.donors[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: size.height * 0.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kWhiteColor,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            spreadRadius: 5)
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CircleAvatar(
                            backgroundColor: kRedColor,
                            radius: 30,
                            child: Text(
                              donorSnap['group'],
                              style: const TextStyle(
                                  color: kWhiteColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              donorSnap['name'],
                              style: const TextStyle(
                                  color: kRedColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              donorSnap['phone'].toString(),
                              style: TextStyle(
                                  color: kRedColor,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/UpdateScreen',
                                    arguments: {
                                      'name': donorSnap['name'],
                                      'phone': donorSnap['phone'].toString(),
                                      'group': donorSnap['group'],
                                      'id': donorSnap.id
                                    });
                              },
                              icon: const Icon(Icons.edit),
                              iconSize: 25,
                              color: kRedColor,
                            ),
                            IconButton(
                              onPressed: () {
                                provider.deleteDonor(donorSnap.id);
                              },
                              icon: const Icon(Icons.delete),
                              iconSize: 25,
                              color: kRedColor,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  FloatingActionButton floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, '/AddScreen');
      },
      backgroundColor: kWhiteColor,
      shape: const CircleBorder(),
      child: const Icon(
        Icons.bloodtype,
        size: 40,
        color: appBackgroundColor,
      ),
    );
  }
}
