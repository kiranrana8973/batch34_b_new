import 'package:batch34_b/model/employee.dart';
import 'package:batch34_b/state/employee_state.dart';
import 'package:flutter/material.dart';

class EmployeeView extends StatefulWidget {
  const EmployeeView({super.key});

  @override
  State<EmployeeView> createState() => _EmployeeViewState();
}

class _EmployeeViewState extends State<EmployeeView> {
  final nameController = TextEditingController();
  final photoUrl =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnSA1zygA3rubv-VK0DrVcQ02Po79kJhXo_A&s";
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  String? selectedRole;

  final lstRole = [
    DropdownMenuItem(value: "Admin", child: Text("Admin")),
    DropdownMenuItem(value: "Manager", child: Text("Manager")),
    DropdownMenuItem(value: "Employee", child: Text("Employee")),
  ];

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee App'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  hintText: "Enter your name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: "Phone",
                  hintText: "Enter your phone number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField(
                value: selectedRole,
                items: lstRole,
                onChanged: (value) {
                  setState(() {
                    selectedRole = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: "Role",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Employee employee = Employee(
                      name: nameController.text,
                      email: emailController.text,
                      phone: phoneController.text,
                      role: selectedRole!,
                      photo: photoUrl,
                    );

                    setState(() {
                      EmployeeState.lstEmployee.add(employee);
                    });
                  }
                },
                child: const Text("Submit"),
              ),
              const SizedBox(height: 10),
              Expanded(
                child:
                    EmployeeState.lstEmployee.isEmpty
                        ? const Center(child: Text("No Employee Found"))
                        : ListView.builder(
                          itemCount: EmployeeState.lstEmployee.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  EmployeeState.lstEmployee[index].photo,
                                ),
                              ),
                              title: Text(
                                EmployeeState.lstEmployee[index].name,
                              ),
                              subtitle: Text(
                                EmployeeState.lstEmployee[index].role,
                              ),
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
