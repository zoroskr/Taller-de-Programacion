procedure GenerarVectorListas (var v: vector);
   {inicializa el vector en nil}
   procedure CrearListasEnVector (var v: vector);
   var i: integer;
   begin
     for i:= 1 to dimF do
        v [i]:= nil
   end;
   {lee prestamos hasta que se ingrese un isbn -1}
   procedure LeerPrestamo (var p: prestamo);
   begin
     write ('Ingrese ISBN: ');
     readln (p.ISBN);
     If (p.ISBN <> -1)
     then begin
            write ('Ingrese numero de socio: ');
            p.numeroSocio:= Random (100) + 100;
            writeln (p.numeroSocio);
            write ('Ingrese dia: ');
            p.dia:= Random (30) + 1;
            writeln (p.dia);
            write ('Ingrese mes: ');
            readln (p.mes);
            write ('Ingrese cantidad: ');
            p.cantDias:= Random (14) + 1;
            writeln (p.cantDias);
           end;
   end;


	{insertar ordenado por isbn}
   procedure InsertarElementoEnLista(var l: Lista; pG: prestamoAGuardar);
   var ant, nuevo, act: lista;
   begin
     new (nuevo);
     nuevo^.dato := pG;
     act := l;
     {Recorro mientras no se termine la lista y no encuentro la posición correcta}
     while (act <> NIL) and (act^.dato.ISBN < pG.ISBN) do begin
        ant := act;
        act := act^.sig ;
     end;
     if (act = l)  then l:= nuevo   {el dato va al principio}
                   else ant^.sig  := nuevo; {va entre otros dos o al final}
     nuevo^.sig := act ;
   end;

   {toma los datos del record exceptuando los que no necesita}
   procedure ArmarPrestamoAguardar (p: prestamo; var pG: prestamoAGuardar);
   begin
     pG.ISBN:= p.ISBN;
     pG.numeroSocio:= p.numeroSocio;
     pG.dia:= p.dia;
     pG.cantDias:= p.cantDias;
   end;

{carga la lista de prestamos}
var p: prestamo; pG: prestamoAGuardar;
begin
  CrearListasEnVector (v); {inicializa el vector}
  LeerPrestamo (p); {lee un prestamo}
   while (p.ISBN <> -1) do {mientras el isbn del prestamo no sea -1}
   begin
     ArmarPrestamoAguardar (p, pG); {toma los datos que necesita}
     InsertarElementoEnLista (v[p.mes], pG); {inserta ordenado en el vector de listas}
     LeerPrestamo (p); {lee otro prestamo}
   end;
end;
