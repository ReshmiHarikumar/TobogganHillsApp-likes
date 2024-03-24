import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:toboggan_hills/src/utils/constants/sizes.dart';
import '../common/hill_model.dart';
import '../details/page.dart';

class ImagesForListing extends StatelessWidget {
  final List<HillSite> hillSites;
  final User user;
  const ImagesForListing({super.key, required this.hillSites, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150, // Adjust the height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hillSites.length,
        itemBuilder: (context, index) {
          return CardItem(site: hillSites[index],user:user);
        },
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final HillSite site;
final User user;
  const CardItem({Key? key, required this.site, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: CustomSizes.spaceBtwItems),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Details(user: user, site: site),
            ),
          );
        },
        child: Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001) // Apply perspective
            ..rotateY(0.1), // Adjust the rotation angle for the 3D effect
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                site.imageUrl,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
