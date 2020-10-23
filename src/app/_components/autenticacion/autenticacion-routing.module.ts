import { NgModule } from "@angular/core";
import { Routes, RouterModule, PreloadAllModules } from "@angular/router";
import { PageNotFoundComponent } from '../page-not-found/page-not-found.component';
import { AutenticacionComponent } from "./autenticacion.component";

const routes: Routes = [
  {
    path: '',
    component: AutenticacionComponent,
    children: [
      {
        path: '',
        redirectTo: '/login',
        pathMatch: 'full',
      },
      {
        path: 'login',
        loadChildren: () => import('../../_components/autenticacion/autenticacion.module').then((m) => m.AutenticacionModule)
      }
    ]
  },
  {
    path: '**',
    component: PageNotFoundComponent
  }
];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, {
      preloadingStrategy: PreloadAllModules,
    }),
  ],
  exports: [RouterModule],
})
export class AutenticacionRoutingModule {}
