{busca el ISBN minimo para poner primero en la lista}
Procedure minimo (var v: vector; var prestamoMin: prestamoAGuardar);
   var indiceMin,i:integer;
   Begin
     prestamoMin.ISBN:= valorGrande;
     for i:= 1 to dimF do {carga todo el vector}
     begin
       if (v[i] <> nil) {si la lista del vector no esta vacia/ no se llego al final}
       then if (v [i]^.dato.ISBN <= prestamoMin.ISBN) {si el ISBN de la lista es menor a 9999 }
            then begin
                   indiceMin:= i; {se guarda la posicion del vector del ISBN más chico}
                   prestamoMin:= v [i]^.dato;  {se guarda el prestamo de isbn más chico}
                 end; 
     end;
     if (prestamoMin.ISBN <> valorGrande) {si el prestamo minimo es distinto a 9999}
     then v[indiceMin]:= v[indiceMin]^.sig; {avanza a la siguiente posicion de la lista}
   end;
   
 procedure Merge (v: vector; var l: lista);
   
   {agrega atras en la lista}
   procedure AgregarAtras (var l, ult: lista; p: prestamoAGuardar); 
   var  nuevo: lista;
   begin 
     new (nuevo); nuevo^.dato:= p; nuevo^.sig := nil;
     if (l = nil) then l:= nuevo
                  else ult^.sig := nuevo;
     ult := nuevo;
   end;


{genera el merge}
var prestamoMin: prestamoAGuardar; ult: lista;
begin
  l:= nil;
  minimo (v, prestamoMin);
  while (prestamoMin.ISBN <> valorGrande) do
  begin
    agregarAtras(l, ult, prestamoMin);
    minimo (v, prestamoMin);
  end;
end;  

{imprime la lista merge generada}
procedure imprimirEstructuraMerge (l: lista);
begin
  writeln;
  writeln ('----- Estructura merge ----->');
  writeln;
  if (l = nil ) 
     then writeln ('      Sin elementos')
     else imprimirLista (l);
