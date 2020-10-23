export class Categoria {
    id_categoria: number;
    nombre_categoria: string;

    public constructor(init?: Partial<Categoria>) {
        Object.assign(this, init);
      }
}