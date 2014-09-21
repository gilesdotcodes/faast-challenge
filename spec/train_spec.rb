require 'train'

describe Train do
	let(:train) {Train.new}

	it 'should have a default number of carriages' do
		expect(train.number_of_carriages).to eq(8)
	end

	it 'can set a number of carriages when being created' do
		long_train = Train.new(number_of_carriages: 12)

		expect(long_train.number_of_carriages).to eq(12)
	end
end