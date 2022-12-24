Program parcial1;
Const
  dimf = 5;

Type

  info = Record
      tipoemergencia, fecha, codcli, dir: Integer;
    End;

  infom = Record
      tipoemergencia, cant: Integer
    End;

  lst = ^nodo;

  nodo = Record
      dato: info;
      sig:  lst;
    End;

  vec = Array [1..dimf] Of lst;

  lstm = ^nodom;

  nodom = Record
      dato: infom;
      sig:  lstm;
    End;

  Procedure leerInfo(Var infoaleer: info; i: Integer);
      Begin
          With infoaleer Do
            Begin
              write('Ingrese tipoemergencia: ');
              If i < Random(20) Then
                Begin
                  tipoemergencia := i;
                End
              Else
                Begin
                  tipoemergencia := -1;
                End;

              //readln(tipoemergencia);
              writeln(tipoemergencia);
              writeln('');

              write('Ingrese fecha: ');
              fecha := Random(5);
              writeln(fecha);
              //readln(fecha);
              writeln('');

              write('Ingrese direccion: ');
              dir := Random(50);
              writeln(dir);
              //readln(dir);
              writeln('');

              write('Ingrese codigo cliente: ');
              codcli := Random(50);
              writeln(codcli);
              //readln(codcli);
              writeln('');
              writeln('------------------------------------');

            End;
      End;

  Procedure inicializarMerge(Var arrmer: vec);
      Var i: Integer;
      Begin
          For i := 1 To dimf Do
            Begin
              arrmer[i] := Nil;
            End;
      End;

  Procedure agregarAtras(Var pri, ult: lst; valor: info);
      Var
          aux: lst;
      Begin
          new(aux); aux^.dato := valor; aux^.sig := Nil;
          If (pri = Nil) Then
            Begin
              pri := aux;
            End
          Else
            Begin
              ult^.sig := aux;
            End;
              ult := aux;
      End;

  Procedure agregarAtrasm(Var pri, ult: lstm; valor: infom);
      Var
          aux: lstm;
      Begin
          new(aux);   aux^.dato := valor;     aux^.sig := Nil;
          If pri = Nil Then
            Begin
              pri := aux;
              ult := aux;
            End;
          ult^.sig := aux;
          ult := aux;
      End;

  Procedure armarArray(Var arr: vec);
      Var
          aux: info;j, i: Integer;ult: lst;
      Begin
          For i := 1 To dimf Do
            Begin
              ult := Nil;
              j := 0;
              leerInfo(aux, j);
              While (aux.tipoemergencia <> -1) Do
                Begin
                  agregarAtras(arr [i], ult, aux);
                  j := j + 1;
                  leerInfo(aux, j);
                End;
            End;
      End;

  Procedure minimo(Var todos: vec; Var datosMin: info);
      Var
          indiceMin, i: Integer;
      Begin
          datosMin.tipoemergencia := 999;
          indiceMin := -1;
          For i := 1 To dimf Do
              If (todos [i] <> Nil) Then
                  If (todos [i]^.dato.tipoemergencia <= datosMin.tipoemergencia) Then//Esta sentencia define el criterio para acumular
                    Begin
                      datosMin := todos [i]^.dato;//Esta reasigna el minimo
                      indiceMin := i;
                    End;
          If (indiceMin <> -1) Then
            Begin
              datosMin := todos [indiceMin]^.dato;
              todos[indiceMin] := todos [indiceMin]^.sig;
            End;
      End;

  Procedure mergeAcumulador(arr: vec; Var nuevo: lstm);
      Var
          min: info;
          actual: Integer;
          acumular: Integer;
          prodNuevo: infom;
          ult: lstm;
      Begin
          ult := Nil;
          nuevo := Nil;
          minimo(arr, min);
          While (min.tipoemergencia <> 999) Do
            Begin
              actual := min.tipoemergencia;
              acumular := 0;
              While ((min.tipoemergencia <> 999) And (actual = min.tipoemergencia)) Do
                Begin
                  acumular := acumular + 1;
                  minimo(arr, min);
                End;
              prodNuevo.tipoemergencia := actual;
              prodNuevo.cant := acumular;
              agregarAtrasm(nuevo, ult, prodNuevo);
            End;
      End;

  Procedure menosAtenciones(pri: lstm;var min,minemergencia:integer);
      Begin
          If (pri <> Nil) Then
            Begin
              if pri^.dato.cant<min then
                begin
                  minemergencia:=pri^.dato.tipoemergencia;
                end;
              menosAtenciones(pri^.sig, min,minemergencia);
            End;
      End;

        Procedure imprimirLista(pri: lstm);
      Begin
          If (pri <> Nil) Then
            Begin
              writeln('tipoemergencia: ', pri^.dato.tipoemergencia);
              Writeln('cantidad:', pri^.dato.cant);
              writeln('-------------------------------------------');
              imprimirLista(pri^.sig);
            End;
      End;

Var ar: vec;l: lstm;min,minemergencia: Integer;
Begin
randomize;
  inicializarMerge(ar);
  armarArray(ar);
  l := Nil;
    readln;
  mergeAcumulador(ar, l);
  imprimirLista(l);
  min := 9999;
  minemergencia:=-1;
  readln;
  menosAtenciones(l, min,minemergencia);
  writeln('minemergencia: ', minemergencia);
  readln;
End.//tiempo,30:01.28;fecha,25/1