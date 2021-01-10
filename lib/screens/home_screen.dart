import 'package:flutter/material.dart';
import 'package:flutter_serli/api/user_api.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Serialization'),
      ),
      body: FutureBuilder(
        future: UserApi.getAllUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) => Card(
                elevation: 5,
                child: ListTile(
                  title: Text(snapshot.data[index].name),
                  subtitle: Text(snapshot.data[index].email),
                  trailing: Text(snapshot.data[index].address.street),
                  leading: Text(
                    snapshot.data[index].address.city,
                  ),
                ),
              ),
              itemCount: snapshot.data.length,
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: Text('no data'),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
