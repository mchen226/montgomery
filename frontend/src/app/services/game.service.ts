import { Injectable } from '@angular/core';
import { Headers, Http, Response } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/Rx';
import 'rxjs/add/observable/throw';

@Injectable()
export class GameService {

  headers: Headers = new Headers({
    Accept: 'application/json'
  });

  constructor(private http: Http) { }

  private getJson(resp: Response) {
    return resp.json();
  }

  private checkForError(resp: Response): Response {
    if (resp.status >= 200 &&  resp.status < 300) {
      return resp;
    } else {
      const error = new Error(resp.statusText);
      error['response'] = resp;
      throw error;
    }
  }

  allGames(): Observable<any> {
    return this.http.get('http://localhost:3000/api/games', { headers: this.headers })
      .map(this.checkForError)
      .catch(err => Observable.throw(err))
      .map(this.getJson);
  }
}
