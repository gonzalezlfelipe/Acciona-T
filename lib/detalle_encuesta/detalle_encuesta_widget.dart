import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../encuesta_web/encuesta_web_widget.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class DetalleEncuestaWidget extends StatefulWidget {
  const DetalleEncuestaWidget({
    Key key,
    this.detalleEncueta,
  }) : super(key: key);

  final DocumentReference detalleEncueta;

  @override
  _DetalleEncuestaWidgetState createState() => _DetalleEncuestaWidgetState();
}

class _DetalleEncuestaWidgetState extends State<DetalleEncuestaWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'detalleEncuesta'});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<EncuestasRecord>(
      stream: EncuestasRecord.getDocument(widget.detalleEncueta),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitThreeBounce(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 50,
              ),
            ),
          );
        }
        final detalleEncuestaEncuestasRecord = snapshot.data;
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
            actions: [],
            centerTitle: false,
            elevation: 2,
          ),
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              logFirebaseEvent('FloatingActionButton-ON_TAP');
              logFirebaseEvent('FloatingActionButton-Navigate-To');
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EncuestaWebWidget(
                    linkEncuesta: detalleEncuestaEncuestasRecord.linkEncuesta,
                  ),
                ),
              );
            },
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            icon: Icon(
              Icons.content_paste,
            ),
            elevation: 8,
            label: Text(
              'Realizar encuesta',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
            ),
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if ((currentUserReference) ==
                        (detalleEncuestaEncuestasRecord.uidQP))
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent('Button-ON_TAP');
                            logFirebaseEvent('Button-Backend-Call');
                            await detalleEncuestaEncuestasRecord.reference
                                .delete();
                            logFirebaseEvent('Button-Navigate-Back');
                            Navigator.pop(context);
                            logFirebaseEvent('Button-Show-Snack-Bar');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Publicación eliminada',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor: Color(0xFF25D366),
                              ),
                            );
                          },
                          text: 'Eliminar',
                          options: FFButtonOptions(
                            width: 130,
                            height: 35,
                            color: Color(0xFFFB5154),
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 35,
                          ),
                        ),
                      ),
                    if ((currentUserDocument?.rol) == 'Administrador')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                        child: AuthUserStreamWidget(
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent('Button-ON_TAP');
                              logFirebaseEvent('Button-Backend-Call');
                              await detalleEncuestaEncuestasRecord.reference
                                  .delete();
                              logFirebaseEvent('Button-Navigate-Back');
                              Navigator.pop(context);
                              logFirebaseEvent('Button-Show-Snack-Bar');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Publicación eliminada',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor: Color(0xFF25D366),
                                ),
                              );
                            },
                            text: 'Eliminar',
                            options: FFButtonOptions(
                              width: 130,
                              height: 35,
                              color: Color(0xFFFB5154),
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 35,
                            ),
                          ),
                        ),
                      ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                      child: InkWell(
                        onTap: () async {
                          logFirebaseEvent('Image-ON_TAP');
                          logFirebaseEvent('Image-Expand-Image');
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: FlutterFlowExpandedImageView(
                                image: Image.network(
                                  detalleEncuestaEncuestasRecord.imgRef,
                                  fit: BoxFit.contain,
                                ),
                                allowRotation: false,
                                tag: detalleEncuestaEncuestasRecord.imgRef,
                                useHeroAnimation: true,
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag: detalleEncuestaEncuestasRecord.imgRef,
                          transitionOnUserGestures: true,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.network(
                              detalleEncuestaEncuestasRecord.imgRef,
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.25,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                      color: Color(0x2D303030),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                            child: Icon(
                              Icons.access_time,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 20,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                            child: Text(
                              'Publicado el: ${dateTimeFormat('d/M/y', detalleEncuestaEncuestasRecord.fechaPublicacion)}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                            child: Icon(
                              Icons.person_sharp,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 20,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                            child: Text(
                              '${detalleEncuestaEncuestasRecord.nombreQP} - ${detalleEncuestaEncuestasRecord.rolQP}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                            child: FaIcon(
                              FontAwesomeIcons.solidCalendarCheck,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 20,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                            child: Text(
                              'Fecha de inicio: ${dateTimeFormat('d/M/y', detalleEncuestaEncuestasRecord.fechaInicio)}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                            child: FaIcon(
                              FontAwesomeIcons.solidCalendarTimes,
                              color: Color(0xB6303030),
                              size: 20,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                            child: Text(
                              'Fecha de término: ${dateTimeFormat('d/M/y', detalleEncuestaEncuestasRecord.fechaTermino)}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                      color: Color(0x2D303030),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                      child: Text(
                        detalleEncuestaEncuestasRecord.tituloEncuesta,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                        child: Text(
                          detalleEncuestaEncuestasRecord.descripcion,
                          textAlign: TextAlign.justify,
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
