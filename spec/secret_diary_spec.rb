require "secret_diary"

describe Diary do

  describe "#Add entry" do

    it { is_expected.to respond_to(:add_entry)}

    it "Adds entry" do
      subject.unlock
      expect(subject.add_entry("Hi")).to eq("Hi")
    end

    it "Unable to add entry if locked" do
      subject.lock
      expect {subject.add_entry}.to raise_error "Diary is locked"
    end

  end

  describe "#Get entry" do

    it { is_expected.to respond_to(:get_entries)}

    it "Gets entries with blank" do
      subject.unlock
      expect(subject.get_entries).to eq ("")
    end

    it "Unable to get entry if locked" do
      subject.lock
      expect {subject.add_entry}.to raise_error "Diary is locked"
    end

  end

  describe "#Lock" do

    it { is_expected.to respond_to(:lock)}

  end

  describe "#Unlock" do

    it { is_expected.to respond_to(:unlock)}

  end

end
