require 'rails_helper'
require 'spec_helper'


RSpec.describe "ExampleInput", type: :model do
	describe 'ExampleInput with success' do
		let(:csv_file) { File.new("#{Rails.root}/spec/factories/example_input.csv") }

		context "validation file" do 
			it 'validate format file' do 
				expect(ExampleInput.formatFile(:csv_file)).to eq(true)
			end
		end

		context "import file" do
			it 'fail on import csv file' do
				expect(ExampleInput.import(:csv_file)).to eq(false)
			end
		end		
	end
end

