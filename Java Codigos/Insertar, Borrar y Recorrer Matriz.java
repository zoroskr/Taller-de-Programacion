  public void almacenarLibro(Libro l) {//inserta el elemento en una posicion x,y
        boolean almacene = false;
        int j, i = 0;
        while ((i < dimfn) && (!(almacene))) {
            j = 0;
            while ((j < dimfm) && (!(almacene))) {
                if (this.getMatriz()[i][j] == null) {
                    this.getMatriz()[i][j] = l;
                    almacene = true;
                }
                j++;
            }
            i++;
        }
    }

    public Libro sacarLibro(int x, int y) {//Borra un elemento de la matriz
        Libro aux = this.getMatriz()[x][y];
        this.getMatriz()[x][y] = null;
        return aux;
    }

    public int calcular(String nom) {//Recorre la matriz comparando null cuando hay espacios vacios
        int cant = 0;
        for (int i = 0; i < dimfn; i++) {
            for (int j = 0; j < dimfm; j++) {
                if (this.getMatriz()[i][j] != null) {
                    if (this.getMatriz()[i][j].getNombreaut().equals(nom)) {
                        cant++;
                    }
                }

            }
        }
        return cant;
    }
