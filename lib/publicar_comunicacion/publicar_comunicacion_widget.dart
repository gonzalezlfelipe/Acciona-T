import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../profesores/profesores_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class PublicarComunicacionWidget extends StatefulWidget {
  const PublicarComunicacionWidget({Key key}) : super(key: key);

  @override
  _PublicarComunicacionWidgetState createState() =>
      _PublicarComunicacionWidgetState();
}

class _PublicarComunicacionWidgetState
    extends State<PublicarComunicacionWidget> {
  String dropDown2Value;
  String dropDownValue;
  TextEditingController textController1;
  TextEditingController textController2;
  String uploadedFileUrl1 = '';
  String uploadedFileUrl2 = '';
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PublicarComunicacion'});
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.rectangle,
              ),
              child: InkWell(
                onTap: () async {
                  logFirebaseEvent('Icon-ON_TAP');
                  logFirebaseEvent('Icon-Navigate-Back');
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryColor,
                  size: 24,
                ),
              ),
            ),
          ],
        ),
        title: Text(
          'Publicar comunicación',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).primaryBackground,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 15, 20, 0),
                    child: TextFormField(
                      controller: textController1,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Título comunicación',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x39303030),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x39303030),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Color(0xB4303030),
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Campo requerido';
                        }

                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 15, 20, 0),
                    child: TextFormField(
                      controller: textController2,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Desarrollo',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x39303030),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x39303030),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Color(0xB4303030),
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Campo requerido';
                        }

                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                    child: AuthUserStreamWidget(
                      child: StreamBuilder<List<CursosRecord>>(
                        stream: queryCursosRecord(
                          queryBuilder: (cursosRecord) => cursosRecord.where(
                              'Nombre_curso',
                              isEqualTo: currentUserDocument?.curso),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: SpinKitThreeBounce(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 50,
                                ),
                              ),
                            );
                          }
                          List<CursosRecord> dropDownCursosRecordList =
                              snapshot.data;
                          return FlutterFlowDropDown(
                            options: [
                              'Curso',
                              'Apoyo estudiantil',
                              'Centro de alumnos',
                              'Centro de padres',
                              'General'
                            ].toList(),
                            onChanged: (val) =>
                                setState(() => dropDownValue = val),
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xB6303030),
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                            hintText: 'Seleccionar tipo',
                            fillColor: Colors.white,
                            elevation: 2,
                            borderColor: Color(0x37303030),
                            borderWidth: 2,
                            borderRadius: 16,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                            hidesUnderline: true,
                          );
                        },
                      ),
                    ),
                  ),
                  if ((dropDownValue) == 'Curso')
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                      child: AuthUserStreamWidget(
                        child: StreamBuilder<List<CursosRecord>>(
                          stream: queryCursosRecord(
                            queryBuilder: (cursosRecord) => cursosRecord.where(
                                'Nombre_curso',
                                isEqualTo: currentUserDocument?.curso),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: SpinKitThreeBounce(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 50,
                                  ),
                                ),
                              );
                            }
                            List<CursosRecord> dropDown2CursosRecordList =
                                snapshot.data;
                            return FlutterFlowDropDown(
                              options: dropDown2CursosRecordList
                                  .map((e) => e.nombreCurso)
                                  .toList()
                                  .toList(),
                              onChanged: (val) =>
                                  setState(() => dropDown2Value = val),
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xB6303030),
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                              hintText: 'Seleccionar curso',
                              fillColor: Colors.white,
                              elevation: 2,
                              borderColor: Color(0x37303030),
                              borderWidth: 2,
                              borderRadius: 16,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  16, 16, 16, 16),
                              hidesUnderline: true,
                            );
                          },
                        ),
                      ),
                    ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 25),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent('Container-ON_TAP');
                        logFirebaseEvent('Container-Upload-Photo-Video');
                        final selectedMedia =
                            await selectMediaWithSourceBottomSheet(
                          context: context,
                          allowPhoto: true,
                        );
                        if (selectedMedia != null &&
                            validateFileFormat(
                                selectedMedia.storagePath, context)) {
                          showUploadMessage(
                            context,
                            'Uploading file...',
                            showLoading: true,
                          );
                          final downloadUrl = await uploadData(
                              selectedMedia.storagePath, selectedMedia.bytes);
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          if (downloadUrl != null) {
                            setState(() => uploadedFileUrl1 = downloadUrl);
                            showUploadMessage(
                              context,
                              'Success!',
                            );
                          } else {
                            showUploadMessage(
                              context,
                              'Failed to upload media',
                            );
                            return;
                          }
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: 230,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Color(0x37303030),
                            width: 2,
                          ),
                        ),
                        child: Stack(
                          alignment: AlignmentDirectional(0, 0),
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0, -0.15),
                              child: Icon(
                                Icons.add,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 35,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, 0.5),
                              child: Text(
                                'Agregar\nimagen',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0x7B303030),
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  uploadedFileUrl1,
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 1,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 25),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent('Container-ON_TAP');
                        logFirebaseEvent('Container-Upload-File');
                        final selectedFile =
                            await selectFile(allowedExtensions: ['pdf']);
                        if (selectedFile != null) {
                          showUploadMessage(
                            context,
                            'Uploading file...',
                            showLoading: true,
                          );
                          final downloadUrl = await uploadData(
                              selectedFile.storagePath, selectedFile.bytes);
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          if (downloadUrl != null) {
                            setState(() => uploadedFileUrl2 = downloadUrl);
                            showUploadMessage(
                              context,
                              'Success!',
                            );
                          } else {
                            showUploadMessage(
                              context,
                              'Failed to upload file',
                            );
                            return;
                          }
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: 100,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Color(0x37303030),
                            width: 2,
                          ),
                        ),
                        child: Stack(
                          alignment: AlignmentDirectional(0, 0),
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0, -0.5),
                              child: Icon(
                                Icons.upload_file,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 35,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, 0.5),
                              child: Text(
                                uploadedFileUrl2,
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0x7B303030),
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 25),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('Button-ON_TAP');
                        logFirebaseEvent('Button-Validate-Form');
                        if (!formKey.currentState.validate()) {
                          return;
                        }

                        if (dropDownValue == null) {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Selecciona tipo de comunicación'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                          return;
                        }

                        if (uploadedFileUrl1 == null) {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Cargar imagen referencial'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                          return;
                        }

                        logFirebaseEvent('Button-Backend-Call');

                        final comunicacionesCreateData =
                            createComunicacionesRecordData(
                          titulo: textController1.text,
                          tipoComunicacion: dropDownValue,
                          filtroCurso: dropDown2Value,
                          uidQP: currentUserReference,
                          desarrollo: textController2.text,
                          fechaPublicacion: getCurrentTimestamp,
                          imgRef: uploadedFileUrl1,
                          rolQP: currentUserDocument?.rol,
                          nombreQP: currentUserDisplayName,
                          docPDF: uploadedFileUrl2,
                        );
                        await ComunicacionesRecord.collection
                            .doc()
                            .set(comunicacionesCreateData);
                        logFirebaseEvent('Button-Alert-Dialog');
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Comunicación publicada'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                        logFirebaseEvent('Button-Navigate-To');
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfesoresWidget(),
                          ),
                        );
                      },
                      text: 'Confirmar',
                      icon: Icon(
                        Icons.check_rounded,
                        size: 15,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 40,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                        elevation: 3,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 35,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
