class Diary
  def initialize
    @entry = ""
    @lock = true
  end

  def add_entry(entry)
    fail "Diary is locked" if @lock

    add_to_diary(entry)
  end

  def retrieve_entries
    fail "Diary is locked" if @lock

    puts @entry
  end

  def lock
    @lock = true
  end

  def unlock
    @lock = false
  end

  private

  def add_to_diary(entry)
    @entry += entry
    @entry += "\n"
  end
end
