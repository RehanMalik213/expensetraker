// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpenseHiveBoxModelAdapter extends TypeAdapter<ExpenseHiveBoxModel> {
  @override
  final int typeId = 0;

  @override
  ExpenseHiveBoxModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExpenseHiveBoxModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as int,
      fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ExpenseHiveBoxModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.expenseTitle)
      ..writeByte(1)
      ..write(obj.expenseDescription)
      ..writeByte(2)
      ..write(obj.expenseDate)
      ..writeByte(3)
      ..write(obj.expenseTime)
      ..writeByte(4)
      ..write(obj.expenseAmount)
      ..writeByte(5)
      ..write(obj.expense);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpenseHiveBoxModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
