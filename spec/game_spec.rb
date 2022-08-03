require './games/game'

describe Game do
  context 'Testing Game Class' do
    it 'An instance of Game class should be created' do
      game = Game.new(publish_date: '12-12-2000', last_played_at: '12-06-2022', multiplayer: 'yes', archived: 'yes')
      expect(game).to be_instance_of(Game)
    end
    it 'Should contain the appropriate instance variables publish_date, last_played_at, multiplayer and archived' do
      game = Game.new(publish_date: '12-12-2000', last_played_at: '12-06-2022', multiplayer: 'yes', archived: 'yes')
      expect(game.publish_date).to eq('12-12-2000')
      expect(game.last_played_at).to eq('12-06-2022')
      expect(game.multiplayer).to eq('yes')
      expect(game.archived).to eq('yes')
    end

    it 'can_be_archived? method should return true if publish_date > 10 years and last_played_at > 2 years' do
      game = Game.new(publish_date: '12-12-2000', last_played_at: '12-06-2015', multiplayer: 'yes', archived: 'yes')
      result = game.send(:can_be_archived?)
      expect(result).to be(true)
    end

    it 'can_be_archived? method should return false if publish_date <= 10 years ' do
      game = Game.new(publish_date: '12-12-2016', last_played_at: '12-06-2015', multiplayer: 'yes', archived: 'yes')
      result = game.send(:can_be_archived?)
      expect(result).to be(false)
    end

    it 'can_be_archived? method should return false if last_played_at <= 2 years' do
      game = Game.new(publish_date: '12-12-2000', last_played_at: '12-06-2022', multiplayer: 'yes', archived: 'yes')
      result = game.send(:can_be_archived?)
      expect(result).to be(false)
    end
  end
end
