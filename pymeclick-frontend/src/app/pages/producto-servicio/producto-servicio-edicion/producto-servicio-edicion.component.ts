import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { MatSnackBar } from '@angular/material';
import { ActivatedRoute, Params, Router } from '@angular/router';
import { Categoria } from 'src/app/_model/categoria';
import { Empresa } from 'src/app/_model/empresa';
import { ProductoServicio } from 'src/app/_model/productoServicio';
import { CategoriaService } from 'src/app/_service/categoria.service';
import { EmpresaService } from 'src/app/_service/empresa.service';
import { ProductoServicioService } from 'src/app/_service/producto-servicio.service';
import { switchMap } from 'rxjs/operators';

@Component({
  selector: 'app-producto-servicio-edicion',
  templateUrl: './producto-servicio-edicion.component.html',
  styleUrls: ['./producto-servicio-edicion.component.css']
})
export class ProductoServicioEdicionComponent implements OnInit {

  categoria: Categoria[] =[];
  empresa: Empresa[] =[];
  categoriaSeleccionada: number;
  empresaSeleccionada: Empresa;
  
  id: number;
  productoServicio: ProductoServicio;
  form: FormGroup;
  edicion: boolean = false;
  mensaje: string;

  constructor(private productoServicioService: ProductoServicioService, private categoriaService: CategoriaService, private empresaService: EmpresaService, private route: ActivatedRoute, private router: Router, private snackBar: MatSnackBar) { }

  ngOnInit() {
    this.productoServicio = new ProductoServicio();
    this.form = new FormGroup({
      id_prod_serv: new FormControl(0),
      nombre_prod_serv: new FormControl(''),
      precio: new FormControl(0),
      imagen: new FormControl(''),
      descripcion_prod_serv: new FormControl(''),
      categoria: new FormControl(this.categoria),
      empresa: new FormControl(this.empresa)
    
   });
   /** 
   * capturar un parámetro que viene de una URL y lo convierte en número
    *  en este caso es un Id. El subscribe es un método observable que ejecuta 
    * una acción asociada a una entidad de datos y además dispara otra acción
    * asociada a esa data. Por ejemplo, cuando uno hace un cambio se ejecuta 
    * una lista datos con el dato ya cambiado.
   */
   this.route.params.subscribe((params: Params) => {
    this.id = params['id'];
    //Pregunta si el el parámetro id, es distinto de nulo.
    this.edicion = params['id'] != null;
    this.initForm();
  });
      this.listarCategoria();
      this.listarEmpresa();

  }

  listarCategoria(){
    this.categoriaService.listar().subscribe(data =>{
      console.log('Categorias: ', data);
      this.categoria = data;
    }
    );
  }

  listarEmpresa(){
    this.empresaService.listar().subscribe(data =>{
      this.empresa = data;
    }
    );
  }

  seleccionarCategoria(e: any) {
    this.categoriaSeleccionada = e.value;
    console.log('id categoria', e.value);
  }

  seleccionarEmpresa(e: any) {
    this.empresaSeleccionada.id_empresa = e.value;
    console.log('id empresaSel', this.empresaSeleccionada);
    console.log('id empresa', e.value);
  }

  registrar(){
    let productoServicio = new ProductoServicio();
    productoServicio.empresa.id_empresa = this.empresaSeleccionada.id_empresa;
    console.log('productoServicioId: ', productoServicio.empresa.id_empresa);
    productoServicio.categoria.id_categoria = this.categoriaSeleccionada;
  
  }
  initForm(){
// Veirifica si el paramétro id es nulo, y la opción por defecto es True
    if(this.edicion) {
      this.productoServicioService.listarPorId(this.id).subscribe(data => {
        let id = data.id_prod_serv;
        let nombre_prod_serv = data.nombre_prod_serv;
        let precio = data.precio;
        let imagen = data.imagen;
        let descripcion_prod_serv = data.descripcion_prod_serv;
        let categoria = data.categoria;
        let empresa = data.empresa;
        categoria.id_categoria = this.productoServicio.categoria.id_categoria;
        empresa.id_empresa = this.productoServicio.empresa.id_empresa;
        this.form = new FormGroup({
          'id': new FormControl(id),
          'nombre_prod_serv': new FormControl(nombre_prod_serv),
          'precio': new FormControl(precio),
          'imagen': new FormControl(imagen),
          'descripcion_prod_serv': new FormControl(descripcion_prod_serv),
          'categoria': new FormControl(categoria),
          'empresa': new FormControl(empresa)
          });
        });
      }
    }

    operar(){
      this.productoServicio.id_prod_serv = this.form.value['id'];
      this.productoServicio.nombre_prod_serv = this.form.value['nombre_prod_serv'];
      this.productoServicio.precio = this.form.value['precio'];
      this.productoServicio.imagen = this.form.value['imagen'];
      this.productoServicio.descripcion_prod_serv = this.form.value['descripcion_prod_serv'];
      this.productoServicio.categoria = this.form.value['categoria'];
      console.log('id_categoriasSeleccionadaOperar: ', this.productoServicio.categoria);
      this.productoServicio.empresa = this.form.value['empresa'];
      console.log('id_empresaSeleccionadaOperar: ', this.productoServicio.empresa);
      //console.log('productoServicio: ', this.productoServicio);
      if(this.productoServicio!= null && this.productoServicio.id_prod_serv >0){
        // pipe es un método observable que es similar al subscribe, pero que optimisa y renderiza mejor la carga de lista
        this.productoServicioService.modificar(this.productoServicio).pipe(switchMap(() => {
          return this.productoServicioService.listar();
        })).subscribe(data => {
          console.log('data productoServicioMod: ', data);
          this.productoServicioService.productoServicioCambio.next(data);
          this.productoServicioService.mensajeCambio.next("Un Producto o Servicio fue modificado");
        });  
    }else{
      this.productoServicioService.registrar(this.productoServicio).pipe(switchMap(() => {
        return this.productoServicioService.listar();
      })).subscribe(data => {
        console.log('data productoServicioReg: ', data);
        this.productoServicioService.productoServicioCambio.next(data);
        this.productoServicioService.mensajeCambio.next("Se registró un Producto o Servicio");
      });
    }

    this.router.navigate(['productoservicio']);
  }


}
