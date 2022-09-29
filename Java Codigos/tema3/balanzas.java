/*
Definir una clase para representar balanzas comerciales (para ser utilizadas en
verdulerías, carnicerías, etc). Una balanza comercial sólo mantiene el monto y la cantidad
de items correspondientes a la compra actual (es decir, no almacena los ítems de la
compra). La balanza debe responder a los siguientes mensajes:

- iniciarCompra(): inicia el monto y la cantidad de ítems para la compra actual.
- registrarProducto(pesoEnKg, precioPorKg): recibe el “peso en kilos” del ítem comprado
y su “precio por kilo”, y actualiza el estado de la balanza.
- getMonto(): retorna el monto a pagar por la compra actual.
- getResumenDeCompra(): retorna un String del siguiente estilo “Total a pagar X por la
compra de Y productos” , donde X es el monto e Y es la cantidad de ítems de la compra.
B- Realizar un programa que instancie una balanza e inicie una compra. Lea desde teclado
información de los ítems comprados (peso en kg y precio por kg) hasta ingresar peso 0.
Registre cada producto en la balanza. Al finalizar, informe el resumen de la compra.
 */
package tema3;

/**
 *
 * @author elmun
 */
public class balanzas {
    double monto;
    int items;
    double peso;
    double precio;

    public balanzas(double peso, double precio) {
        this.peso = peso;
        this.precio = precio;
    }


    public void iniciarCompra(){
        this.monto = 0;
        this.items = 0;
    }

    public void registrarProducto (double peso, double precio){
        this.monto = monto + (peso * precio);
        this.items = items + 1;
    }
    
    public double getMonto (double monto){
        return monto;
    }
    
    public String getResumenDeCompra(){
        return("Total a pagar" + " " + monto + "por la compra de" + " " + items + "productos");
    }
}
