Program Parcial5;
Type

  info = Record
      nombre: String;
      DNI, puntos: Integer;
    End;

  infoa = Record
      DNI, cantjugado, puntos: Integer;
    End;

  abl = ^nodoa;
  nodoa = Record
      dato: infoa;
      HI: abl;
      HD: abl;
    End;

  Procedure leerInfo(Var infoaleer: info);
      Begin
          With infoaleer Do
            Begin
              write('Ingrese nombre: ');
              readln(nombre);
              writeln('');

              write('Puntos: ');
              puntos := 0;
              writeln(puntos);
              writeln('');

              write('Ingrese Dni: ');
              readln(Dni);
              writeln('');

              writeln('------------------------------------');

            End;
      End;

  Procedure plantarAcumulador(Var A: abl; dat: infoa);
      Begin
          If (A = Nil) Then
            Begin
              new(A);
              A^.dato := dat;
              A^.HI := Nil; A^.HD := Nil;
            End
          Else
              If (dat.dni < A^.dato.dni) Then
                Begin plantarAcumulador(A^.HI, dat); End
              Else
                  If (dat.dni > A^.dato.dni) Then
                    Begin plantarAcumulador(A^.HD, dat); End
                  Else
                    Begin
                      A^.dato.cantjugado := A^.dato.cantjugado + 1;
                    End;
      End;


  Procedure armarNodoArbol(Var a: abl);
      Var   val: info;vala: infoa; 
      Begin
          leerInfo(val);
          While val.nombre <> 'ZZZ' Do
            Begin
              vala.DNI := val.dni;
              vala.puntos := val.puntos;
              vala.cantjugado := 1;
              plantarAcumulador(a, vala);
              leerInfo(val);
            End;
      End;

  Procedure recorrerAcotado(a: abl; bus, puntin: Integer);
      Begin
          If a <> Nil Then
            Begin
              If a^.dato.dni = bus Then
                Begin
                  a^.dato.puntos := a^.dato.puntos + puntin;
                End
              Else
                  If a^.dato.dni > bus Then
                    Begin
                      recorrerAcotado(a^.HI, bus, puntin);
                    End
                  Else
                    Begin
                      recorrerAcotado(a^.HD, bus, puntin);
                    End;
            End;
      End;

  Procedure orden(a: abl);
      Begin
          If (a <> Nil) Then
            Begin
              orden(a^.HI);
              writeln('Valor DNI: ', a^.dato.DNI);
              writeln('Valor puntos: ', a^.dato.puntos);
              writeln('Valor cantjugado: ', a^.dato.cantjugado);
              writeln('-------------------------------------------');
              orden(a^.HD);
            End;
      End;

Var a: abl;dnibus, puntosganados: Integer;
Begin
  a := Nil;
  //armarNodoArbol(a);
  readln(dnibus);
  //dnibus := 2;
  readln(puntosganados);
  puntosganados := 10;
  recorrerAcotado(a, dnibus, puntosganados);
  orden(a);
  readln;
End.
  {Tiempo,18:30.67;Fecha,11/2
Un programa televisivo de juegos de preguntas y respuestas necesita un sistema que permita la carga y la b??squeda de los participantes.
Por ello, necesita registrar en una estructura la informaci??n de los participantes: nombre, DNI, puntos acumulados durante su participaci??n en el juego y la cantidad de veces que jugo.

1. Realice un m??dulo que cargue la estructura de participantes, leyendo la informaci??n de los mismos hasta ingresar el participante con nombre ???ZZZ???. 
Esta estructura debe ser eficiente para la b??squeda por DNI del participante.

2. Realice un m??dulo que permita sumarle X puntos a un participante cuando ??ste responde bien una pregunta. Este m??dulo debe recibir la estructura generada en 1),
 el DNI del cliente y el puntaje X recibido por su respuesta. Suponiendo que el cliente existe en la estructura, actualice el puntaje de ??ste.

3. Realice un m??dulo que devuelva la lista de participantes que tengan un puntaje mayor a un valor X recibido por par??metro.
4. Realice el programa principal que invoque a los m??dulos implementados e informe lo que ??stos devuelven.}