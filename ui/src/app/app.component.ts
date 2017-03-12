import { Component } from '@angular/core';
import { Http } from '@angular/http';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'app works!';
  games;

  constructor(private http: Http) {
    http.get('http://localhost:3000/api/games')
      .subscribe(res => this.games = res.json());
  }
}
