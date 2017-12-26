require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_length_of(:bio).is_at_most(500) }
  end

  describe ".order_by_name" do
    let!(:artist1) { create :artist, first_name: "John" }
    let!(:artist2) { create :artist, first_name: "Alicia" }
    let!(:artist3) { create :artist, first_name: "Ed" }

    it "returns a sorted array of artists by first names" do
      expect(Artist.order_by_name).to eq([artist2, artist3, artist1])
    end
  end
end
