import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class MesDocumentsView extends StatefulWidget {
  @override
  _MesDocumentsViewState createState() => _MesDocumentsViewState();
}

class _MesDocumentsViewState extends State<MesDocumentsView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _fileName;
  List<PlatformFile> _paths;
  String _directoryPath;
  String _extension;
  bool _loadingPath = false;
  bool _multiPick = false;
  FileType _pickingType = FileType.any;
  FilePickerResult result;
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  void _openFileExplorer() async {
    setState(() => _loadingPath = true);
    try {
      _directoryPath = null;
      result = await FilePicker.platform.pickFiles(allowMultiple: true);
      _paths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowMultiple: _multiPick,
        allowedExtensions: (_extension?.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '').split(',')
            : null,
      ))
          ?.files;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    setState(() {
      _loadingPath = false;
      _fileName = _paths != null ? _paths.map((e) => e.name).toString() : '...';
      List<File> files = _paths != null
          ? result.paths.map((path) => File(path)).toList()
          : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(30),
                child: Text(
                  "Mes documents",
                  style: TextStyle(fontSize: 40),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  children: [
                    Row(children: [
                      Text("Pièce d'identité"),
                      SizedBox(
                        width: 30,
                      ),
                      Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.yellow[100],
                          child: IconButton(
                              icon: Icon(Icons.file_upload),
                              color: Colors.black,
                              onPressed: () => _openFileExplorer()))
                    ]),
                    SizedBox(
                      height: 50,
                    ),
                    Row(children: [
                      Text("Revenus(fiche de salaires etc...)"),
                      SizedBox(
                        width: 30,
                      ),
                      Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.yellow[100],
                          child: IconButton(
                              icon: Icon(Icons.file_upload),
                              color: Colors.black,
                              onPressed: () => _openFileExplorer()))
                    ]),
                    SizedBox(
                      height: 50,
                    ),
                    Row(children: [
                      Text("Revenus(fiche de salaires etc...)"),
                      SizedBox(
                        width: 30,
                      ),
                      Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.yellow[100],
                          child: IconButton(
                              icon: Icon(Icons.file_upload),
                              color: Colors.black,
                              onPressed: () => _openFileExplorer()))
                    ]),
                    MaterialButton(
                        child: Text("Enregistrer"),
                        color: Colors.yellow[200],
                        onPressed: () => _sendFiles())
                  ],
                ),
              ),
              Builder(
                builder: (BuildContext context) => _loadingPath
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: const CircularProgressIndicator(),
                      )
                    : _paths != null
                        ? Container(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            height: MediaQuery.of(context).size.height * 0.50,
                            child: Scrollbar(
                                child: ListView.separated(
                              itemCount: _paths != null && _paths.isNotEmpty
                                  ? _paths.length
                                  : 1,
                              itemBuilder: (BuildContext context, int index) {
                                final bool isMultiPath =
                                    _paths != null && _paths.isNotEmpty;
                                final String name = 'File $index: ' +
                                    (isMultiPath
                                        ? _paths
                                            .map((e) => e.name)
                                            .toList()[index]
                                        : _fileName ?? '...');

                                return ListTile(
                                  title: Text(
                                    name,
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const Divider(),
                            )),
                          )
                        : const SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _sendFiles() {}
}
