class ExtraDoilies::CounterColumn < TableCloth::Column
  def initialize(*args)
    @counter = 0
    super *args
  end

  def value(object, view, table=nil)
    @counter += 1
  end
end
