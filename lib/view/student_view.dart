import 'package:batch34_b/model/student.dart';
import 'package:batch34_b/view/output_view.dart';
import 'package:flutter/material.dart';

class StudentView extends StatefulWidget {
  const StudentView({super.key});

  @override
  State<StudentView> createState() => _StudentViewState();
}

class _StudentViewState extends State<StudentView> {
  final lstCity = [
    DropdownMenuItem(value: "Kathmandu", child: Text("Kathmandu")),
    DropdownMenuItem(value: "Bhaktapur", child: Text("Bhaktapur")),
    DropdownMenuItem(value: "Lalitpur", child: Text("Lalitpur")),
  ];

  final List<Student> lstStudent = [];
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();

  String? selectedCity;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Student View"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: fnameController,
                decoration: const InputDecoration(
                  labelText: "First Name",
                  hintText: "Enter your first name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your first name";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: lnameController,
                decoration: const InputDecoration(
                  labelText: "Last Name",
                  hintText: "Enter your last name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your last name";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Select City",
                  hintText: "Select your city",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
                value: selectedCity,
                items: lstCity,

                onChanged: (value) {
                  setState(() {
                    selectedCity = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return "Please select your city";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[100],
                  padding: const EdgeInsets.all(15),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    lstStudent.add(
                      Student(
                        fname: fnameController.text,
                        lname: lnameController.text,
                        city: selectedCity!,
                      ),
                    );
                    // Refresh the form fields
                    setState(() {});
                  }
                },
                child: const Text("Submit"),
              ),
              const SizedBox(height: 10),
              lstCity.isEmpty
                  ? const Text("No data found")
                  : Expanded(
                    child: ListView.separated(
                      separatorBuilder:
                          (context, index) => const Divider(
                            color: Colors.black,
                            height: 2,
                            thickness: 1,
                          ),
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(8),
                      scrollDirection: Axis.vertical,
                      itemCount: lstStudent.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            "${lstStudent[index].fname} ${lstStudent[index].lname}",
                          ),
                          subtitle: Text(lstStudent[index].city),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                lstStudent.removeAt(index);
                              });
                            },
                          ),

                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        OutputView(student: lstStudent[index]),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
