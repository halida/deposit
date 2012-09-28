require File.expand_path('../../spec_helper', __FILE__)

describe :Deposit do 
  before do 
    @e = DepositableModel.create
  end

  specify do 
    @e.load_deposit(:empty).should == nil

    @e.save_deposit(:array, [1,2,3]) == true
    @e.load_deposit(:array).should == [1,2,3]

    @e.save_deposit(:hash, {a: 12}).should == true
    @e.load_deposit(:hash).should == {a: 12}
  end
end
