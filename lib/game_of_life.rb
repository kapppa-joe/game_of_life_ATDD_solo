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
    neighbour_cells_coordinates =
      get_neighbour_cells_coordinates(current_grid, row_index, column_index)

    neighbour_cells_coordinates.count do |x, y|
      current_grid[y][x] == :live
    end
  end

  def get_neighbour_cells_coordinates(current_grid, row_index, column_index)
    possible_neighbours = []
    [column_index - 1, column_index, column_index + 1].each do |x|
      [row_index - 1, row_index, row_index + 1].each do |y|
        possible_neighbours << [x, y]
      end
    end

    # remove current cell from array of possible neighbours
    possible_neighbours.delete([column_index, row_index])

    max_row_index = current_grid.length - 1
    max_column_index = current_grid[row_index].length - 1

    possible_neighbours.filter do |x, y|
      valid_coordinate?(x, y, max_column_index, max_row_index)
    end
  end

  def valid_coordinate?(x, y, max_column_index, max_row_index)
    return false if x < 0 || x > max_column_index
    return false if y < 0 || y > max_row_index

    true
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
