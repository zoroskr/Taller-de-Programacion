procedure GenerarArbol (var a: arbol);

  Procedure LeerVenta (var s: venta);
  begin
    write ('Ingrese numero del codigo: ');
    readln (s.codigo);
    If (s.codigo <> -1)
    then begin
          { write ('Ingrese fecha: ');
           readln (s.fecha);}
           write ('Ingrese cantidad: ');
           readln (s.cantidad);
           {write ('Ingrese monto: ');
           readln (s.monto);}
         end;
  end;  
  

  Procedure ArmarVentaAguardar (s: venta; var sG: ventaGenerada);
  begin
	sG.codigo:= s.codigo;
	sG.cantidad:= s.cantidad;
  end;
  
  Procedure InsertarElemento (var a: arbol; elem: ventaGenerada);
  Begin
    if (a = nil) 
    then begin
           new(a);
           a^.dato:= elem; 
           a^.HI:= nil; 
           a^.HD:= nil;
         end
    else if (elem.codigo = a^.dato.codigo) then
		a^.dato.cantidad := a^.dato.cantidad + elem.cantidad
    else if (elem.codigo < a^.dato.codigo) 
         then InsertarElemento(a^.HI, elem)
         else InsertarElemento(a^.HD, elem); 
  End;

var sG: ventaGenerada; s: venta;
Begin
 a:= nil;
 LeerVenta (s);
 while (s.codigo <> -1)do
  begin
   ArmarVentaAguardar(s, sG);
   InsertarElemento (a, sG);
   writeln;
   LeerVenta (s);
  end;
end;
