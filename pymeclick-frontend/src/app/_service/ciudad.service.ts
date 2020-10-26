import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Subject } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Ciudad } from '../_model/ciudad';

@Injectable({
  providedIn: 'root'
})
export class CiudadService {

  ciudadCambio = new Subject<Ciudad[]>();
  mensajeCambio = new Subject<string>();

  url: string = `${environment.HOST}/ciudad`;

  constructor(private http: HttpClient) { }

  listar() {
    return this.http.get<Ciudad[]>(this.url);
  }

  listarPorId(id_ciudad: number) {
    return this.http.get<Ciudad>(`${this.url}/${id_ciudad}`);
  }

  registrar(ciudad: Ciudad) {
    return this.http.post(this.url, ciudad);
  }

  modificar(ciudad: Ciudad) {
    return this.http.put(this.url, ciudad);
  }

  eliminar(id_ciudad: number) {
    return this.http.delete<Ciudad>(`${this.url}/${id_ciudad}`);
  }
}
