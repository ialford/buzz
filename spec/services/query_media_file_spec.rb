require "rails_helper"

describe QueryMediaFile do
  let(:media) { MediaFile.new(uuid: "87ea8e9c-5932-478e-95d8-aeb04888a89a", file_path: "file path", media_type: "media type") }

  before(:each) do
    media.save
  end

  describe "find" do
    it "finds the correct record by uuid" do
      expect(QueryMediaFile.find(uuid: "87ea8e9c-5932-478e-95d8-aeb04888a89a")).to eq(media)
    end

    it "throws an ActiveRecord::RecordNotFound exception if not found, so that controllers will 404" do
      expect{ QueryMediaFile.find(uuid: 2) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
