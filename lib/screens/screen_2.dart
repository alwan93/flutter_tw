import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class Screen2 extends StatefulWidget {
  final Map<String, dynamic> data;
  const Screen2({Key? key, required this.data}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final _formKey = GlobalKey<FormBuilderState>();

  final TextEditingController _firstName =
      TextEditingController.fromValue(TextEditingValue.empty);
  final TextEditingController _lastName =
      TextEditingController.fromValue(TextEditingValue.empty);
  final TextEditingController _email =
      TextEditingController.fromValue(TextEditingValue.empty);
  final TextEditingController _phone =
      TextEditingController.fromValue(TextEditingValue.empty);

  Map<dynamic, String> returnData = {
    "id": "",
    "firstName": "",
    "lastName": "",
    "email": "",
    "phone": ""
  };

  @override
  void initState() {
    // TODO: implement initState
    _firstName.text = widget.data['firstName']!;
    _lastName.text = widget.data['lastName']!;
    _email.text = widget.data['email']!;
    _phone.text = widget.data['phone']!;
    super.initState();
  }

  void _onSave() {
    returnData['id'] = widget.data['id'];
    returnData['firstName'] = _firstName.text;
    returnData['lastName'] = _lastName.text;
    returnData['email'] = _email.text;
    returnData['phone'] = _phone.text;
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          child: const Text(
            'Cancel',
            style: TextStyle(
              color: Color(0xffff8c00),
              fontWeight: FontWeight.w400,
              fontSize: 17,
            ),
          ),
          onPressed: () {
            // TODO: Do something here.
            print('Cancel button tapped');
            Navigator.pop(context);
          },
        ),
        leadingWidth: 70,
        actions: [
          TextButton(
            child: const Text(
              'Save',
              style: TextStyle(
                color: Color(0xffff8c00),
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
            onPressed: () {
              // TODO: Do something here.
              print('Save button tapped');
              // _onSave;
              returnData['id'] = widget.data['id'];
              returnData['firstName'] = _firstName.text;
              returnData['lastName'] = _lastName.text;
              returnData['email'] = _email.text;
              returnData['phone'] = _phone.text;
              Navigator.pop(context, returnData);
            },
          ),
        ],
        elevation: 0,
        bottom: PreferredSize(
          child: Container(
            color: Colors.grey,
            height: 1.0,
          ),
          preferredSize: const Size.fromHeight(4.0),
        ),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        width: _width,
        height: _height,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: CircleAvatar(
                      radius: 50, backgroundColor: Color(0xffff8c00)),
                ),
              ),
              // Main Information Title
              Container(
                padding: const EdgeInsets.all(10),
                color: Colors.grey[350],
                width: _width,
                child: const Text(
                  'Main Information',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ),
              // First Name
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text(
                        'First Name',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      width: _width * 0.7,
                      child: FormBuilderTextField(
                        name: 'first_name',
                        obscureText: false,
                        controller: _firstName,
                        onChanged: (value) {
                          _firstName.text = value!;
                        },
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                        ]),
                        autovalidateMode: AutovalidateMode.disabled,
                        keyboardType: TextInputType.text,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                          isDense: false,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Color(0xffff8c00),
                              width: 1.0,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 1.0,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1.0,
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          hintText: '',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade300,
                          ),
                          errorStyle: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          contentPadding: const EdgeInsets.all(10),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
              // Last Name
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text(
                        'Last Name',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      width: _width * 0.7,
                      child: FormBuilderTextField(
                        name: 'last_name',
                        obscureText: false,
                        controller: _lastName,
                        onChanged: (value) {
                          _lastName.text = value!;
                        },
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                        ]),
                        autovalidateMode: AutovalidateMode.disabled,
                        keyboardType: TextInputType.text,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                          isDense: false,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Color(0xffff8c00),
                              width: 1.0,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 1.0,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1.0,
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          hintText: '',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade300,
                          ),
                          errorStyle: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          contentPadding: const EdgeInsets.all(10),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                color: Colors.grey[350],
                width: _width,
                child: const Text(
                  'Sub Information',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ),
              // Email
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text(
                        'Email',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      width: _width * 0.7,
                      child: FormBuilderTextField(
                        name: 'email',
                        obscureText: false,
                        controller: _email,
                        onChanged: (value) {
                          _email.text = value!;
                        },
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                        ]),
                        autovalidateMode: AutovalidateMode.disabled,
                        keyboardType: TextInputType.text,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                          isDense: false,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Color(0xffff8c00),
                              width: 1.0,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 1.0,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1.0,
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          hintText: '',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade300,
                          ),
                          errorStyle: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          contentPadding: const EdgeInsets.all(10),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
              // Phone
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text(
                        'Phone',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      width: _width * 0.7,
                      child: FormBuilderTextField(
                        name: 'phone',
                        obscureText: false,
                        controller: _phone,
                        onChanged: (value) {
                          _phone.text = value!;
                        },
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                        ]),
                        autovalidateMode: AutovalidateMode.disabled,
                        keyboardType: TextInputType.text,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                          isDense: false,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Color(0xffff8c00),
                              width: 1.0,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 1.0,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1.0,
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          hintText: '',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade300,
                          ),
                          errorStyle: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          contentPadding: const EdgeInsets.all(10),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
