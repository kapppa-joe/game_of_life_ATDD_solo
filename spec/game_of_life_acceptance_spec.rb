require_relative '../lib/game_of_life'

describe 'game of life' do
  it 'when given a 2x2 square of live cells in a 4x4 grid no change will occur' do
    # arrange
    current_grid = [
      [:dead, :dead, :dead, :dead],
      [:dead, :live, :live, :dead],
      [:dead, :live, :live, :dead],
      [:dead, :dead, :dead, :dead]
    ]

    expected_output = current_grid.clone

    game_of_life = GameOfLife.new

    # act
    next_grid = game_of_life.get_next_grid(current_grid)

    # assert
    expect(next_grid).to eq(expected_output)
  end

  context 'in a 5x5 grid' do
    context 'given a vertical line of 3 live cells' do
      it 'it will change to a horizontal line of 3 live cells' do
        # arrange
        current_grid = [
          [:dead, :dead, :dead, :dead, :dead],
          [:dead, :dead, :live, :dead, :dead],
          [:dead, :dead, :live, :dead, :dead],
          [:dead, :dead, :live, :dead, :dead],
          [:dead, :dead, :dead, :dead, :dead]
        ]

        new_grid = [
          [:dead, :dead, :dead, :dead, :dead],
          [:dead, :dead, :dead, :dead, :dead],
          [:dead, :live, :live, :live, :dead],
          [:dead, :dead, :dead, :dead, :dead],
          [:dead, :dead, :dead, :dead, :dead]
        ]

        game_of_life = GameOfLife.new

        # act
        next_grid = game_of_life.get_next_grid(current_grid)

        # assert
        expect(next_grid).to eq(new_grid)
      end
    end
  end

  context 'in a 6x6 grid' do
    it 'can demonstrate the oscillators pattern of "toad"' do
      grid_1 = [
        [:dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :live, :live, :live, :dead],
        [:dead, :live, :live, :live, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead, :dead],
      ]

      grid_2 = [
        [:dead, :dead, :dead, :dead, :dead, :dead],
        [:dead, :dead, :dead, :live, :dead, :dead],
        [:dead, :live, :dead, :dead, :live, :dead],
        [:dead, :live, :dead, :dead, :live, :dead],
        [:dead, :dead, :live, :dead, :dead, :dead],
        [:dead, :dead, :dead, :dead, :dead, :dead],
      ]

      game_of_life = GameOfLife.new

      expect(game_of_life.get_next_grid(grid_1)).to eql grid_2
      expect(game_of_life.get_next_grid(grid_2)).to eql grid_1
    end
  end
end
