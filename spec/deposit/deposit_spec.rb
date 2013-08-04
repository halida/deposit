require File.expand_path('../../spec_helper', __FILE__)

describe :Deposit do
  before do
    @e = DepositableModel.create
  end

  it 'default to nil' do
    @e.load_deposit(:empty).should == nil
  end

  it 'save and load array deposit' do
    @e.save_deposit(:array, [1,2,3]) == true
    @e.load_deposit(:array).should == [1,2,3]
  end

  it 'save and load hash deposit' do
    @e.save_deposit(:hash, {a: 12}).should == true
    @e.load_deposit(:hash).should == {a: 12}
  end

  it 'update deposit' do
    @e.save_deposit(:hash, {a: 12, b: 13}).should == true
    @e.update_deposit(:hash, {b: 10, c: 11}).should == true
    @e.load_deposit(:hash).should == {a: 12, b: 10, c: 11}
  end
end
