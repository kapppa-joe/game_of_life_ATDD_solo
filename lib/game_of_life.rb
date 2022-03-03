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
    count = 0

    coordinates_of_surrounding_nine_cells =
      [column_index - 1, column_index, column_index + 1].map do |y|
        [row_index - 1, row_index, row_index + 1].map do |x|
          [y, x]
        end
      end.flatten(1)

    max_row_index = current_grid.length - 1
    max_column_index = current_grid[row_index].length - 1

    coordinates_of_valid_neighbours =
      coordinates_of_surrounding_nine_cells.filter do |x, y|
        x >= 0 && x <= max_column_index &&
          y >= 0 && y <= max_row_index &&
          [x, y] != [column_index, row_index]
      end

    coordinates_of_valid_neighbours.count do |x, y|
      current_grid[y][x] == :live
    end
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
