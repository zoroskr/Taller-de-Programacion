Program Parcial7;
Const
  dimf = 5;//para arrays
Type

  fecha = Record
      dia, mes, anio: Integer;
    End;

  info = Record
      codalu, codcar, codmat, nota: Integer;
      fech: fecha;
    End;

  infol = Record
      codalu, codmat, nota: Integer;
      fech: fecha;
    End;


  infola = Record
      codmat, nota: Integer;
    End;

  lsta = ^nodola;

  nodola = Record
      dato: infola;
      sig:  lsta;
    End;

  infoa = Record
      codalu: Integer;
      lstarbol: lsta;
    End;

  lst = ^nodol;

  nodol = Record
      dato: infol;
      sig:  lst;
    End;

  abl = ^nodoa;
  nodoa = Record
      dato: infoa;
      HI: abl;
      HD: abl;
    End;

  vec = Array [1..dimf] Of lst;

  Procedure inicializarMerge(Var ar: vec);
      Var i: Integer;
      Begin
          For i := 1 To dimf Do
            Begin
              ar[i] := Nil;
            End;
      End;

  Procedure leerInfo(Var infoaleer: info);
      Begin
          With infoaleer Do
            Begin
              write('Ingrese codigo de materia: ');
              readln(codmat);
              writeln('');

              write('Ingrese dia: ');
              readln(fech.dia);
              writeln('');

              write('Ingrese mes: ');

              readln(fech.mes);
              writeln('');

              write('Ingrese anio: ');

              readln(fech.anio);
              writeln('');

              write('Ingrese codcar: ');

              readln(codcar);
              writeln('');

              write('Ingrese codalu: ');

              readln(codalu);
              writeln('');

              write('Ingrese nota: ');

              readln(nota);
              writeln('');
              writeln('------------------------------------');

            End;
      End;

  Procedure agregarAtras(Var pri: lst; valor: infol);
      Var
          aux, act: lst;
      Begin
          new(aux); aux^.dato := valor;   aux^.sig := Nil;
          If (pri = Nil) Then
            Begin
              pri := aux;
            End
          Else
            Begin
              act := pri;
              While (act^.sig <> Nil) Do
                Begin
                  act := act^.sig;
                End;
              act^.sig := aux;
            End;
      End;

  Procedure armarArray(Var ar: vec);
      Var
          aux: info;datosl: infol;
      Begin
          leerInfo(aux);
          While (aux.codmat <> -1) Do
            Begin
              datosl.codalu := aux.codalu;
              datosl.codmat := aux.codmat;
              datosl.nota := aux.nota;
              datosl.fech := aux.fech;
              agregarAtras(ar [aux.codcar], datosl);
              leerInfo(aux);
            End;
      End;

  Procedure agregarAtrasm(Var pri, ult: lst; valor: infol);
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



  Procedure minimo(Var ar: vec; Var datosMin: infol);
      Var
          indiceMin, i: Integer;
      Begin
          datosMin.codmat := 999;
          indiceMin := -1;
          For i := 1 To dimf Do
            Begin
              If (ar [i] <> Nil) Then
                Begin
                  If (ar [i]^.dato.codmat <= datosMin.codmat) Then//Esta sentencia define el criterio para acumular
                    Begin
                      datosMin := ar [i]^.dato;//Esta reasigna el minimo
                      indiceMin := i;
                    End;
                End;
            End;
          If (indiceMin <> -1) Then
            Begin
              ar[indiceMin] := ar [indiceMin]^.sig;
            End;
      End;


  Procedure merge(ar: vec; Var pri: lst);
      Var
          datosmin: infol;
          ult: lst;
      Begin
          pri := Nil;
          ult := Nil;
          minimo(ar, datosmin);
          While (datosmin.codmat <> 999) Do
            Begin
              agregarAtrasm(pri, ult, datosmin);
              minimo(ar, datosmin);
            End;
      End;

  Procedure agregarAdelante(Var pri: lsta; valor: infola);
      Var
          aux: lsta;
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

  Procedure plantarAcumulador(Var A: abl; dat: infoa; datolst: infola);//nodo que contiene una lista
      Begin
          If (A = Nil) Then
            Begin
              new(A);
              A^.dato := dat;
              agregarAdelante(a^.dato.lstarbol, datolst);
              A^.HI := Nil; A^.HD := Nil;
            End
          Else
              If (dat.codalu < A^.dato.codalu) Then
                Begin plantarAcumulador(A^.HI, dat, datolst); End
              Else
                  If (dat.codalu > A^.dato.codalu) Then
                    Begin plantarAcumulador(A^.HD, dat, datolst); End
                  Else
                    Begin
                      agregarAdelante(a^.dato.lstarbol, datolst);
                    End;
      End;



  Procedure armarNodoArbol(pri: lst; Var a: abl);
      Var   vala: infoa;datolst: infola;
      Begin
          If (pri <> Nil) Then
            Begin
              vala.codalu := pri^.dato.codalu;
              vala.lstarbol := Nil;
              datolst.codmat := pri^.dato.codmat;
              datolst.nota := pri^.dato.nota;
              plantarAcumulador(a, vala, datolst);
              armarNodoArbol(pri^.sig, a);
            End;
      End;

  Procedure imprimirListao(pri: lst);
      Begin
          If (pri <> Nil) Then
            Begin
              Writeln('alu:', pri^.dato.codalu);
              Writeln('materia:', pri^.dato.codmat);
              Writeln('nota:', pri^.dato.nota);
              writeln('-------------------------------------------');
              imprimirListao(pri^.sig);
            End;
      End;

  Procedure imprimirLista(pri: lsta);
      Begin
          If (pri <> Nil) Then
            Begin
              Writeln('materia:', pri^.dato.codmat);
              Writeln('nota:', pri^.dato.nota);
              writeln('-------------------------------------------');
              imprimirLista(pri^.sig);
            End;
      End;

  Procedure recorrerAcotado(a: abl; codmin, codmax: Integer);
      Begin
          If a <> Nil Then
            Begin
              If a^.dato.codalu > codmin Then
                Begin
                  If a^.dato.codalu < codmax Then
                    Begin
                      recorrerAcotado(a^.HI, codmin, codmax);
                      writeln('codalu: ', a^.dato.codalu);
                      imprimirLista(a^.dato.lstarbol);// aca se hace lo que se pide
                      recorrerAcotado(a^.HD, codmin, codmax);
                    End
                  Else
                    Begin
                      recorrerAcotado(a^.HI, codmin, codmax);
                    End;
                End
              Else
                Begin
                  recorrerAcotado(a^.HD, codmin, codmax);
                End;
            End;
      End;
      
  Procedure cuentaNodos(a: abl; Var nodos: Integer);
      Begin
          If (a <> Nil) Then
            Begin
              cuentaNodos(a^.HI, nodos);
              nodos := nodos + 1;
              cuentaNodos(a^.HD, nodos);
            End;
      End;

