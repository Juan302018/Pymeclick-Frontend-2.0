import { HttpClient } from '@angular/common/http';
import { environment } from './../../environments/environment';
import { Subject } from 'rxjs';
import { Calificacion } from './../_model/calificacion';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class CalificacionService {

  calificacionCambio = new Subject<Calificacion[]>();
  mensajeCambio = new Subject<string>();

  url: string = `${environment.HOST}/calificacion`;

  constructor(private http: HttpClient) { }

  listar() {
    return this.http.get<Calificacion[]>(this.url);
  }

  listarPorId(id_calificacion: number) {
    return this.http.get<Calificacion>(`${this.url}/${id_calificacion}`);
  }

  registrar(calificacion: Calificacion) {
    return this.http.post(this.url, calificacion);
  }

  modificar(calificacion: Calificacion) {
    return this.http.put(this.url, calificacion);
  }

  eliminar(id_calificacion: number) {
    return this.http.delete<Calificacion>(`${this.url}/${id_calificacion}`);
  }
}
