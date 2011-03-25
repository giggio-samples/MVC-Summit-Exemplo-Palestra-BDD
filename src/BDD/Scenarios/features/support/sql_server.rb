require 'win32ole'
class SqlServer
    # This class manages database connection and queries
    attr_accessor :connection, :data, :fields, :database, :data_source

    def initialize
        @connection = nil
        @data = nil
        @data_source = '.\SQLEXPRESS'
        @database = 'CompraColetivaLLL'
    end

    def open
        # Open ADO connection to the SQL Server database
        connection_string =  "Provider=SQLOLEDB.1;Persist Security Info=False;Initial Catalog=#{@database};Integrated Security=SSPI;Data Source=#{@data_source};"
        @connection = WIN32OLE.new('ADODB.Connection')
        @connection.Open(connection_string)
    end

    def query(sql)
        recordset = WIN32OLE.new('ADODB.Recordset')
        recordset.Open(sql, @connection)
        @fields = []
        recordset.Fields.each do |field|
            @fields << field.Name
        end
        begin
            # Move to the first record/row, if any exist
            recordset.MoveFirst
            # Grab all records
            @data = recordset.GetRows
        rescue
            @data = []
        end
        recordset.Close
        # An ADO Recordset's GetRows method returns an array
        # of columns, so we'll use the transpose method to
        # convert it to an array of rows
        @data = @data.transpose
        @data
    end

    def close
        @connection.Close
    end
end
