import { Comuna } from './comuna';

export class Ciudad {
    id_ciudad: number;
    nombre: string;
    comuna: Comuna[];

    public constructor(init?: Partial<Ciudad>) {
        Object.assign(this, init);
      }
}