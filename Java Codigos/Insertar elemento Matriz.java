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
