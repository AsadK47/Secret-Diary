require "secret_diary"

describe Diary do
  describe "#add_entry" do
    it { is_expected.to respond_to(:add_entry) }

    it "Adds an entry" do
      subject.unlock
      expect(subject.add_entry("Hi")).to eq("Hi")
    end

    it "Unable to add entry if locked" do
      subject.lock
      expect { subject.add_entry }.to raise_error "Diary is locked"
    end
  end

  describe "#retrieve_entries" do
    it { is_expected.to respond_to(:retrieve_entries) }

    it "Retrieves entries with blank" do
      subject.unlock
      expect(subject.retrieve_entries).to eq ""
    end

    it "Unable to retrieve entry if locked" do
      subject.lock
      expect { subject.add_entry }.to raise_error "Diary is locked"
    end
  end

  describe "#lock" do
    it { is_expected.to respond_to(:lock) }
  end

  describe "#unlock" do
    it { is_expected.to respond_to(:unlock) }
  end
end
