require File.dirname(__FILE__) + '/spec_helper'

describe Google::Search::Defaults do

  before :all do
    @defaults = Google::Search::Defaults
  end

  before :each do
    @defaults.clear
  end

  it "should not contain any option after being cleared" do
    @defaults.to_hash.count.should == 0
  end

  it "should store an option properly" do
    @defaults.set :foo, "foo value"
    @defaults.get(:foo).should == "foo value"
  end

  it "should delete an option properly" do
    @defaults.set :proxy, "proxy.uniovi.es:8888"
    @defaults.delete(:proxy).should == "proxy.uniovi.es:8888"
    @defaults.to_hash.count == 0
  end

  it "should update options properly" do
    @defaults.set :foo, "foo value"
    @defaults.update :foo => "new foo value", :bar => "bar value"
    @defaults.get(:foo).should == "new foo value"
    @defaults.get(:bar).should == "bar value"
    @defaults.to_hash.count.should == 2
  end

  it "calls a setter via method missing" do
    @defaults.foo = "foo value"
    @defaults.get(:foo).should == "foo value"
  end

  it "calls a getter via method missing" do
    @defaults.bar = "bar value"
    @defaults.bar.should == "bar value"
  end

  it "should return nil for an undefined option" do
    @defaults.get(:undefined).should be_nil
  end

end
