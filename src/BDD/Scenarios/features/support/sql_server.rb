require 'win32ole'
class SqlServer
    # This class manages database connection and queries
    attr_accessor :connection, :data, :fields, :database, :data_source, :connection_string

    def initialize connection_string
        @connection = nil
        @data = nil
        @connection_string = connection_string
    end

    def open
        # Open ADO connection to the SQL Server database
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

    def execute(sql)
        @connection.Execute(sql)
    end

    def close
        @connection.Close
    end
    def self.obter_aberto
      arq_db = File.expand_path('../../../../CompraColetiva/App_Data/DB.sdf', __FILE__).gsub('/', '\\')
      connection_string = "Provider=Microsoft.SQLSERVER.CE.OLEDB.4.0;Data Source=#{arq_db}"
      server = SqlServer.new connection_string
      server.open
      server
    end
end
