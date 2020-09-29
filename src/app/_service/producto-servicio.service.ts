import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Subject } from 'rxjs';
import { environment } from 'src/environments/environment';
import { ProductoServicio } from '../_model/productoServicio';

@Injectable({
  providedIn: 'root'
})
export class ProductoServicioService {

  productoServicioCambio = new Subject<ProductoServicio[]>();
  mensajeCambio = new Subject<string>();

  url: string = `${environment.HOST}/producto_servicio`;

  constructor(private http: HttpClient) { }

  listar() {
    return this.http.get<ProductoServicio[]>(this.url);
  }

  listarPorId(id_prod_serv: number) {
    return this.http.get<ProductoServicio>(`${this.url}/${id_prod_serv}`);
  }

  registrar(productoServicio: ProductoServicio) {
    return this.http.post(this.url, productoServicio);
  }

  modificar(productoServicio: ProductoServicio) {
    return this.http.put(this.url, productoServicio);
  }

  eliminar(id_prod_serv: number) {
    return this.http.delete<ProductoServicio>(`${this.url}/${id_prod_serv}`);
  }
}
