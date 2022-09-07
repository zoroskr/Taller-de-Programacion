   procedure LeerOficina (var o: oficina);
   begin
     write ('Ingrese codigo: ');
     readln (o.codigo);
     If (o.codigo <> -1)
     then begin
            write ('Ingrese numero de dni: ');
            o.dni:= Random (100) + 100;
            writeln (o.dni);
            write ('Ingrese valor: ');
            o.valor:= Random (30) + 1;
            writeln (o.valor);
           end;
   end;
   
   procedure CargarVector (var v: vector; var dimL: integer; dimF: integer);
   var
   o: oficina;
   begin
		LeerOficina(o);
		while (dimL<dimF) and (o.codigo <> -1) do begin
			v[dimL]:= o;
			dimL:= dimL+1;
			LeerOficina(o);
		end;
   end;
