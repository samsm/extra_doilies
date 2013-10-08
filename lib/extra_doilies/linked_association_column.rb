class ExtraDoilies::LinkedAssociationColumn < TableCloth::Column
  def initialize(name, options ={})
    @association_accessor = options[:association_accessor] || :name
    super(name,options)
  end

  def value(object, view, table=nil)
    view.link_to object.send(name).send(association_accessor), object.send(name)
  end
  private
  attr_reader :association_accessor
end
