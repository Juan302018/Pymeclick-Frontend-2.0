export class Comuna {
    id_comuna: number;
    nombre_comuna: string;

    public constructor(init?: Partial<Comuna>) {
        Object.assign(this, init);
      }
}