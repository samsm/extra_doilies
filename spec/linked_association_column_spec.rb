require_relative "spec_helper"

describe ExtraDoilies::LinkedAssociationColumn do
  let(:linked) { ExtraDoilies::LinkedAssociationColumn.new(:association, options) }
  let(:with_association) { Struct.new(:association).new(object) }

  it "links object" do
    link = linked.value(with_association,view)
    expect(link).to match(%{<a href="/#{object.name}"})
    expect(link).to match(%r{>#{object.name}<})
  end

  context "with a non-default accessor" do
    let(:options) { { association_accessor: :custom } }
    let(:object)  { test_object_class(:custom).new("custom accessor") }
    it "links object" do
      link = linked.value(with_association,view)
      expect(link).to match(%{<a href="/#{object.custom}"})
      expect(link).to match(%r{>#{object.custom}<})
    end
  end
end
