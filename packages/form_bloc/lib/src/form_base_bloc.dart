import 'package:bloc/bloc.dart';
import 'package:form_bloc/src/field_blocs/field_bloc.dart';
import 'package:form_bloc/src/validation_state.dart';



enum FormEvent { notify }

abstract class FormBaseBloc<T> extends Bloc<FormEvent, ValidationState<T>> {
  final List<FieldBloc> fieldBlocs;

  FormBaseBloc(this.fieldBlocs) {
    fieldBlocs.forEach((bloc) {
      bloc.state.listen((_) {
        dispatch(FormEvent.notify);
      });
    });
  }

  bool isFormValid() {
    bool formIsValid = true;
    fieldBlocs.forEach((bloc) {
      if (!(bloc.currentState is ValidState)) formIsValid = false;
    });

    return formIsValid;
  }

}