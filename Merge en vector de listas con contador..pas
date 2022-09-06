procedure MergeAcumulador (v: vector; var l: listaAcumulador);

	{genera otro agregar atras}
   procedure agregarAtras2 (var l, ult: listaAcumulador; e: elemAcumulador); 
   var  nuevo: listaAcumulador;
   begin 
     new (nuevo); nuevo^.dato:= e; nuevo^.sig := nil;
     if (l = nil) then l:= nuevo
                  else ult^.sig := nuevo;
     ult := nuevo;
   end;
{Un módulo que reciba la estructura generada en a. y retorne una nueva estructura ordenada ISBN, donde cada ISBN aparezca una vez junto a 
la cantidad total de veces que se prestó durante el año 2021.}

var prestamoMin: prestamoAGuardar; 
    ult: listaAcumulador;
    actual: elemAcumulador;
begin
  l:= nil; {inicaliza la lista en nil}
  minimo (v, prestamoMin); {busca el minimo}
  while (prestamoMin.ISBN <> valorGrande) do {compara que haya un nuevo minimo}
  begin
    actual.ISBN:= prestamoMin.ISBN; actual.cantPrestamos:= 0;
    while (actual.ISBN = prestamoMin.ISBN) do
    begin
       actual.cantPrestamos:= actual.cantPrestamos + 1;
       minimo (v, prestamoMin);
    end;
    agregarAtras2 (l, ult, actual);
  end;
end;


{imprime el nuevo merge}
procedure ImprimirEstructuraMergeAcumulador (l: listaAcumulador);

  procedure imprimirListaAcumulador (l: listaAcumulador);
  begin
     if (l <> nil) then 
     begin
        writeln('      ISBN: ', l^.dato.ISBN, '  Cantidad prestamos: ', l^.dato.cantPrestamos);
        imprimirListaAcumulador (l^.sig);
     end;
  end;
  
begin
  writeln;
  writeln ('----- Estructura merge acumulador ----->');
  writeln;
  if (l = nil ) 
     then writeln ('      Sin elementos')
     else imprimirListaAcumulador (l);
end;

