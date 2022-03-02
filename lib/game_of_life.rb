class GameOfLife
  def get_next_grid(current_grid)
    current_grid.each_with_index.map do |row, row_index|
      row.each_with_index.map do |cell, column_index|
        number_of_living_neighbours =
          count_living_neighbours(current_grid, row_index, column_index)
        new_state_of_cell(cell, number_of_living_neighbours)
      end
    end
  end

  def count_living_neighbours(current_grid, row_index, column_index)
    0
  end

  def new_state_of_cell(current_state, number_of_living_neighbours)
    case [current_state, number_of_living_neighbours]
    when [:dead, 3]
      :live
    when [:live, 2], [:live, 3]
      :live
    else
      :dead
    end
  end
end
