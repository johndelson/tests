import 'package:holedo/includes/page_scaffold.dart';
import 'package:flutter/material.dart';

import 'package:holedo/models/holedoapi/job.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:routemaster/routemaster.dart';
import '../cards/holedo_cards.dart';
import '../models/models.dart';

class JobsfrontPage extends StatelessWidget {
  const JobsfrontPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabState = TabPage.of(context);

    return PageScaffold(
      title: 'Jobsfronts',
      body: ListView(
        children: [
          Container(
            color: Color(0xff202f3f),
            height: 70,
            child: TabBar(
              indicatorWeight: 6,
              controller: tabState.controller,
              tabs: [
                Tab(icon: Icon(Icons.list), text: 'All Jobs'),
                Tab(icon: Icon(Icons.star), text: 'Featured'),
              ],
            ),
          ),
          SizedBox(
            height: 500,
            child: TabBarView(
              controller: tabState.controller,
              children: <Widget>[
                PageStackNavigator(stack: tabState.stacks[0]),
                PageStackNavigator(stack: tabState.stacks[1]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class JobsfrontListPage extends StatelessWidget {
  final String mode;

  const JobsfrontListPage({
    Key? key,
    required this.mode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final JobsController controller = Get.put(JobsController());

    return Scaffold(
        body: FutureBuilder(
            future: controller.fetchJobs(type: mode),
            builder: (context, AsyncSnapshot<List<Job>> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else
                return AlignedGridView.count(
                  crossAxisCount: 2,
                  itemCount: snapshot.data!.length,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  itemBuilder: (context, index) {
                    return JobsCard(
                        data: snapshot.data![index], showReleaseDate: true);
                  },

                  //TileBuilder: (index) => StaggeredTile.fit(1),
                );
            }));
  }
}
