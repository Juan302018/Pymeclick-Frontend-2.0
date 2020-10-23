import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { JwtHelperService } from '@auth0/angular-jwt';
import { LoginService } from 'src/app/_service/login.service';
import { MenuService } from 'src/app/_service/menu.service';
import { environment } from 'src/environments/environment';
import '../../login-animation.js';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  usuario: string;
  clave: string;
  mensaje: string;
  error: string;
  decodedToken: any;

  constructor(
    private loginService: LoginService,
    private menuService: MenuService,
    private router: Router
  ) { }

  ngOnInit() {
  }

  iniciarSesion() {
    this.loginService.login(this.usuario, this.clave).subscribe(data => {
      console.log(data);

      const helper = new JwtHelperService();
      sessionStorage.setItem(environment.TOKEN_NAME, data.access_token);

      this.decodedToken = helper.decodeToken(data.access_token);
      console.log(this.decodedToken);

      this.menuService.listarPorUsuario(this.decodedToken.user_name).subscribe(usuarios => {
        console.log(usuarios);
        this.menuService.menuCambio.next(usuarios);
        this.router.navigate(['home']);
      });
    });
  }

  // tslint:disable-next-line:use-lifecycle-interface
  ngAfterViewInit() {
    (window as any).initialize();
  }

}
