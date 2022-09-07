	Procedure busquedaDicotomica (v: vector; ini, fin: integer; codigoing:integer); 
	var
	mid: integer;
	begin
		if (fin < ini) then begin
			writeln ('el codigo no esta en el vector')
		end
		else begin
			mid:= (ini + fin) div 2;
			if (v[mid].codigo = codigoing) then begin
				writeln ('el codigo esta en el vector');
			end
			else
			if (v[mid].codigo > codigoing) then 
				busquedaDicotomica(v, ini, mid-1, codigoing)
			else
				busquedaDicotomica(v, mid+1, fin, codigoing);
			end;
		end;
