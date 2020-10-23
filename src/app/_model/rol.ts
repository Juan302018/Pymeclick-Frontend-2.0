export class Rol {
    id_rol: number;
    nombre: string;
    descripcion: string;

    public constructor(init?: Partial<Rol>) {
        Object.assign(this, init);
      }
}