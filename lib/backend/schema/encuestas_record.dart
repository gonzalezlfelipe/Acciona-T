import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'encuestas_record.g.dart';

abstract class EncuestasRecord
    implements Built<EncuestasRecord, EncuestasRecordBuilder> {
  static Serializer<EncuestasRecord> get serializer =>
      _$encuestasRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Titulo_encuesta')
  String get tituloEncuesta;

  @nullable
  @BuiltValueField(wireName: 'Descripcion')
  String get descripcion;

  @nullable
  @BuiltValueField(wireName: 'Img_ref')
  String get imgRef;

  @nullable
  @BuiltValueField(wireName: 'Fecha_inicio')
  DateTime get fechaInicio;

  @nullable
  @BuiltValueField(wireName: 'Fecha_termino')
  DateTime get fechaTermino;

  @nullable
  @BuiltValueField(wireName: 'Fecha_publicacion')
  DateTime get fechaPublicacion;

  @nullable
  @BuiltValueField(wireName: 'Filtro_encuesta')
  String get filtroEncuesta;

  @nullable
  @BuiltValueField(wireName: 'Uid_QP')
  DocumentReference get uidQP;

  @nullable
  @BuiltValueField(wireName: 'Link_encuesta')
  String get linkEncuesta;

  @nullable
  @BuiltValueField(wireName: 'Nombre_QP')
  String get nombreQP;

  @nullable
  @BuiltValueField(wireName: 'Rol_QP')
  String get rolQP;

  @nullable
  @BuiltValueField(wireName: 'Filtro_curso')
  String get filtroCurso;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(EncuestasRecordBuilder builder) => builder
    ..tituloEncuesta = ''
    ..descripcion = ''
    ..imgRef = ''
    ..filtroEncuesta = ''
    ..linkEncuesta = ''
    ..nombreQP = ''
    ..rolQP = ''
    ..filtroCurso = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Encuestas');

  static Stream<EncuestasRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<EncuestasRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  EncuestasRecord._();
  factory EncuestasRecord([void Function(EncuestasRecordBuilder) updates]) =
      _$EncuestasRecord;

  static EncuestasRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createEncuestasRecordData({
  String tituloEncuesta,
  String descripcion,
  String imgRef,
  DateTime fechaInicio,
  DateTime fechaTermino,
  DateTime fechaPublicacion,
  String filtroEncuesta,
  DocumentReference uidQP,
  String linkEncuesta,
  String nombreQP,
  String rolQP,
  String filtroCurso,
}) =>
    serializers.toFirestore(
        EncuestasRecord.serializer,
        EncuestasRecord((e) => e
          ..tituloEncuesta = tituloEncuesta
          ..descripcion = descripcion
          ..imgRef = imgRef
          ..fechaInicio = fechaInicio
          ..fechaTermino = fechaTermino
          ..fechaPublicacion = fechaPublicacion
          ..filtroEncuesta = filtroEncuesta
          ..uidQP = uidQP
          ..linkEncuesta = linkEncuesta
          ..nombreQP = nombreQP
          ..rolQP = rolQP
          ..filtroCurso = filtroCurso));
