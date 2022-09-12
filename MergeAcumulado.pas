   Procedure agregarAtrasm(Var pri, ult: lstm; valor: infom);
      Var
          aux: lstm;
      Begin
          new(aux);   aux^.dato := valor;     aux^.sig := Nil;
          If pri = Nil Then
            Begin
              pri := aux;
              ult := aux;
            End;
          ult^.sig := aux;
          ult := aux;
      End;
 
 
 Procedure minimo(Var todos: arr; Var datosMin: info); // se pasa el vector por referencia al igual que el dato
      Var
          indiceMin, i: Integer;
      Begin
          datosMin.cod := 999;
          indiceMin := -1;
          For i := 1 To dimf Do //Recorro todas las posiciones del vector
              If (todos [i] <> Nil) Then // Si no se termino la lista del vector o la lista no esta vacia sigo
                  If (todos [i]^.dato.cod <= datosMin.Cod) Then//Esta sentencia define el criterio para acumular
                    Begin
                      datosMin := todos [i]^.dato;//Esta reasigna el minimo
                      indiceMin := i;
                    End;
          If (indiceMin <> -1) Then // si el vector no esta vacio o si no se termino de recorrer
            Begin
              datosMin := todos [indiceMin]^.dato; //me guardo el minimo
              todos[indiceMin] := todos [indiceMin]^.sig; //avanzo a las siguiente posicion de la lista de donde saque el minimo
            End;
      End;

  Procedure mergeAcumulador(ar: arr; Var nuevo: lstm); // se pasa el vector por valor y la lista merge por referencia
      Var
          min: info; // dato minimo
          actual: Integer; // para saber si sigo con el mismo codigo
          totalcant: Integer; // suma la cantidad de todos los codigos iguales
          prodNuevo: infom; // dato a cargar en la lista
      Begin
          nuevo := Nil; //se inicializa la lista merge en nil
          minimo(ar, min); //se busca un minimo
          While (min.cod <> 999) Do //si el vector no esta vacio o no se termino
            Begin
              actual := min.cod; //me guardo el codigo del dato actual
              totalcant := 0; // inicializo la variable contadora en 0
              While ((min.cod <> 999) And (actual = min.cod)) Do // mientras este leyendo la misma venta
                Begin
                  totalcant := totalcant + min.cant; //sumo la cantidad de la venta
                  minimo(ar, min); //busco otro minimo
                End;
              prodNuevo.cant := totalcant; // asigno los campos
              prodNuevo.cod  := actual;
              agregarAdelante(nuevo, prodNuevo); //agrego atras o adelante en la lista
            End;
      End;
