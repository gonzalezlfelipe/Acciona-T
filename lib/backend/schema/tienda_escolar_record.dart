import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'tienda_escolar_record.g.dart';

abstract class TiendaEscolarRecord
    implements Built<TiendaEscolarRecord, TiendaEscolarRecordBuilder> {
  static Serializer<TiendaEscolarRecord> get serializer =>
      _$tiendaEscolarRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Titulo_producto')
  String get tituloProducto;

  @nullable
  @BuiltValueField(wireName: 'Descripcion_producto')
  String get descripcionProducto;

  @nullable
  @BuiltValueField(wireName: 'Img_ref1')
  String get imgRef1;

  @nullable
  @BuiltValueField(wireName: 'Img_ref2')
  String get imgRef2;

  @nullable
  @BuiltValueField(wireName: 'Img_ref3')
  String get imgRef3;

  @nullable
  @BuiltValueField(wireName: 'Fecha_publicacion')
  DateTime get fechaPublicacion;

  @nullable
  @BuiltValueField(wireName: 'Uid_QP')
  DocumentReference get uidQP;

  @nullable
  @BuiltValueField(wireName: 'Nombre_QP')
  String get nombreQP;

  @nullable
  @BuiltValueField(wireName: 'Rol_QP')
  String get rolQP;

  @nullable
  @BuiltValueField(wireName: 'Curso_QP')
  String get cursoQP;

  @nullable
  @BuiltValueField(wireName: 'N_contacto')
  String get nContacto;

  @nullable
  @BuiltValueField(wireName: 'Categoria_producto')
  String get categoriaProducto;

  @nullable
  @BuiltValueField(wireName: 'Precio_producto')
  String get precioProducto;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TiendaEscolarRecordBuilder builder) => builder
    ..tituloProducto = ''
    ..descripcionProducto = ''
    ..imgRef1 = ''
    ..imgRef2 = ''
    ..imgRef3 = ''
    ..nombreQP = ''
    ..rolQP = ''
    ..cursoQP = ''
    ..nContacto = ''
    ..categoriaProducto = ''
    ..precioProducto = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Tienda_Escolar');

  static Stream<TiendaEscolarRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TiendaEscolarRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  TiendaEscolarRecord._();
  factory TiendaEscolarRecord(
          [void Function(TiendaEscolarRecordBuilder) updates]) =
      _$TiendaEscolarRecord;

  static TiendaEscolarRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTiendaEscolarRecordData({
  String tituloProducto,
  String descripcionProducto,
  String imgRef1,
  String imgRef2,
  String imgRef3,
  DateTime fechaPublicacion,
  DocumentReference uidQP,
  String nombreQP,
  String rolQP,
  String cursoQP,
  String nContacto,
  String categoriaProducto,
  String precioProducto,
}) =>
    serializers.toFirestore(
        TiendaEscolarRecord.serializer,
        TiendaEscolarRecord((t) => t
          ..tituloProducto = tituloProducto
          ..descripcionProducto = descripcionProducto
          ..imgRef1 = imgRef1
          ..imgRef2 = imgRef2
          ..imgRef3 = imgRef3
          ..fechaPublicacion = fechaPublicacion
          ..uidQP = uidQP
          ..nombreQP = nombreQP
          ..rolQP = rolQP
          ..cursoQP = cursoQP
          ..nContacto = nContacto
          ..categoriaProducto = categoriaProducto
          ..precioProducto = precioProducto));
