import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Subject } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Comuna } from '../_model/comuna';

@Injectable({
  providedIn: 'root'
})
export class ComunaService {

  comunaCambio = new Subject<Comuna[]>();
  mensajeCambio = new Subject<string>();

  url: string = `${environment.HOST}/comuna`;

  constructor(private http: HttpClient) { }

  listar() {
    return this.http.get<Comuna[]>(this.url);
  }

  listarPorId(id_comuna: number) {
    return this.http.get<Comuna>(`${this.url}/${id_comuna}`);
  }

  registrar(comuna: Comuna) {
    return this.http.post(this.url, comuna);
  }

  modificar(comuna: Comuna) {
    return this.http.put(this.url, comuna);
  }

  eliminar(id_comuna: number) {
    return this.http.delete<Comuna>(`${this.url}/${id_comuna}`);
  }
}
