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
  writeln('la suma de todos los montos vendidos para los c??digos de productos mayores al c??digo recibido: ',sumarPorValor(a,5));
  readln;

End.{Tiempo,15:10.46;Fecha,1/2}
{
Se lee informaci??n acerca de las ventas de productos realizadas en las sucursales de una empresa. 

De cada venta se conoce fecha, c??digo de producto, cantidad vendida y monto total de la venta. 

La lectura finaliza cuando se lee el c??digo de producto -1, el cual no se procesa. 

Implementar un programa para que a partir de la informaci??n leida, resuelva los siguientes ??tems:

a)Generar un ??rbol binario de b??squeda ordenado por c??digo de producto, donde cada nodo contenga el c??digo del producto y el monto total vendido. 
El c??digo de producto no puede repetirse en el ??rbol.

b)Realizar un m??dulo que reciba el ??rbol generado en a. y un c??digo de producto y 
retorne la suma de todos los montos vendidos para los c??digos de productos mayores al c??digo recibido. 
Nota: La informaci??n se lee en forma desordenada. 
Puede existir m??s de una venta para un mismo c??digo de producto.

}