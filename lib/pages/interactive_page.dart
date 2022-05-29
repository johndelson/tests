import 'package:holedo/includes/page_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:holedo/models/holedoapi/user.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';
import 'package:collection/collection.dart';

import '../cards/holedo_cards.dart';
import '../models/models.dart';

class ProfileHomePage extends StatelessWidget {
  const ProfileHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    if (!appState.isLoggedIn) {
      return PageScaffold(
        title: 'Profiles',
        body: Center(child: Text('Please log in first')),
      );
    }

    return PageScaffold(
      title: 'Profile',
      body: ListView(
        padding: EdgeInsets.all(50),
        children: [
          if (appState.profiles.isEmpty)
            Center(child: Text("You don't have any profiles")),
          for (final profile in appState.profiles)
            CustomCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profile.fullName as String,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text('Share: ${profile.slug}'),
                ],
              ),
              onTap: () {
                Routemaster.of(context).push(profile.slug as String);
              },
            ),
          SizedBox(height: 50),
          Center(
            child: ElevatedButton(
              onPressed: () => Routemaster.of(context).push('add'),
              child: Text('Add a new profile'),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final String? id;

  const ProfilePage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final wishList = appState.profiles.firstWhereOrNull(
      (list) => list.id == id,
    );
    final books = HoledoDatabase().books;

    if (wishList == null) {
      return PageScaffold(
        title: 'Profile',
        body: ListView(
          children: [Text("No profile with ID '$id'")],
        ),
      );
    }

    return PageScaffold(
      title: 'Profile',
      body: ListView(
        children: [
          Text(
            'Profile ${wishList.fullName}',
            style: Theme.of(context).textTheme.headline4,
          ),
          Text('Share this profile! ${wishList.slug}'),
          //for (final bookId in wishList.ids)
          // BookCard(
          //   book: books.firstWhere((book) => book.id == bookId),
          // ),
        ],
      ),
    );
  }
}

class AddProfilePage extends Page<void> {
  @override
  Route<void> createRoute(BuildContext context) {
    return DialogRoute(
      context: context,
      builder: (context) => AddProfileDialog(),
      settings: this,
    );
  }
}

class AddProfileDialog extends StatefulWidget {
  static const nameFieldKey = Key('name-field');

  AddProfileDialog({Key? key}) : super(key: key);

  @override
  _AddProfileDialogState createState() => _AddProfileDialogState();
}

class _AddProfileDialogState extends State<AddProfileDialog> {
  final _titleController = TextEditingController();
  final _pickedBooks = <String>{};

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _bookTapped(String bookId) {
    setState(() {
      if (_pickedBooks.contains(bookId)) {
        _pickedBooks.remove(bookId);
      } else {
        _pickedBooks.add(bookId);
      }
    });
  }

  void _addProfile() {
    final appState = Provider.of<AppState>(context, listen: false);
    appState.addProfile(
      User(
        id: appState.profiles.length + 1,
        firstName: _titleController.text,
        lastName: appState.username,
      ),
    );
    Routemaster.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    if (!appState.isLoggedIn) {
      return Text('Please log in first');
    }

    return Center(
      child: Material(
        color: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        type: MaterialType.card,
        child: SizedBox(
          width: 700,
          height: 500,
          child: Center(
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Add a new profile'),
                ),
                Text('Name'),
                CupertinoTextField(
                  controller: _titleController,
                  key: AddProfileDialog.nameFieldKey,
                ),
                Text('Choose some books'),
                SizedBox(
                  height: 200,
                  child: ListView(
                    children: [
                      Wrap(
                        children: [
                          for (final book in HoledoDatabase().books)
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xfffebd68),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              child: InkWell(
                                onTap: () => _bookTapped(book.id),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (_pickedBooks.contains(book.id))
                                      Icon(Icons.check_circle_outline)
                                    else
                                      Icon(Icons.radio_button_unchecked),
                                    SizedBox(width: 8),
                                    Flexible(child: Text(book.title)),
                                  ],
                                ),
                              ),
                            )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: AnimatedBuilder(
                    animation: _titleController,
                    builder: (_, __) => ElevatedButton(
                      onPressed:
                          _titleController.text.isEmpty || _pickedBooks.isEmpty
                              ? null
                              : _addProfile,
                      child: Text('Add profile'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
