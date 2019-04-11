require 'secret_diary'

describe Diary do
  subject(:diary) { described_class.new }

  describe '#lock' do
    it 'is expected to respond to lock' do
      expect { diary.lock }.not_to raise_error
    end
  end

  describe '#unlock' do
    it 'is expected to respond to unlock' do
      expect { diary.unlock }.not_to raise_error
    end
  end

  describe '#add_entry' do
    it 'is expected to respond to add_entry' do
      diary.unlock
      expect { diary.add_entry("Hi") }.not_to raise_error
    end

    it 'adds an entry to the diary' do
      diary.unlock
      diary.add_entry('Hi')
      expect { diary.retrieve_entries }.to output("Hi\n").to_stdout
    end

    it 'is unable to add entry if locked' do
      diary.unlock
      diary.lock
      expect { diary.add_entry('Hi') }.to raise_error 'Diary is locked'
    end
  end

  describe '#retrieve_entries' do
    it 'is expected to respond to retrieve_entries' do
      diary.unlock
      expect { diary.retrieve_entries }.not_to raise_error
    end

    it 'retrieves entries with blank if no entries added' do
      diary.unlock
      expect { diary.retrieve_entries }.to output("\n").to_stdout
    end

    it 'unable to retrieve entry if locked' do
      diary.lock
      expect { diary.retrieve_entries }.to raise_error 'Diary is locked'
    end
  end
end
