import { Component, OnInit, ViewChild } from '@angular/core';
import { MatPaginator, MatSnackBar, MatSort, MatTableDataSource } from '@angular/material';
import { Categoria } from 'src/app/_model/categoria';
import { Empresa } from 'src/app/_model/empresa';
import { EmpresaService } from 'src/app/_service/empresa.service';
import { switchMap } from 'rxjs/operators';
import { ComunaService } from 'src/app/_service/comuna.service';
import { CiudadService } from 'src/app/_service/ciudad.service';
import { Comuna } from 'src/app/_model/comuna';
import { Ciudad } from 'src/app/_model/ciudad';

@Component({
  selector: 'app-empresa',
  templateUrl: './empresa.component.html',
  styleUrls: ['./empresa.component.css']
})
export class EmpresaComponent implements OnInit {

displayedColums = ['id','nombre','direccion','descripcion','telefono','logo',
'email','comuna','calificacion','ciudad','categoria','acciones'];

dataSource:MatTableDataSource<Empresa>;

@ViewChild(MatPaginator,{static:true})
paginator:MatPaginator;
@ViewChild(MatSort,{static:true}) sort: MatSort;


  constructor(private empresaService:EmpresaService,
             public snackBar: MatSnackBar) { }

  ngOnInit(){
   this.empresaService.empresaCambio.subscribe(data =>
    {
      this.dataSource  = new MatTableDataSource(data);
      this.dataSource.paginator = this.paginator;
      this.dataSource.sort = this.sort;
    });
    this.empresaService.mensajeCambio.subscribe(data =>{
      this.snackBar.open(data, 'Aviso', {duration:2000,});
    });
    this.empresaService.listar().subscribe(data =>{
      console.log('lista de empresas: ', data);
      this.dataSource = new MatTableDataSource(data);
      console.log('dataSource: ', this.dataSource);
      this.dataSource.paginator = this.paginator;
      this.dataSource.sort = this.sort;
    });
}
filtrar(valor : string){
  this.dataSource.filter = valor.trim().toLowerCase();
}
eliminar(empresa:Empresa){
  this.empresaService.eliminar(empresa.id_empresa).pipe(
    switchMap(() => {
      return  this.empresaService.listar();
    })).subscribe(data =>{
      this.empresaService.empresaCambio.next(data);
      this.empresaService.mensajeCambio.next('Una empresa ha sido eliminada');
    });
  }


}
