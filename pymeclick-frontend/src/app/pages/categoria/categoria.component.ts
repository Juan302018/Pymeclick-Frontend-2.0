import { Component, OnInit, ViewChild } from '@angular/core';
import { MatTableDataSource, MatPaginator, MatSort, MatSnackBar } from '@angular/material';
import { switchMap } from 'rxjs/operators';
import { Categoria } from 'src/app/_model/categoria';
import { CategoriaService } from 'src/app/_service/categoria.service';


@Component({
  selector: 'app-categoria',
  templateUrl: './categoria.component.html',
  styleUrls: ['./categoria.component.css']
})
export class CategoriaComponent implements OnInit {

  displayedColums = ['id', 'nombre','acciones'];
  dataSource:MatTableDataSource<Categoria>;
  
  @ViewChild(MatPaginator,{static:true})
  paginator:MatPaginator;
  @ViewChild(MatSort,{static:true}) sort: MatSort;
    constructor(private categoriaService:CategoriaService, snackBar: MatSnackBar) { }
  
    ngOnInit(){
      this.categoriaService.categoriaCambio.subscribe(data =>
        {
          this.dataSource  = new MatTableDataSource(data);
          this.dataSource.paginator = this.paginator;
          this.dataSource.sort = this.sort;
        
        });
  
        this.categoriaService.listar().subscribe(data =>{
          this.dataSource = new MatTableDataSource(data);
          this.dataSource.paginator = this.paginator;
          this.dataSource.sort = this.sort;
        });
    }
    filtrar(valor : string){
      this.dataSource.filter = valor.trim().toLowerCase();
    }
    eliminar(categoria:Categoria){
      this.categoriaService.eliminar(categoria.id_categoria).pipe(
        switchMap(() => {
          return  this.categoriaService.listar();
        })).subscribe(data =>{
          this.categoriaService.categoriaCambio.next(data);
          this.categoriaService.mensajeCambio.next('Una categoria ha sido eliminada'); 
  
    });
    }

}
