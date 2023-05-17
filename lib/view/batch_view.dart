import 'package:flutter/material.dart';
import 'package:studentbatch/model/student.dart';

class BatchView extends StatefulWidget {
  const BatchView({super.key});

  @override
  State<BatchView> createState() => _BatchViewState();
}

class _BatchViewState extends State<BatchView> {
  List<Student>? lstStudents;
  @override
  void didChangeDependencies() {
    lstStudents = ModalRoute.of(context)!.settings.arguments as List<Student>;

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
      ),
      body: ListView.builder(
          itemCount: lstStudents!.length,
          itemBuilder: (context, index) {
            var fname = lstStudents![index].fname!;
            var lname = lstStudents![index].lname!;
            var gender = lstStudents![index].gender!;

            var age = lstStudents![index].age!;
            var batch = lstStudents![index].batch;

            return Column(
              children: [
                GestureDetector(
                  onDoubleTap: () => {
                    Navigator.pushNamed(context, '/Batch',
                        arguments: lstStudents)
                  },
                  child: ListTile(
                    title: Text('Name: $fname $lname'),
                    subtitle: Text('Student Gender: $gender'),
                    trailing: Text('Age: $age, Batch: $batch'),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
