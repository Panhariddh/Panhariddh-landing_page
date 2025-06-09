import 'package:flutter/material.dart';


import '../models/student.dart';
import '../services/db_helper.dart';
import '../utils/validators.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final DBHelper _dbHelper = DBHelper();

  List<Student> _students = [];
  Student? _editingStudent;

  // Form controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _classController = TextEditingController();
  final _deptController = TextEditingController();
  String _gender = 'Male';

  @override
  void initState() {
    super.initState();
    _refreshStudentList();
  }

  void _refreshStudentList() async {
    final data = await _dbHelper.getStudents();
    setState(() {
      _students = data;
    });
  }

  void _clearForm() {
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _classController.clear();
    _deptController.clear();
    _gender = 'Male';
    _editingStudent = null;
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final now = DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());
      final newStudent = Student(
        id: _editingStudent?.id,
        name: _nameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        className: _classController.text,
        department: _deptController.text,
        gender: _gender,
        dateRegistered: _editingStudent?.dateRegistered ?? now,
        present: _editingStudent?.present ?? false,
      );

      if (_editingStudent == null) {
        await _dbHelper.insertStudent(newStudent);
      } else {
        await _dbHelper.updateStudent(newStudent);
      }

      _clearForm();
      _refreshStudentList();
    }
  }

  void _editStudent(Student student) {
    setState(() {
      _editingStudent = student;
      _nameController.text = student.name;
      _emailController.text = student.email;
      _phoneController.text = student.phone;
      _classController.text = student.className;
      _deptController.text = student.department;
      _gender = student.gender;
    });
  }

  void _deleteStudent(int id) async {
    await _dbHelper.deleteStudent(id);
    _refreshStudentList();
  }

  void _togglePresence(Student student) async {
    student.present = !student.present;
    await _dbHelper.updateStudent(student);
    _refreshStudentList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Class Manager'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Form
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'Name'),
                      validator: (value) =>
                          Validators.validateNotEmpty(value, 'Name'),
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                      validator: Validators.validateEmail,
                    ),
                    TextFormField(
                      controller: _phoneController,
                      decoration: const InputDecoration(labelText: 'Phone'),
                      keyboardType: TextInputType.phone,
                      validator: Validators.validatePhone,
                    ),
                    TextFormField(
                      controller: _classController,
                      decoration:
                          const InputDecoration(labelText: 'Class Name'),
                      validator: (value) =>
                          Validators.validateNotEmpty(value, 'Class Name'),
                    ),
                    TextFormField(
                      controller: _deptController,
                      decoration:
                          const InputDecoration(labelText: 'Department'),
                      validator: (value) =>
                          Validators.validateNotEmpty(value, 'Department'),
                    ),
                    DropdownButtonFormField<String>(
                      value: _gender,
                      items: const [
                        DropdownMenuItem(value: 'Male', child: Text('Male')),
                        DropdownMenuItem(value: 'Female', child: Text('Female')),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          setState(() => _gender = value);
                        }
                      },
                      decoration: const InputDecoration(labelText: 'Gender'),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _submitForm,
                      child: Text(_editingStudent == null ? 'Add Student' : 'Update Student'),
                    ),
                    if (_editingStudent != null)
                      TextButton(
                        onPressed: () {
                          setState(() => _clearForm());
                        },
                        child: const Text('Cancel Editing'),
                      ),
                  ],
                ),
              ),
              const Divider(height: 30),
              const Text(
                'Student List',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _students.length,
                itemBuilder: (context, index) {
                  final student = _students[index];
                  return Card(
                    child: ListTile(
                      title: Text(student.name),
                      subtitle: Text('${student.email} • ${student.className}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(student.present
                                ? Icons.check_box
                                : Icons.check_box_outline_blank),
                            onPressed: () => _togglePresence(student),
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => _editStudent(student),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => _deleteStudent(student.id!),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}