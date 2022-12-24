Program Parcial2;
Type
  info = Record
      codmasc, tipoat, fecha: Integer;
    End;


  abl = ^nodo;

  lst = ^nodol;
  nodol = Record
      dato: Integer;
      sig:  lst;
    End;


  infoa = Record
      codmasc: Integer;
      tipoatlst: lst;
    End;

  nodo = Record
      dato: infoa;
      HI: abl;
      HD: abl;
    End;


  Procedure leerInfo(Var infoaleer: info);// Si se cambia el tipo de registro cambiar solo info
      Begin
          With infoaleer Do
            Begin
              write('Ingrese : ');
              codmasc := Random(20);
              //readln(codmasc);
              writeln(codmasc);
              writeln('');

              write('Ingrese tipoat: ');
              tipoat := Random(9);
              writeln(tipoat);
              //readln(tipoat);
              writeln('');


              write('Ingrese : ');
              fecha := Random(50);
              writeln(fecha);
              //readln(fecha);
              writeln('');
              writeln('------------------------------------');

            End;
      End;

  Procedure agregarAdelante(Var pri: lst; valor: Integer);
      Var
          aux: lst;
      Begin
          new(aux); aux^.dato := valor; aux^.sig := pri;

          pri := aux;
      End;

  Procedure plantarAcumulador(Var A: abl; dat: infoa; datolst: Integer);
      Begin
          If (A = Nil) Then
            Begin
              new(A);
              A^.dato := dat;
              agregarAdelante(a^.dato.tipoatlst, datolst);
              A^.HI := Nil; A^.HD := Nil;
            End
          Else
              If (dat.codmasc < A^.dato.codmasc) Then
                Begin plantarAcumulador(A^.HI, dat, datolst); End
              Else
                  If (dat.codmasc > A^.dato.codmasc) Then
                    Begin plantarAcumulador(A^.HD, dat, datolst); End
                  Else
                    Begin
                      agregarAdelante(a^.dato.tipoatlst, datolst);
                    End;
      End;

  Procedure armarNodoArbol(Var tr: abl);
      Var   val: info;vala: infoa;
      Begin
          leerInfo(val);
          While val.codmasc <> 0 Do
            Begin
              vala.codmasc := val.codmasc;
              vala.tipoatlst := Nil;
              plantarAcumulador(tr, vala, val.tipoat);
              leerInfo(val);
            End;
      End;


  Procedure imprimirLista(pri: lst);
      Begin
          If (pri <> Nil) Then
            Begin
              writeln('codat: ', pri^.dato);
              imprimirLista(pri^.sig);
            End;
      End;


  Procedure recorrerAcotado(ar: abl; codmin, codmax: Integer);
      Begin
          If ar <> Nil Then
            Begin
              If ar^.dato.codmasc > codmin Then
                Begin
                  If ar^.dato.codmasc < codmax Then
                    Begin
                      recorrerAcotado(ar^.HI, codmin, codmax);
                      imprimirLista(ar^.dato.tipoatlst);// aca se hace lo que se pide
                      recorrerAcotado(ar^.HD, codmin, codmax);
                    End
                  Else
                    Begin
                      recorrerAcotado(ar^.HI, codmin, codmax);
                    End;
                End
              Else
                Begin
                  recorrerAcotado(ar^.HD, codmin, codmax);
                End;
            End;
      End;


  Function sumarLista(pri: lst; bus: Integer): Integer;
      Begin
          If (pri <> Nil) Then
            Begin
              If pri^.dato = bus Then //Esta sentencia establece el criterio
                  sumarLista := sumarLista(pri^.sig, bus) + 1//En esta se suman los valores
              Else
                  sumarLista := 0 + sumarLista(pri^.sig, bus);
            End
          Else
              sumarLista := 0;
      End;

  Procedure cantAtencionescod(ar: abl; codig: Integer; Var suma: Integer);
      Begin
          If ar <> Nil Then
            Begin
              suma := suma + sumarLista(ar^.dato.tipoatlst, codig);// aca se hace lo que se pide
              cantAtencionescod(ar^.HI, codig, suma);
              cantAtencionescod(ar^.HD, codig, suma);
            End;
      End;

  Procedure orden(a: abl);
      Begin
          If (a <> Nil) Then
            Begin
              orden(a^.HI);
              writeln('Valor codmasc: ', a^.dato.codmasc);
              imprimirLista(a^.dato.tipoatlst);
              writeln('-------------------------------------------');
              orden(a^.HD);
            End;
      End;


Var
  a: abl;codin, cant: Integer;
Begin
  a := Nil;
  armarNodoArbol(a);
  orden(a);
  readln;
  cant := 0;
  codin := 5;
  //readln(codin);
  cantAtencionescod(a, codin, cant);
  recorrerAcotado(a, 1, 20);
  writeln(cant);
  readln;
End.
{PHOTO-2018-09-24-21-30-54}