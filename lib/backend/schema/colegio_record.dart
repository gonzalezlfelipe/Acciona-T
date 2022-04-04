import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'colegio_record.g.dart';

abstract class ColegioRecord
    implements Built<ColegioRecord, ColegioRecordBuilder> {
  static Serializer<ColegioRecord> get serializer => _$colegioRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Nombre_Colegio')
  String get nombreColegio;

  @nullable
  @BuiltValueField(wireName: 'Detalle_colegio')
  String get detalleColegio;

  @nullable
  @BuiltValueField(wireName: 'Ubicacion')
  LatLng get ubicacion;

  @nullable
  @BuiltValueField(wireName: 'N_contacto')
  String get nContacto;

  @nullable
  @BuiltValueField(wireName: 'Correo')
  String get correo;

  @nullable
  @BuiltValueField(wireName: 'Link_web')
  String get linkWeb;

  @nullable
  @BuiltValueField(wireName: 'link_Instagram')
  String get linkInstagram;

  @nullable
  @BuiltValueField(wireName: 'Link_Facebook')
  String get linkFacebook;

  @nullable
  @BuiltValueField(wireName: 'Horario_atencion')
  String get horarioAtencion;

  @nullable
  @BuiltValueField(wireName: 'Img_ref')
  String get imgRef;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ColegioRecordBuilder builder) => builder
    ..nombreColegio = ''
    ..detalleColegio = ''
    ..nContacto = ''
    ..correo = ''
    ..linkWeb = ''
    ..linkInstagram = ''
    ..linkFacebook = ''
    ..horarioAtencion = ''
    ..imgRef = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Colegio');

  static Stream<ColegioRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ColegioRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ColegioRecord._();
  factory ColegioRecord([void Function(ColegioRecordBuilder) updates]) =
      _$ColegioRecord;

  static ColegioRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createColegioRecordData({
  String nombreColegio,
  String detalleColegio,
  LatLng ubicacion,
  String nContacto,
  String correo,
  String linkWeb,
  String linkInstagram,
  String linkFacebook,
  String horarioAtencion,
  String imgRef,
}) =>
    serializers.toFirestore(
        ColegioRecord.serializer,
        ColegioRecord((c) => c
          ..nombreColegio = nombreColegio
          ..detalleColegio = detalleColegio
          ..ubicacion = ubicacion
          ..nContacto = nContacto
          ..correo = correo
          ..linkWeb = linkWeb
          ..linkInstagram = linkInstagram
          ..linkFacebook = linkFacebook
          ..horarioAtencion = horarioAtencion
          ..imgRef = imgRef));
