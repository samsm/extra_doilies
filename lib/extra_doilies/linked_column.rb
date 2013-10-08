class ExtraDoilies::LinkedColumn < TableCloth::Column
  def value(object, view, table=nil)
    view.link_to object.send(name), object
  end
end
