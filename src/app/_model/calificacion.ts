export class Calificacion {
    id_calificacion: number;
    puntaje: number; // TODO mientras se válida el tipo de dato double
    imagen: string;
    comentario: string;

    public constructor(init?: Partial<Calificacion>) {
        Object.assign(this, init);
      }
}