require_relative "spec_helper"

describe ExtraDoilies::LinkedColumn do
  let(:linked) { ExtraDoilies::LinkedColumn.new(name, options) }

  it "links object" do
    link = linked.value(object,view)
    expect(link).to match(%{<a href="/#{object.name}"})
    expect(link).to match(%r{>#{object.name}<})
  end
end