Var ar: vec;l: lst;a: abl;nodos: Integer;
Begin
  inicializarMerge(ar);
  armarArray(ar);
  l := Nil;
  merge(ar, l);
  //imprimirListao(l);
  a := Nil;
  armarNodoArbol(l, a);
  writeln('Imprimimos aquellos cullo codigo de alumno esta entre 10000 y 11000: ');
  recorrerAcotado(a, 10000{codmin}, 11000{codmax});
  nodos := 0;
  cuentaNodos(a, nodos);
  writeln('Cantidad de alumnos: ', nodos);
  readln;
End.
{Tiempo,38:51.07;Fecha,11/2
  Se desea procesar información de alumnos de la Facultad. De cada alumno se conoce: código de alumno,
código de carrera (1..5), código de materia, fecha examen final (día, mes y año) y nota examen
final.
Se pide implementar un programa que a partir del ingreso de la información de los alumnos:
A- Genere una estructura por cada carrera que contenga código de alumno, código de materia,
fecha y nota, ordenada por código de materia.
 Luego reúna en una única estructura la información de las estructuras ya generadas de las carreras, 
 también ordenada por código de materia.
B- Genere una estructura que permita realizar una 
búsqueda eficiente por código de alumno para informar el código de alumno y
 sus códigos de materias y notas, para aquellos alumnos cuyo
código está entre 10000 y 11000.
C- A partir de la estructura generada en B, informe la cantidad total de alumnos de la Facultad.
}