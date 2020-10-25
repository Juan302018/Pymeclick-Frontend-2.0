import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { MatSnackBar } from '@angular/material';
import { ActivatedRoute, Params, Router } from '@angular/router';
import { Calificacion } from 'src/app/_model/calificacion';
import { Categoria } from 'src/app/_model/categoria';
import { Ciudad } from 'src/app/_model/ciudad';
import { Comuna } from 'src/app/_model/comuna';
import { Empresa } from 'src/app/_model/empresa';
import { CalificacionService } from 'src/app/_service/calificacion.service';
import { CategoriaService } from 'src/app/_service/categoria.service';
import { CiudadService } from 'src/app/_service/ciudad.service';
import { ComunaService } from 'src/app/_service/comuna.service';
import { EmpresaService } from 'src/app/_service/empresa.service';
import { switchMap } from 'rxjs/operators';

@Component({
  selector: 'app-empresa-edicion',
  templateUrl: './empresa-edicion.component.html',
  styleUrls: ['./empresa-edicion.component.css']
})
export class EmpresaEdicionComponent implements OnInit {

  categoria: Categoria[] = [];
  comuna: Comuna[] = [];
  ciudad: Ciudad[] = [];
  calificacion: Calificacion[] = [];
  comunaSeleccionada: number;
  ciudadSeleccionada: number;
  calificacionSeleccionada: number;
  categoriaSeleccionada: number;
  
  id: number;
  empresa:Empresa;
  form: FormGroup;
  edicion: boolean = false;
  mensaje: string;

  constructor(private empresaService: EmpresaService,
    private comunaService: ComunaService,
    private ciudadService: CiudadService,
    private calificacionService: CalificacionService,
    private categoriaService: CategoriaService,
    private route: ActivatedRoute, private router: Router
    , private snackBar: MatSnackBar) { }

  ngOnInit(){
    this.empresa = new Empresa();
    this.form = new FormGroup({
      id_empresa: new FormControl(0),
      nombre: new FormControl(''),
      direccion: new FormControl(''),
      descripcion: new FormControl(''),
      telefono: new FormControl(''),
      logo: new FormControl(''),
      email: new FormControl(''),
      comuna: new FormControl(this.comuna),
      calificacion: new FormControl(this.calificacion),
      ciudad: new FormControl(this.ciudad),
      categoria: new FormControl(this.categoria)

    });

    this.route.params.subscribe((params: Params) => {
      this.id = params['id'];
      this.edicion = params['id'] != null;
      this.initForm();
    });
  
  this.listarCategoria();
  this.listarComuna();
  this.listarCiudad();
  this.listarCalificacion();

}

listarCategoria(){
  this.categoriaService.listar().subscribe(data =>{
    this.categoria = data;
  }
  );
}
  listarComuna(){
    this.comunaService.listar().subscribe(data =>{
      this.comuna = data;
    }
    );
  }
    listarCiudad(){
      this.ciudadService.listar().subscribe(data =>{
        this.ciudad = data;
      }
      );
    }
      listarCalificacion(){
        this.calificacionService.listar().subscribe(data =>{
          this.calificacion = data;
        }
        );
}



seleccionarCiudad(e: any) {
  this.ciudadSeleccionada = e.value;
  console.log('id ciduad', e.value);
}

seleccionarCategoria(e: any) {
  this.categoriaSeleccionada = e.value;
  console.log('id categoria', e.value);
}

seleccionarComuna(e: any) {
  this.comunaSeleccionada = e.value;
   console.log('id comuna', e.value);
}

seleccionarCalificacion(e: any) {
  this.calificacionSeleccionada = e.value;
   console.log('id_calificacion', e.value);
}

registrar(){
  let empresa = new Empresa();
  empresa.ciudad.id_ciudad = this.ciudadSeleccionada;
  empresa.comuna.id_comuna = this.comunaSeleccionada;
  empresa.calificacion.id_calificacion = this.calificacionSeleccionada;
  empresa.categoria.id_categoria = this.categoriaSeleccionada;

}

initForm(){
  
        if(this.edicion) {
          this.empresaService.listaPorId(this.id).subscribe(data => {
            let id = data.id_empresa
            let nombre = data.nombre;
            let direccion= data.direccion;
            let descripcion = data.descripcion;
            let telefono = data.telefono;
            let logo = data.logo;
            let email = data.email;
            let ciudad = data.ciudad;
            let comuna = data.comuna;
            let categoria = data.categoria;
            let calificacion = data.calificacion;
            ciudad.id_ciudad = this.empresa.ciudad.id_ciudad;
            comuna.id_comuna = this.empresa.comuna.id_comuna;
           calificacion.id_calificacion = this.empresa.calificacion.id_calificacion;
            categoria.id_categoria = this.empresa.categoria.id_categoria
            this.form = new FormGroup({
              'id': new FormControl(id),
              'nombre': new FormControl(nombre),
              'direccion': new FormControl(direccion),
              'descripcion': new FormControl(descripcion),
              'telefono': new FormControl(telefono),
              'logo': new FormControl(logo),
              'email': new FormControl(email),
              'ciudad': new FormControl(ciudad),
              'comuna': new FormControl(comuna),
              'calificacion': new FormControl(calificacion),
              'categoria': new FormControl(categoria)
              });
            });
          }
        }
    
        operar(){
          this.empresa.id_empresa = this.form.value['id'];
          this.empresa.nombre = this.form.value['nombre'];
          this.empresa.direccion = this.form.value['direccion'];
          this.empresa.descripcion = this.form.value['descripcion'];
          this.empresa.telefono = this.form.value['telefono'];
          this.empresa.logo = this.form.value['logo'];
          this.empresa.email = this.form.value['email'];
          this.empresa.ciudad = this.form.value['ciudad'];
          this.empresa.comuna = this.form.value['comuna'];
          this.empresa.calificacion = this.form.value['calificacion'];
          this.empresa.categoria = this.form.value['categoria'];
    
          if(this.empresa!= null && this.empresa.id_empresa >0){
           
            this.empresaService.modificar(this.empresa).pipe(switchMap(() => {
              return this.empresaService.listar();
            })).subscribe(data => {
              this.empresaService.empresaCambio.next(data);
              this.empresaService.mensajeCambio.next("una empresa fue modificado");
            });  
        }else{
          this.empresaService.registrar(this.empresa).pipe(switchMap(() => {
            return this.empresaService.listar();
          })).subscribe(data => {
            this.empresaService.empresaCambio.next(data);
            this.empresaService.mensajeCambio.next("Se registró una empresa");
          });
        }
        this.router.navigate(['empresa']);
      }

}
