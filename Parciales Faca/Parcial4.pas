Program Parcial4;
Type
  info = Record
      codcli, codpi, monto: Integer;
    End;

  lst = ^nodol;

  nodol = Record
      dato: Integer;
      sig:  lst;
    End;

  infoa = Record
      codcli, monto: Integer;
      lstpi: lst;
    End;

  abl = ^nodo;
  nodo = Record
      dato: infoa;
      HI: abl;
      HD: abl;
    End;

  Procedure leerInfo(Var infoaleer: info);// Si se cambia el tipo de registro cambiar solo info
      Begin
          With infoaleer Do
            Begin
              write('Ingrese codcli: ');
              codcli := Random(300);
              //readln(codcli);
              writeln(codcli);
              writeln('');

              write('Ingrese codpi: ');
              codpi := Random(9);
              writeln(codpi);
              //readln(codpi);
              writeln('');


              write('Ingrese monto: ');
              monto := Random(200);
              writeln(monto);
              //readln(monto);
              writeln('');
              writeln('------------------------------------');

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

  Function buscarVal(pri: lst; valin: Integer): Boolean;
      var aux:boolean;
      Begin
      aux:=false;
          while (pri<> nil) and (aux=false) do
            begin
              If (pri^.dato = valin) Then
              begin
                aux:=true;
              end;
              pri:=pri^.sig;
            end;
        buscarVal:=aux;
      End;

  Procedure plantarAcumulador(Var A: abl; dat: infoa; datolstin: Integer);
      Begin
          If (A = Nil) Then
            Begin
              new(A);
              A^.dato := dat; A^.HI := Nil; A^.HD := Nil;
              agregarAdelante(a^.dato.lstpi, datolstin);
            End
          Else
              If (dat.codcli < A^.dato.codcli) Then
                Begin plantarAcumulador(A^.HI, dat, datolstin); End
              Else
                  If (dat.codcli > A^.dato.codcli) Then
                    Begin plantarAcumulador(A^.HD, dat, datolstin); End
                  Else
                    Begin
                      If buscarVal(a^.dato.lstpi, datolstin) = False Then
                        Begin
                          agregarAdelante(a^.dato.lstpi, datolstin);
                        End;
                      A^.dato.monto := A^.dato.monto + dat.monto;
                    End;
      End;

  Procedure armarNodoArbol(Var tr: abl);
      Var   val: info;vala: infoa;
      Begin
          leerInfo(val);
          While val.codcli <> 0 Do
            Begin
              vala.codcli := val.codcli;
              vala.monto  := val.monto;
              vala.lstpi  := Nil;
              plantarAcumulador(tr, vala, val.codpi);
              leerInfo(val);
            End;
      End;

  Procedure imprimirLista(pri: lst);
      Begin
          If (pri <> Nil) Then
            Begin
              writeln('codpi: ', pri^.dato);
              writeln('-------------------------------------------');
              imprimirLista(pri^.sig);
            End;
      End;

  Procedure recorrerAcotado(ar: abl; codmin, codmax: Integer);
      Begin
          If ar <> Nil Then
            Begin
              If ar^.dato.codcli > codmin Then
                Begin
                  If ar^.dato.codcli < codmax Then
                    Begin
                      recorrerAcotado(ar^.HI, codmin, codmax);
                      imprimirLista(ar^.dato.lstpi);// aca se hace lo que se pide
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

  Procedure preOrden(a: abl; min, max: Integer; Var tot: Integer);
      Begin
          If (a <> Nil) Then
            Begin
              If (a^.dato.monto > min) Then
                Begin
                  If (a^.dato.monto < max) Then
                    Begin
                      tot := tot + 1;
                    End;
                End;
              preOrden(a^.HI, min, max, tot);
              preOrden(a^.HD, min, max, tot);
            End;
      End;

Var
  a: abl;cantcli: Integer;
Begin
  a := Nil;
  armarNodoArbol(a);
  cantcli := 0;
  preOrden(a, 600, 1100, cantcli);
  writeln('cantcli: ', cantcli);
  recorrerAcotado(a, 170, 300);
  readln;
End.