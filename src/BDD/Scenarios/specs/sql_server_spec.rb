require "rspec"
require_relative '../features/support/sql_server'
describe SqlServer do

  it "should retrieve rows" do
    server = SqlServer.new
    server.open
    consulta = server.query('Select * from aspnet_Users')
    server.close
    p consulta
    consulta.should_not be nil
    consulta.length.should == 2
    consulta[0].count.should == 7
  end
end