import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Subject } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Empresa } from '../_model/empresa';

@Injectable({
  providedIn: 'root'
})
export class EmpresaService {

  empresaCambio = new Subject<Empresa[]>();
  mesajeCambio = new Subject<string>();

  url: string = `${environment.HOST}/empresa`;

  constructor(private http: HttpClient) { }

  listar() {
    return this.http.get<Empresa[]>(this.url);
  }

  listaPorId(id_empresa: number) {
    return this.http.get<Empresa>(`${this.url}/${id_empresa}`);
  }

  registrar(empresa: Empresa) {
    return this.http.post(this.url, empresa);
  }

  modificar(empresa: Empresa) {
    return this.http.put(this.url, empresa);
  }

  eliminar(id_empresa: number) {
    return this.http.delete<Empresa>(`${this.url}/${id_empresa}`);
  }
}
