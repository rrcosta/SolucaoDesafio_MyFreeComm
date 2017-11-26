require 'rails_helper'
require 'spec_helper'
require 'csv'

RSpec.describe "ExampleInput", type: :model do
	#let(:csv_file) { File.new('spec/app/fixtures/example_input.csv') }

	context "validation file" do
		it 'returns true' do 
			#import = ExampleInput.formatFile(:csv_file)
			#expect(import).to eq(true)
		end
	end
end

