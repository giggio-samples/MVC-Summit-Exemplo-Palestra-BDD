require_relative "spec_helper"
require_relative "../features/support/Endereco"

describe Endereco do
	it "should match home" do
		Endereco.para('home').should== "/"
	end
	it "should match root" do
		Endereco.para('raiz').should== "/"
	end
	it "should match a single word page" do
		Endereco.para('customer').should== "/customer"
	end
	it "should match a double word page" do
		Endereco.para('customer edit').should== "/customer/edit"
	end

	it "should match an http page" do
		Endereco.para('http://www.bing.com/').should== "http://www.bing.com/"
	end
end