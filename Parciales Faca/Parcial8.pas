Program Parcial8;
Const
  dimf = 5;//para arrays
Type

  info = Record
      numpa, codact, catact, numsoc, valor: Integer;
    End;

  infol = Record
      numsoc, valor: Integer;
    End;
  lst = ^nodol;

  nodol = Record
      dato: infol;
      sig:  lst;
    End;

  infoa = Record
      numpa, codact, catact: Integer;
      lsta: lst;
    End;


  abl = ^nodoa;
  nodoa = Record
      dato: infoa;
      HI: abl;
      HD: abl;
    End;

  {Procedure leerInfo(Var infoaleer: info);
      Begin
          With infoaleer Do
            Begin
              write('Ingrese numpa: ');
              readln(numpa);
              writeln('');

              write('Ingrese codact: ');
              readln(codact);
              writeln('');

              write('Ingrese catact: ');
              readln(catact);
              writeln('');

              write('Ingrese numsoc: ');
              readln(numsoc);
              writeln('');

              write('Ingrese valor: ');
              readln(valor);
              writeln('');
              writeln('------------------------------------');

            End;
      End;}

  Procedure leerInfo(Var infoaleer: info);
      Begin
          With infoaleer Do
            Begin
              write('Ingrese numpa: ');
              numpa := Random(15);
              writeln(numpa);
              //readln(numpa);
              writeln('');

              write('Ingrese codact: ');
              codact := Random(10)-1;
              writeln(codact);
              //readln(codact);
              writeln('');

              write('Ingrese catact: ');
              catact := Random(50);
              writeln(catact);
              //readln(catact);
              writeln('');

              write('Ingrese numsoc: ');
              numsoc := Random(50);
              writeln(numsoc);
              //readln(numsoc);
              writeln('');

              write('Ingrese valor: ');
              valor := Random(50);
              writeln(valor);
              //readln(valor);
              writeln('');
              writeln('------------------------------------');

            End;
      End;

  Procedure insertarOrdenado(Var pri: lst; valor: infol);
      Var
          act, ant, aux: lst;
      Begin
          new(aux);
          aux^.dato := valor;
          aux^.sig := Nil;
          act := pri;
          ant := pri;

          While (act <> Nil) And (pri^.dato.numsoc < valor.numsoc) Do
            Begin
              ant := act;
              act := act^.sig;
            End;

         {if act=pri Then
          begin
            aux^.sig=pri;
            pri=aux^.sig;
          end
          else
          begin
            ant^.sig=aux;
            aux^.sig=act;
          end;}

          If pri = Nil Then
              pri := aux
          Else
              If act = ant Then
                Begin
                  aux^.sig := pri;
                  pri := aux;
                End
              Else
                Begin
                  ant^.sig := aux;
                  aux^.sig := act;
                End;

      End;

  Procedure plantarAcumulador(Var A: abl; dat: infoa; datolst: infol);//nodo que contiene una lista
      Begin
          If (A = Nil) Then
            Begin
              new(A);
              A^.dato := dat;
              insertarOrdenado(a^.dato.lsta, datolst);
              A^.HI := Nil; A^.HD := Nil;
            End
          Else
              If (dat.codact < A^.dato.codact) Then
                Begin plantarAcumulador(A^.HI, dat, datolst); End
              Else
                  If (dat.codact > A^.dato.codact) Then
                    Begin plantarAcumulador(A^.HD, dat, datolst); End
                  Else
                    Begin
                      insertarOrdenado(a^.dato.lsta, datolst);
                    End;
      End;

  Procedure armarNodoArbol(Var a: abl);
      Var   val: info;vala: infoa;datolst: infol;
      Begin
          leerInfo(val);
          While val.codact <> -1 Do
            Begin
              vala.numpa := val.numpa;
              vala.codact := val.codact;
              vala.catact := val.catact;
              vala.lsta  := Nil;
              datolst.numsoc := val.numsoc;
              datolst.valor := val.valor;
              plantarAcumulador(a, vala, datolst);
              leerInfo(val);
            End;
      End;


  Procedure minimo(Var l1, l2: lst; Var datosMin: infol);
      Begin
          datosMin.numsoc := 999;
          If (l1 <> Nil) And (l2 <> Nil) Then
            Begin
              If (l1^.dato.numsoc < l2^.dato.numsoc) Then
                Begin
                  datosMin := l1^.dato;
                  l1 := l1^.sig;
                End
              Else
                Begin
                  datosMin := l2^.dato;
                  l2 := l2^.sig;
                End;
            End
          Else
            Begin
              If (l1 <> Nil) And (l2 = Nil) Then
                Begin
                  datosMin := l1^.dato;
                  l1 := l1^.sig;
                End
              Else
                  If (l1 = Nil) And (l2 <> Nil) Then
                    Begin
                      datosMin := l2^.dato;
                      l2 := l2^.sig;
                    End;
            End;
      End;


  Procedure agregarAtras(Var pri, ult: lst; valor: infol);
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

  Procedure merge(l1, l2: lst; Var pri: lst);
      Var
          datosmin: infol;
          ult: lst;
      Begin
          pri := Nil;
          ult := Nil;
          minimo(l1, l2, datosmin);
          While (datosmin.numsoc <> 999) Do
            Begin
              agregarAtras(pri, ult, datosmin);
              minimo(l1, l2, datosmin);
            End;
      End;

  Procedure recorrerAcotado(a: abl; bus: Integer; Var lout: lst);
      Begin
          If a <> Nil Then
            Begin
              If a^.dato.codact = bus Then
                Begin
                  lout := a^.dato.lsta;
                End
              Else
                  If a^.dato.codact > bus Then
                    Begin
                      recorrerAcotado(a^.HI, bus, lout);
                    End
                  Else
                    Begin
                      recorrerAcotado(a^.HD, bus, lout);
                    End;
            End;
      End;

  Procedure imprimirLista(pri: lst);
      Begin
          If (pri <> Nil) Then
            Begin
              writeln('numsoc: ', pri^.dato.numsoc);
              Writeln('valor:', pri^.dato.valor);
              writeln('-------------------------------------------');
              imprimirLista(pri^.sig);
            End;
      End;

  Procedure armarMerge(a: abl; Var l: lst);
      Var l1, l2: lst;cod1, cod2: Integer;
      Begin
          l1 := Nil;
          readln(cod1);
          recorrerAcotado(a, cod1, l1);
          imprimirLista(l1);

          l2 := Nil;
          readln(cod2);
          recorrerAcotado(a, cod2, l2);
          imprimirLista(l2);

          merge(l1, l2, l);

      End;

  Procedure totalAct(a: abl; Var cant: Integer);
      Begin
          If (a <> Nil) Then
            Begin
              If a^.dato.catact = 1 Then
                Begin
                  cant := cant + 1;
                End;
              totalAct(a^.HI,cant);
              totalAct(a^.HD,cant);
            End;
      End;

  Procedure contarAcotado(a: abl; codmin, codmax: Integer; Var cant: Integer);
      Begin
          If a <> Nil Then
            Begin
              If a^.dato.codact > codmin Then
                Begin
                  If a^.dato.codact < codmax Then
                    Begin
                      cant := cant + 1;
                      contarAcotado(a^.HI, codmin, codmax, cant);
                      contarAcotado(a^.HD, codmin, codmax, cant);
                    End
                  Else
                    Begin
                      contarAcotado(a^.HI, codmin, codmax, cant);
                    End;
                End
              Else
                Begin
                  contarAcotado(a^.HD, codmin, codmax, cant);
                End;
            End;
      End;


