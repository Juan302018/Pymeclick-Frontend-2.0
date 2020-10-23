import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MaterialModule } from './_components/material/material.module';
import { CalificacionComponent } from './_components/pages/calificacion/calificacion.component';
import { CategoriaComponent } from './_components/pages/categoria/categoria.component';
import { CiudadComponent } from './_components/pages/ciudad/ciudad.component';
import { ComunaComponent } from './_components/pages/comuna/comuna.component';
import { EmpresaComponent } from './_components/pages/empresa/empresa.component';
import { ProductoServicioComponent } from './_components/pages/producto-servicio/producto-servicio.component';
import { CalificacionEdicionComponent } from './_components/pages/calificacion/calificacion-edicion/calificacion-edicion.component';
import { CategoriaEdicionComponent } from './_components/pages/categoria/categoria-edicion/categoria-edicion.component';
import { EmpresaEdicionComponent } from './_components/pages/empresa/empresa-edicion/empresa-edicion.component';
// tslint:disable-next-line:max-line-length
import {ProductoServicioEdicionComponent} from './_components/pages/producto-servicio/producto-servicio-edicion/producto-servicio-edicion.component';
import { HomeComponent } from './_components/pages/home/home.component';
import { AutenticacionComponent } from './_components/autenticacion/autenticacion.component';
import { PageNotFoundComponent } from './_components/page-not-found/page-not-found.component';
import { TokenComponent } from './_components/autenticacion/login/recuperar/token/token.component';
import { RecuperarComponent } from './_components/autenticacion/login/recuperar/recuperar.component';
import { Not403Component } from './_components/autenticacion/not403/not403.component';
import { LoginComponent } from './_components/autenticacion/login/login.component';
import { environment } from 'src/environments/environment';
import { FlexLayoutModule } from '@angular/flex-layout';
import { ServerErrorsInterceptor } from './_shared/server-errors.interceptor';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { JwtModule } from '@auth0/angular-jwt';

export function tokenGetter() {
  const token = sessionStorage.getItem(environment.TOKEN_NAME);
  return token != null ? token : '';
}

@NgModule({
  declarations: [
    AppComponent,
    CalificacionComponent,
    CategoriaComponent,
    CiudadComponent,
    ComunaComponent,
    EmpresaComponent,
    ProductoServicioComponent,
    CalificacionEdicionComponent,
    CategoriaEdicionComponent,
    EmpresaEdicionComponent,
    ProductoServicioEdicionComponent,
    HomeComponent,
    AutenticacionComponent,
    PageNotFoundComponent,
    LoginComponent,
    Not403Component,
    RecuperarComponent,
    TokenComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
    MaterialModule,
    FlexLayoutModule,
    JwtModule.forRoot({
      config: {
        tokenGetter: tokenGetter,
        allowedDomains: ['localhost:8080'],
        disallowedRoutes: ['http://localhost:8080/login/enviarCorreo']
      }
    })
  ],
  providers: [
    {
      provide: HTTP_INTERCEPTORS,
      useClass: ServerErrorsInterceptor,
      multi: true,
    }
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
