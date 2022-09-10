 Procedure minimo(Var todos: arr; Var datosMin: info);
      Var
          indiceMin, i: Integer;
      Begin
          datosMin.cod := 999;
          indiceMin := -1;
          For i := 1 To dimf Do
              If (todos [i] <> Nil) Then
                  If (todos [i]^.dato.cod <= datosMin.Cod) Then//Esta sentencia define el criterio para acumular
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

  Procedure mergeAcumulador(ar: arr; Var nuevo: lstm);
      Var
          min: info;
          actual: Integer;
          totalcant: Integer;
          prodNuevo: infom;
      Begin
          nuevo := Nil;
          minimo(ar, min);
          While (min.cod <> 999) Do
            Begin
              actual := min.cod;
              totalcant := 0;
              While ((min.cod <> 999) And (actual = min.cod)) Do
                Begin
                  totalcant := totalcant + min.cant;
                  minimo(ar, min);
                End;
              prodNuevo.cant := totalcant;
              prodNuevo.cod  := actual;
              agregarAdelante(nuevo, prodNuevo);
            End;
      End;