Var a: abl;l: lst;codmin, codmax, cant: Integer;
Begin
  armarNodoArbol(a);
  l := Nil;
  armarMerge(a, l);
  writeln('l');
  imprimirLista(l);
  cant := 0;
  totalAct(a,cant);
  writeln('cantidad total de actividades de la categoria 1: ', cant);

  cant := 0;
  readln(codmin);
  readln(codmax);
  contarAcotado(a, codmin, codmax, cant);
  writeln('cantidad de actividades cuyo codigo esta entre dos valores que se ingresan: ', cant);
  readln;
End.

{Tiempo,46:58.46;codact,11/2
Se desea procesar información de los pagos realizados en distintas actividades por los socios de un club.
De cada pago se conoce número de pago, código de actividad, categoría de la actividad, número
de socio y valor.

Se pide implementar un programa que a partir del ingreso de la información de las actividades:

A- Genere una estructura con la información de los pagos por actividad del club. Para cada
actividad deben almacenarse el código de actividad, categoría y los pagos efectuados por los
socios, ordenados por número de socio. La estructura de actividades debe ser eficiente para la
búsqueda por el código de actividad.

B- Ingrese dos códigos de actividad y genere una única estructura (a partir de los pagos
efectuados por los socios a ambas actividades) ordenada por socio que guarde número de
socio y total pagado para dichas actividades.

C- A partir de la estructura generada en A, informe la cantidad total de actividades de la categoría 10.

D- A partir de la estructura generada en A, informe la cantidad de actividades cuyo código está
entre dos valores que se ingresan.

}