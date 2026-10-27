import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// Состояние (State)
class NotesState extends Equatable {
  final List<String> notes;
  
  const NotesState({this.notes = const []});
  
  NotesState copyWith({List<String>? notes}) {
    return NotesState(notes: notes ?? this.notes);
  }
  
  @override
  List<Object?> get props => [notes];
}

// Cubit для управления состоянием
class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(const NotesState());
  
  void addNote(String note) {
    final updatedNotes = [...state.notes, note];
    emit(state.copyWith(notes: updatedNotes));
  }
  
  void deleteNote(int index) {
    final updatedNotes = List<String>.from(state.notes);
    updatedNotes.removeAt(index);
    emit(state.copyWith(notes: updatedNotes));
  }
  
  void editNote(int index, String newNote) {
    final updatedNotes = List<String>.from(state.notes);
    updatedNotes[index] = newNote;
    emit(state.copyWith(notes: updatedNotes));
  }
}