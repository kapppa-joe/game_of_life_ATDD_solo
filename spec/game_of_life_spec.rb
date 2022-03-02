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
  end
end
