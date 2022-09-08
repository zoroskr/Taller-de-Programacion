procedure InformarCantidadSociosEnRango (a: arbol);

     function cantentremedio (a:arbol; max,min: integer): integer;
     Begin
        if(a = nil) then
            cantentremedio:= 0
        else begin
            if (a^.dato.codigo > min) and (a^.dato.codigo < max) then begin
                 cantentremedio := cantentremedio(a^.HI, max,min) + cantentremedio(a^.HD,max,min) + a^.dato.cantidad
            end
            else begin
                if (a^.dato.codigo < min) then
                     cantentremedio := cantentremedio (a^.HD,max,min)
                else if (a^.dato.codigo > max) then
                     cantentremedio:= cantentremedio(a^.HI,max,min);
            end;
        end;
     end;
var
     max,min: integer;
Begin
    writeln('Ingrese el numero mas grande del rango:');
    readln(max);
    writeln('Ingrese el numero mas pequeno del rango');
    readln(min);
    writeln('La cantidad de socios cuyo numero se encuentra entre los valores ingresados es: ');
    writeln(cantentremedio(a,max,min));
end;
