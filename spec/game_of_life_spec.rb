require_relative '../lib/game_of_life'

describe GameOfLife do
  describe '#new_state_of_cell' do
    context 'current_state is :dead' do
      describe 'it remains dead when number of living neighbours is 0 ~ 2' do
        test_cases = [0, 1, 2]
        test_cases.each do |number_of_living_neighbours|
          it "case: living neighbours = #{number_of_living_neighbours}" do
            current_state = :dead
            expected_output = :dead

            actual_output = subject.new_state_of_cell(current_state, number_of_living_neighbours)
            expect(actual_output).to eql expected_output
          end
        end
      end

      it 'turns alive when number of living neighbours is exactly 3' do
        current_state = :dead
        number_of_living_neighbours = 3
        expected_output = :live

        actual_output = subject.new_state_of_cell(current_state, number_of_living_neighbours)
        expect(actual_output).to eql expected_output
      end

      describe 'it remains dead when number of living neighbours is 4 ~ 8' do
        test_cases = [4, 5, 6, 7, 8]
        test_cases.each do |number_of_living_neighbours|
          it "case: living neighbours = #{number_of_living_neighbours}" do
            current_state = :dead
            expected_output = :dead

            actual_output = subject.new_state_of_cell(current_state, number_of_living_neighbours)
            expect(actual_output).to eql expected_output
          end
        end
      end
    end

    context 'current_state is :live' do
      context 'die of under-population when number of living neighbour is 0 ~ 1' do
        test_cases = [0, 1]
        test_cases.each do |number_of_living_neighbours|
          it "case: living neighbours = #{number_of_living_neighbours}" do
            current_state = :live
            expected_output = :dead

            actual_output = subject.new_state_of_cell(current_state, number_of_living_neighbours)
            expect(actual_output).to eql expected_output
          end
        end
      end

      context 'stay alive when when number of living neighbour is 2 ~ 3' do
        test_cases = [2, 3]
        test_cases.each do |number_of_living_neighbours|
          it "case: living neighbours = #{number_of_living_neighbours}" do
            current_state = :live
            expected_output = :live

            actual_output = subject.new_state_of_cell(current_state, number_of_living_neighbours)
            expect(actual_output).to eql expected_output
          end
        end
      end

      context 'die of over-population when number of living neighbour is 4 ~ 8' do
        test_cases = [4, 5, 6, 7, 8]
        test_cases.each do |number_of_living_neighbours|
          it "case: living neighbours = #{number_of_living_neighbours}" do
            current_state = :live
            expected_output = :dead

            actual_output = subject.new_state_of_cell(current_state, number_of_living_neighbours)
            expect(actual_output).to eql expected_output
          end
        end
      end
    end
  end

  describe '#count_living_neighbours' do
    current_cell_possible_states = [:live, :dead]
    current_cell_possible_states.each do |current_cell|
      context "when current cell is #{current_cell.inspect} and" do
        it 'return 0 when being the only cell in a grid' do
          grid = [[current_cell]]
          row_index = 0
          column_index = 0
          expected_output = 0

          actual_output = subject.count_living_neighbours(grid, row_index, column_index)
          expect(actual_output).to eql expected_output
        end

        context 'in a 1 x 3 grid, being the cell in the middle' do
          it 'return 0 when both left and right are dead cell' do
            grid = [[:dead, current_cell, :dead]]
            row_index = 0
            column_index = 1
            expected_output = 0

            actual_output = subject.count_living_neighbours(grid, row_index, column_index)
            expect(actual_output).to eql expected_output
          end

          it 'return 1 when the left cell is alive' do
            grid = [[:live, current_cell, :dead]]
            row_index = 0
            column_index = 1
            expected_output = 1

            actual_output = subject.count_living_neighbours(grid, row_index, column_index)
            expect(actual_output).to eql expected_output
          end

          it 'return 1 when the right cell is alive' do
            grid = [[:dead, current_cell, :live]]
            row_index = 0
            column_index = 1
            expected_output = 1

            actual_output = subject.count_living_neighbours(grid, row_index, column_index)
            expect(actual_output).to eql expected_output
          end

          it 'return 2 when both the left and right cells are alive' do
            grid = [[:live, current_cell, :live]]
            row_index = 0
            column_index = 1
            expected_output = 2

            actual_output = subject.count_living_neighbours(grid, row_index, column_index)
            expect(actual_output).to eql expected_output
          end
        end

        context 'in a 1x2 grid, being the cell at the left' do
          it 'return 0 when the cell at the right is dead' do
            grid = [[current_cell, :dead]]
            row_index = 0
            column_index = 0
            expected_output = 0

            actual_output = subject.count_living_neighbours(grid, row_index, column_index)
            expect(actual_output).to eql expected_output
          end

          it 'return 1 when the cell at the right is alive' do
            grid = [[current_cell, :live]]
            row_index = 0
            column_index = 0
            expected_output = 1

            actual_output = subject.count_living_neighbours(grid, row_index, column_index)
            expect(actual_output).to eql expected_output
          end
        end

        context 'in a 1x2 grid, being the cell at the right' do
          it 'return 0 when the cell at the left is dead' do
            grid = [[:dead, current_cell]]
            row_index = 0
            column_index = 1
            expected_output = 0

            actual_output = subject.count_living_neighbours(grid, row_index, column_index)
            expect(actual_output).to eql expected_output
          end

          it 'return 1 when the cell at the left is alive' do
            grid = [[:live, current_cell]]
            row_index = 0
            column_index = 1
            expected_output = 1

            actual_output = subject.count_living_neighbours(grid, row_index, column_index)
            expect(actual_output).to eql expected_output
          end
        end


        context 'in a 3 x 1 grid, being the cell in the middle' do
          it 'return 0 when both upper and lower are dead cell' do
            grid = [[:dead],
                    [current_cell],
                    [:dead]]
            row_index = 1
            column_index = 0
            expected_output = 0

            actual_output = subject.count_living_neighbours(grid, row_index, column_index)
            expect(actual_output).to eql expected_output
          end

          it 'return 1 when the upper cell is alive' do
            grid = [[:live],
                    [current_cell],
                    [:dead]]
            row_index = 1
            column_index = 0
            expected_output = 1

            actual_output = subject.count_living_neighbours(grid, row_index, column_index)
            expect(actual_output).to eql expected_output
          end

          it 'return 1 when the lower cell is alive' do
            grid = [[:dead],
                    [current_cell],
                    [:live]]
            row_index = 1
            column_index = 0
            expected_output = 1

            actual_output = subject.count_living_neighbours(grid, row_index, column_index)
            expect(actual_output).to eql expected_output
          end

          it 'return 2 when both upper and lower cells are alive' do
            grid = [[:live],
                    [current_cell],
                    [:live]]
            row_index = 1
            column_index = 0
            expected_output = 2

            actual_output = subject.count_living_neighbours(grid, row_index, column_index)
            expect(actual_output).to eql expected_output
          end
        end
      end
    end
  end
end
