require "spec_helper"
require "rails_helper"

describe Api::GamesController do
  let!(:game) { Game.create(title: "Snipperclips") }
  let!(:game2) { Game.create(title: "Splat2n") }

  describe "GET index" do
    before { get :index }

    it "returns multiple games" do
      expect(response.body).to eq [game, game2].to_json
    end

    it "returns status ok" do
      expect(response.status).to eq 200
    end
  end

  describe "GET show" do
    before { get :show, params: { id: game.id } }

    it "returns the game object in json" do
      expect(response.body).to match game.to_json
    end

    it "returns status ok" do
      expect(response.status).to eq 200
    end
  end
end
