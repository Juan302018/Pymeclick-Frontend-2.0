import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Subject } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Categoria } from '../_model/categoria';

@Injectable({
  providedIn: 'root'
})
export class CategoriaService {

  categoriaCambio = new Subject<Categoria[]>();
  mensajeCambio = new Subject<string>();

  url: string = `${environment.HOST}/categoria`;

  constructor(private http: HttpClient) { }

  listar() {
    return this.http.get<Categoria[]>(this.url);
  }

  listarPorId(id_categoria: number) {
    return this.http.get<Categoria>(`${this.url}/${id_categoria}`);
  }

  registrar(categoria: Categoria) {
    return this.http.post(this.url, categoria);
  }

  modificar(categoria: Categoria) {
    return this.http.put(this.url, categoria);
  }

  eliminar(id_categoria: number) {
    return this.http.delete<Categoria>(`${this.url}/${id_categoria}`);
  }
}
