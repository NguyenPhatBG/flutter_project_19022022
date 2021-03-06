import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:project_19022022/controllers/home_controller.dart';
import 'package:project_19022022/controllers/stream/counter_stream.dart';
import 'package:project_19022022/shared/app_colors.dart';
import 'package:project_19022022/shared/app_constants.dart';

final homeNotifierProvider = ChangeNotifierProvider<HomeController>((ref) {
  return HomeController();
});

class HomeModule extends ConsumerWidget {
  const HomeModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CounterStream myStream = CounterStream();
    final homeChangeNotifier = ref.watch(homeNotifierProvider);
    final userLength = homeChangeNotifier.users.data.length;
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.primary,
              ),
              child: Text(
                'Drawer Header',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white),
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Item 3'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Item 4'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Item 5'),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
        ),
        title: StreamBuilder(
          stream: myStream.counterStream,
          builder: (context, snapshot) => Text(
            snapshot.hasData
                ? 'Stream Counter Data: ${snapshot.data.toString()}'
                : "List Of Users ($userLength)",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white),
          ),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.kPadding / 2),
        child: ListView.builder(
          itemCount: userLength,
          itemBuilder: (BuildContext context, int index) {
            if (homeChangeNotifier.users.data.isEmpty) {
              return const CircularProgressIndicator();
            }
            return Column(
              children: [
                const SizedBox(height: 10),
                Card(
                  elevation: 3,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        homeChangeNotifier.users.data[index].avatar,
                      ),
                    ),
                    title: Text(
                      '${homeChangeNotifier.users.data[index].first_name} ${homeChangeNotifier.users.data[index].last_name}',
                    ),
                    subtitle: Text(homeChangeNotifier.users.data[index].email),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                    onTap: () {
                      homeChangeNotifier.requestToUserDetail(
                        context,
                        homeChangeNotifier.users.data[index].id,
                        homeChangeNotifier.users,
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myStream.increase();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
