class Diary

  def initialize
    @entry = ""
    @lock = true
  end

  def add_entry(entry = "")
    fail "Diary is locked" if @lock
    @entry = "Hi"
  end

  def get_entries
    fail "Diary is locked" if @lock
    @entry
  end

  def lock
    @lock = true
  end

  def unlock
    @lock = false
  end

end
