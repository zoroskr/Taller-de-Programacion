Program Ejercicio8;
Type

  info = Record
      fecha, codprod, cant, monto: Integer;
    End;

  infoa = Record
      codprod, monto: Integer;
    End;


  abl = ^nodo;
  nodo = Record
      dato: infoa;
      HI: abl;
      HD: abl;
    End;

  Procedure leerInfo(Var infoaleer: info);
      Begin
          With infoaleer Do
            Begin
              write('Ingrese codprod: ');
              codprod := Random(15) - 1;
              //readln(codprod);
              writeln(codprod);
              writeln('');

              write('Ingrese fecha: ');
              fecha := Random(9);
              writeln(fecha);
              //readln(fecha);
              writeln('');

              write('Ingrese cant: ');
              cant := Random(50);
              writeln(cant);
              //readln(cant);
              writeln('');

              write('Ingrese monto: ');
              monto := Random(50);
              writeln(monto);
              //readln(monto);
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
              If (dat.codprod < A^.dato.codprod) Then
                Begin plantarAcumulador(A^.HI, dat); End
              Else
                  If (dat.codprod > A^.dato.codprod) Then
                    Begin plantarAcumulador(A^.HD, dat); End
                  Else
                    Begin
                      A^.dato.monto := A^.dato.monto + dat.monto;
                    End;
      End;

  Procedure armarNodoArbol(Var tr: abl);
      Var   val: info;vala: infoa;
      Begin
          leerInfo(val);
          While val.codprod <> -1 Do
            Begin
              vala.codprod := val.codprod;
              vala.monto := val.monto;
              plantarAcumulador(tr, vala);
              leerInfo(val);
            End;
      End;

  Function sumarPorValor(a: abl; valor: Integer): Integer;
      Begin
          If (a <> Nil) Then
            Begin
              If (a^.dato.codprod > valor) Then
                  sumarPorValor := a^.dato.monto + sumarPorValor(a^.HI, valor) + sumarPorValor(a^.HD, valor)
              Else
                  sumarPorValor := 0 + sumarPorValor(a^.HD, valor);
            End
          Else
              sumarPorValor := 0;
      End;

Var
  a: abl;valormas:integer;
Begin
  a := Nil;
  armarNodoArbol(a);
  //readln(valormas);
  valormas:=5;
  writeln('la suma de todos los montos vendidos para los códigos de productos mayores al código recibido: ',sumarPorValor(a,5));
  readln;

End.{Tiempo,15:10.46;Fecha,1/2}
{
Se lee información acerca de las ventas de productos realizadas en las sucursales de una empresa. 

De cada venta se conoce fecha, código de producto, cantidad vendida y monto total de la venta. 

La lectura finaliza cuando se lee el código de producto -1, el cual no se procesa. 

Implementar un programa para que a partir de la información leida, resuelva los siguientes ítems:

a)Generar un árbol binario de búsqueda ordenado por código de producto, donde cada nodo contenga el código del producto y el monto total vendido. 
El código de producto no puede repetirse en el árbol.

b)Realizar un módulo que reciba el árbol generado en a. y un código de producto y 
retorne la suma de todos los montos vendidos para los códigos de productos mayores al código recibido. 
Nota: La información se lee en forma desordenada. 
Puede existir más de una venta para un mismo código de producto.

}