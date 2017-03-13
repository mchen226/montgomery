import { Component, OnInit } from '@angular/core';
import { GameService } from '../../services/game.service';

@Component({
  selector: 'homepage',
  templateUrl: './homepage.component.html',
  styleUrls: ['./homepage.component.css']
})
export class HomepageComponent implements OnInit {

  games: Array<Object> = [];

  constructor(private gameService: GameService) { }

  ngOnInit() {
    this.getGames();
  }

  getGames() {
    this.gameService.allGames().subscribe((resp) => {
      resp.map((game) => {
        this.games.push(game);
      });
    });
  }
}
