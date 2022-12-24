Program parcial6;
Type

  info = Record
      dni, fecha, monto: Integer;
      nom: String;
    End;

  infol = Record
      fecha, monto: Integer;
    End;

  lst = ^nodol;

  nodol = Record
      dato: infol;
      sig:  lst;
    End;


  infoa = Record
      dni: Integer;
      nom: String;
      lsta: lst;
    End;

  abl = ^nodoa;
  nodoa = Record
      dato: infoa;
      HI: abl;
      HD: abl;
    End;

  lstniv = ^nodo3;
  nodo3  = Record
      info: abl;
      sig:  lstniv;
    End;

  Procedure leerInfo(Var infoaleer: info);
      Begin
          With infoaleer Do
            Begin
              write('Ingrese dni: ');
              dni := Random(15);
              //readln(dni);
              writeln(dni);
              writeln('');

              write('Ingrese fecha: ');
              fecha := Random(9);
              writeln(fecha);
              //readln(fecha);
              writeln('');

              write('Ingrese nom: ');
              //nom := Random(50);
              nom := 'nom';
              writeln(nom);
              //readln(nom);
              writeln('');

              write('Ingrese monto: ');
              monto := Random(50);
              writeln(monto);
              //readln(monto);
              writeln('');
              writeln('------------------------------------');

            End;
      End;

  Procedure agregarAdelante(Var pri: lst; valor: infol);
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


  Procedure plantarAcumulador(Var A: abl; dat: infoa; datolst: infol);//nodo que contiene una lista
      Begin
          If (A = Nil) Then
            Begin
              new(A);
              A^.dato := dat;
              A^.HI := Nil; A^.HD := Nil;
              agregarAdelante(a^.dato.lsta, datolst);
            End
          Else
              If (dat.dni < A^.dato.dni) Then
                Begin plantarAcumulador(A^.HI, dat, datolst); End
              Else
                  If (dat.dni > A^.dato.dni) Then
                    Begin plantarAcumulador(A^.HD, dat, datolst); End
                  Else
                    Begin
                      agregarAdelante(a^.dato.lsta, datolst);
                    End;
      End;

  Procedure armarNodoArbol(Var a: abl);
      Var   val: info;vala: infoa;datolst: infol;
      Begin
          leerInfo(val);
          While val.monto <> 0 Do
            Begin
              vala.dni := val.dni;
              vala.nom := val.nom;
              vala.lsta := Nil;
              datolst.fecha := val.fecha;
              datolst.monto := val.monto;
              plantarAcumulador(a, vala, datolst);
              leerInfo(val);
            End;
      End;

  Function sumarVal(pri: lst; bus: Integer): Integer;
      Begin
          If (pri <> Nil) Then
            Begin
              If pri^.dato.fecha = bus Then
                  sumarVal := sumarVal(pri^.sig, bus) + 1
              Else
                  sumarVal := 0 + sumarVal(pri^.sig, bus);
            End
          Else
              sumarVal := 0;
      End;


  Procedure sumaarbol(a: abl; Var suma: Integer; bus: Integer);
      Begin
          If (a <> Nil) Then
            Begin
              suma := sumarVal(a^.dato.lsta, bus) + suma;
              sumaarbol(a^.HI, suma, bus);
              sumaarbol(a^.HD, suma, bus);
            End;
      End;

  Procedure sumavalores(pri: lst; Var montotot, pedidostot: Integer);
      Begin
          If (pri <> Nil) Then
            Begin
              montotot := montotot + pri^.dato.monto;
              pedidostot := pedidostot + 1;
              sumavalores(pri^.sig, montotot, pedidostot);
            End;
      End;

  Procedure recorrerAcotado(a: abl; bus: Integer; Var montotot, pedidostot: Integer);
      Begin
          If a <> Nil Then
            Begin
              If a^.dato.dni = bus Then
                Begin
                  sumavalores(a^.dato.lsta, montotot, pedidostot);
                End
              Else
                  If a^.dato.dni > bus Then
                    Begin
                      recorrerAcotado(a^.HI, bus, montotot, pedidostot);
                    End
                  Else
                    Begin
                      recorrerAcotado(a^.HD, bus, montotot, pedidostot);
                    End;
            End;
      End;

  Procedure imprimirLista(pri: lst);
      Begin
          If (pri <> Nil) Then
            Begin
              writeln('fecha: ', pri^.dato.fecha);
              Writeln('monto:', pri^.dato.monto);
              writeln('-------------------------------------------');
              imprimirLista(pri^.sig);
            End;
      End;

  Procedure orden(a: abl);
      Begin
          If (a <> Nil) Then
            Begin
              orden(a^.HI);
              writeln('Valor dni: ', a^.dato.dni);
              imprimirLista(a^.dato.lsta);
              writeln('-------------------------------------------');
              orden(a^.HD);
            End;
      End;

{------------------------------------------ MODULOS DEL IMPRIMIR ------------------------------------------}

{-------------- CONTARELEMENTOS - Devuelve la cantidad de elementos de una lista l --------------}

  Function ContarElementos(l: lstniv): Integer;
      Var c: Integer;
      Begin
          c := 0;
          While (l <> Nil) Do
            Begin
              c := c + 1;
              l := l^.sig;
            End;
          contarElementos := c;
      End;


{--------------- AGREGARATRAS - Agrega un elemento atras en l ----------------------------}

  Procedure AgregarAtras(Var l, ult: lstniv; a: abl);
      Var
          nue: lstniv;
      Begin
          new(nue);
          nue^.info := a;
          nue^.sig  := Nil;
          If l = Nil Then
              l := nue
          Else ult^.sig := nue;
          ult := nue;
      End;


{------------------- IMPRIMIRPORNIVEL - Muestra los datos del arbol a por niveles ------------------------------------------}

  Procedure imprimirpornivel(a: abl);
      Var
          l, aux, ult: lstniv;
          nivel, cant, i: Integer;
      Begin
          l := Nil;
          ult := Nil;
          If (a <> Nil) Then
            Begin
              nivel := 0;
              agregarAtras(l, ult, a);
              While (l <> Nil) Do
                Begin
                  nivel := nivel + 1;
                  cant  := contarElementos(l);
                  write('Nivel ', nivel, ': ');
                  For i := 1 To cant Do
                    Begin
                      write(l^.info^.dato.dni, ' - ');
                      If (l^.info^.HI <> Nil) Then
                          agregarAtras(l, ult, l^.info^.HI);
                      If (l^.info^.HD <> Nil) Then
                          agregarAtras(l, ult, l^.info^.HD);
                      aux := l;
                      l := l^.sig;
                      dispose(aux);
                    End;
                  writeln;
                End;
            End;
      End;

Var
  a: abl;cantfecha, dniin, montotot, pedidostot, suma: Integer;
Begin
  a := Nil;
  armarNodoArbol(a);
  orden(a);
  //readln(cantfecha);
  cantfecha := 5;
  suma := 0;
  sumaarbol(a, suma, cantfecha);
  writeln('suma: ', suma);
  //readln(dniin);
  dniin := 5;
  montotot := 0;
  pedidostot := 0;
  recorrerAcotado(a, dniin, montotot, pedidostot);
  writeln('montotot: ', montotot);
  writeln('pedidostot: ', pedidostot);
  imprimirpornivel(a);
  ReadLn;
End.{Tiempo,38:25.32;Fecha,7/2}