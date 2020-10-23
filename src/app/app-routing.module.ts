import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AutenticacionComponent } from './_components/autenticacion/autenticacion.component';
import { LoginComponent } from './_components/autenticacion/login/login.component';
import { RecuperarComponent } from './_components/autenticacion/login/recuperar/recuperar.component';
import { TokenComponent } from './_components/autenticacion/login/recuperar/token/token.component';
import { Not403Component } from './_components/autenticacion/not403/not403.component';
import { CalificacionEdicionComponent } from './_components/pages/calificacion/calificacion-edicion/calificacion-edicion.component';
import { CalificacionComponent } from './_components/pages/calificacion/calificacion.component';
import { CategoriaEdicionComponent } from './_components/pages/categoria/categoria-edicion/categoria-edicion.component';
import { CategoriaComponent } from './_components/pages/categoria/categoria.component';
import { CiudadComponent } from './_components/pages/ciudad/ciudad.component';
import { ComunaComponent } from './_components/pages/comuna/comuna.component';
import { EmpresaEdicionComponent } from './_components/pages/empresa/empresa-edicion/empresa-edicion.component';
import { EmpresaComponent } from './_components/pages/empresa/empresa.component';
import { HomeComponent } from './_components/pages/home/home.component';
import { ProductoServicioEdicionComponent } from './_components/pages/producto-servicio/producto-servicio-edicion/producto-servicio-edicion.component';
import { ProductoServicioComponent } from './_components/pages/producto-servicio/producto-servicio.component';


const routes: Routes = [
  {
    path: '', component: AutenticacionComponent, children: [
      {path: '', component: LoginComponent},
    ],
  },

  {
    path: 'home', component: HomeComponent,
    pathMatch: 'full'
  },

  {
    path: 'calificacion', component: CalificacionComponent, children: [
      { path: 'nuevo', component: CalificacionEdicionComponent },
      { path: 'edicion/:id', component: CalificacionEdicionComponent }
    ]
  },

  {
    path: 'categoria', component: CategoriaComponent, children: [
      { path: 'nuevo', component: CategoriaEdicionComponent },
      { path: 'edicion/:id', component: CategoriaEdicionComponent }
    ]
  },

  {
    path: 'ciudad', component: CiudadComponent
  },

  {
    path: 'comuna', component: ComunaComponent
  },

  {
    path: 'recuperar', component: RecuperarComponent, children: [
      { path: ':token', component: TokenComponent }
    ]
  },

  {
    path: 'not-403', component: Not403Component
  },

  {
    path: 'empresa', component: EmpresaComponent, children: [
      { path: 'nuevo', component: EmpresaEdicionComponent },
      { path: 'edicion/:id', component: EmpresaEdicionComponent }
    ]
  },

  {
    path: 'productoservicio', component: ProductoServicioComponent, children: [
      { path: 'nuevo', component: ProductoServicioEdicionComponent },
      { path: 'edicion/:id', component: ProductoServicioEdicionComponent }
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
