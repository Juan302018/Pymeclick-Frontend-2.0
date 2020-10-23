import { Rol } from './rol';

export class Menu {
    id_menu: number;
    icono: string;
    nombre: string;
    url: string;
    roles: Rol[];

    public constructor(init?: Partial<Menu>) {
        Object.assign(this, init);
      }
}