Program parcial3;
Const
  dimf = 20;
Type

  info = Record
      legajo, cantasis, nota: Integer;
    End;

  vec = Array [1..dimf] Of info;

  lst = ^nodo;

  nodo = Record
      dato: Integer;
      sig:  lst;
    End;

  Procedure leerInfo(Var infoaleer: info);// Si se cambia el tipo de registro cambiar solo info
      Begin
          With infoaleer Do
            Begin
              write('Ingrese legajo: ');
              legajo := Random(15);
              //readln(legajo);
              writeln(legajo);
              writeln('');

              write('Ingrese cantasis: ');
              cantasis := Random(9);
              writeln(cantasis);
              //readln(cantasis);
              writeln('');


              write('Ingrese nota: ');
              nota := Random(50);
              writeln(nota);
              //readln(nota);
              writeln('');
              writeln('------------------------------------');

            End;
      End;


  Procedure armarArray(Var arr: vec; Var diml: Integer);
      Var
          aux: info;
      Begin
          leerInfo(aux);
          While (diml < dimf) And (aux.legajo <> 0) Do
            Begin
              diml := diml + 1;
              arr[diml] := aux;
              leerInfo(aux);
            End;
      End;


  Procedure insertionSort(Var Vector: vec; diml: Integer);
      Var i, j: Integer;actual: info;
      Begin
          For i := 2 To diml Do
            Begin
              actual := Vector [i]; j := i - 1;
        {Desplazamiento de los elementos de la matriz }
              While (j > 0) And (Vector [j].legajo > actual.legajo) Do
                Begin
                  Vector[j + 1] := Vector [j];
                  j := j - 1;
                End;
        {insertar el elemento en su lugar }
              Vector[j + 1] := actual;
            End;
      End;

  Procedure busquedaDicotomica(arr: vec; diml, legajoin: Integer; Var esta: Boolean);
      Var
          ini, fin, mit: Integer;
      Begin
          esta := false;
          ini := 1;
          fin := diml;
          mit := (fin + ini) Div 2;
          While (ini <= fin) And (arr [mit].legajo <> legajoin) Do
            Begin
              If legajoin < arr [mit].legajo Then
                Begin
                  fin := mit - 1;
                End
              Else
                Begin
                  ini := mit + 1;
                End;
              mit := (fin + ini) Div 2;
            End;
          If (ini <= fin) And (arr [mit].legajo = legajoin) Then
            Begin
              esta := True;
            End;
      End;

  Procedure agregarAdelante(Var pri: lst; valor: Integer);
      Var
          aux: lst;
      Begin
          new(aux); aux^.dato := valor; aux^.sig := Nil;

          If (pri = Nil) Then
            Begin pri := aux; End
          Else
            Begin
              aux^.sig := pri;
              pri := aux;
            End;
      End;

  Procedure hacerListaCond(ar: vec; cantasisin, diml, i: Integer; Var l: lst);
      Begin
          If (i < diml) Then
            Begin
              If (ar [i].cantasis < cantasisin) Then
                Begin
                  agregarAdelante(l, ar [i].legajo);
                End;
              hacerListaCond(ar, cantasisin, diml, i + 1, l);
            End;
      End;

  Procedure imprimirLista(pri: lst);
      Begin
          If (pri <> Nil) Then
            Begin
              writeln('legajo: ', pri^.dato);
              writeln('-------------------------------------------');
              imprimirLista(pri^.sig);
            End;
      End;

Var
  ar: vec;legajoin, diml, i,cantasisin: Integer;esta: Boolean;l:lst;
Begin
  randomize;
  diml := 0;
  armarArray(ar, diml);
  insertionSort(ar, diml);
  esta := False;
  //readln(legajoin);
  legajoin := 5;
  busquedaDicotomica(ar, diml, legajoin, esta);
  writeln('esta: ', esta);
  l := Nil;
  //readln(cantasisin);
  cantasisin := 5;
  i := 1;
  hacerListaCond(ar, cantasisin, diml, i, l);
  imprimirLista(l);
  ReadLn;
End.{Tiempo,25:35.49;fecha27/1}{PHOTO-2018-09-24-21-31-18}