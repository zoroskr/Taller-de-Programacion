Program Ejercicio1r;
Type
  info = Record
      sucu, fecha, num, dni, min: Integer;
    End;

  infoa = Record
      num, dni, min: Integer;
    End;

  abl = ^nodo;

  nodo = Record
      dato: infoa;
      HI, HD: abl;
    End;

  lst = ^nodol;

  nodol = Record
      dato: Integer;
      sig:  lst;
    End;


  Procedure leerInfo(Var infoaleer: info);// Si se cambia el tipo de registro cambiar solo info
      Begin
          With infoaleer Do
            Begin
              write('Ingrese sucursal: ');
              sucu := Random(15);
              //readln(sucu);
              writeln(sucu);
              writeln('');

              write('Ingrese fecha: ');
              fecha := Random(9);
              writeln(fecha);
              //readln(fecha);
              writeln('');

              write('Ingrese dni: ');
              dni := Random(9);
              writeln(dni);
              //readln(dni);
              writeln('');


              write('Ingrese numero de cliente: ');
              num := Random(20) - 1;
              writeln(num);
              //readln(num);
              writeln('');


              write('Ingrese minutos: ');
              min := Random(50);
              writeln(min);
              //readln(min);
              writeln('');
              writeln('------------------------------------');

            End;
      End;

  Procedure plantarAcumulador(Var A: abl; dat: infoa);
      Begin
          If (A = Nil) Then
            Begin
              new(A);
              A^.dato := dat; A^.HI := Nil; A^.HD := Nil;
            End
          Else
              If (dat.num < A^.dato.num) Then
                Begin plantarAcumulador(A^.HI, dat); End
              Else
                  If (dat.num > A^.dato.num) Then
                    Begin plantarAcumulador(A^.HD, dat); End
                  Else
                    Begin
                      A^.dato.min := A^.dato.min + dat.min;
                    End;
      End;

  Procedure armarNodoArbol(Var tr: abl);
      Var   val: info;vala: infoa;
      Begin
          leerInfo(val);
          While val.num <> -1 Do
            Begin
              vala.num := val.num;
              vala.dni := val.dni;
              vala.min := val.min;
              plantarAcumulador(tr, vala);
              leerInfo(val);
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

  Procedure recorrerAcotado(ar: abl; codmin: Integer; Var l: lst);
      Begin
          If ar <> Nil Then
            Begin
              If ar^.dato.num >= codmin Then
                Begin
                  If ar^.dato.min > 60 Then
                    Begin
                      agregarAdelante(l, ar^.dato.num);// aca se hace lo que se pide
                    End;
                  recorrerAcotado(ar^.HI, codmin, l);
                  recorrerAcotado(ar^.HD, codmin, l);
                End
              Else
                Begin
                  recorrerAcotado(ar^.HD, codmin, l);
                End;
            End;
      End;

  Procedure imprimirLista(pri: lst);
      Begin
          If (pri <> Nil) Then
            Begin
              writeln('num: ', pri^.dato);
              writeln('-------------------------------------------');
              imprimirLista(pri^.sig);
            End;
      End;

Var
  a: abl;l: lst;aux: Integer;
Begin
  a := Nil;
  l := Nil;
  armarNodoArbol(a);
  aux := 5;
  //readln(aux);
  recorrerAcotado(a, aux, l);
  imprimirLista(l);
  readln;
End.
{
Una cadena de gimnasios que tiene 5 sucursales necesita procesar las asistencias de los clientes.
Implementar un programa en Pascal con:

a) Un módulo que lea la información de las asistencias realizadas en cada sucursal y que genere un árbol ordenado por número de cliente,
 donde cada nodo contenga |número de cliente, dni y la cantidad total de minutos asistidos en todas las sucursales|. 

De cada asistencia se lee: código de sucursal (1..5), dni del cliente, número de cliente, fecha y cantidad de minutos que asistió. 
La lectura finaliza con el número de cliente -1, el cual no se procesa.

b) Un módulo que reciba el árbol generado en a) y un número de cliente y devuelva una lista con los números de los clientes
 cuyo número sea mayor al número ingresado y la cantidad total de minutos es superior a 60.
}