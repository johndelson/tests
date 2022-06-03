import 'package:flutter/material.dart';
import 'package:holedo/layouts/pages/profile-pages/profile/profile-page.dart';
import 'package:holedo/models/holedoapi/user.dart';
import 'package:holedo/layouts/page_scaffold.dart';

import '../../services/holedo_api_services.dart';

class ProfilePage extends StatefulWidget {
  final String? id;
  final String? slug;

  const ProfilePage({Key? key, this.id, this.slug}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
final  ApiServices _apiServices=ApiServices();

  @override
  Widget build(BuildContext context) {
    // final UsersController controller = Get.put(HoledoDatabase().users);
    return PageScaffold(
      title: "Job Content",
      body: FutureBuilder(
          future:_apiServices.getUserData(id: widget.id,slug: widget.slug),
              // controller.getProfileData(context: context, slug: slug, id: id),
          builder: (context, AsyncSnapshot<User?> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else
              return UserProfilePage(userProfileData: snapshot.data!);

          }),
    );
  }
}
