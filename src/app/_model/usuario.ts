import { Rol } from './rol';

export class Usuario {
    id_usuario: number;
    username: string;
    password: string;
    enabled: boolean;
    roles: Rol[];

    public constructor(init?: Partial<Usuario>) {
        Object.assign(this, init);
      }
}