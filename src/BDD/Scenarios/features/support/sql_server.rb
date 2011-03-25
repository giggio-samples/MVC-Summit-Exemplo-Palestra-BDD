require 'win32ole'
require 'fileutils'

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

    def execute_all(sqls)
      sqls.each { |sql| @connection.Execute(sql) }
    end


    def close
        @connection.Close
    end

    @@arq_db = File.expand_path('../../../../CompraColetiva/App_Data/DB.sdf', __FILE__) 
    @@arq_db_blank = File.expand_path('../../../../CompraColetiva/App_Data/blank_db.sdf', __FILE__)
    @@schema = File.expand_path('../../../../CompraColetiva/App_Data/schema.sqlce', __FILE__)

    class << self

      def obter_aberto
        connection_string = "Provider=Microsoft.SQLSERVER.CE.OLEDB.4.0;Data Source=#{@@arq_db.gsub('/', '\\')}"
        server = SqlServer.new connection_string
        server.open
        server
      end
      def prerarar_schema
        File.delete @@arq_db if File.file? @@arq_db
        FileUtils.cp @@arq_db_blank, @@arq_db

        content = File.read(@@schema)
        statements = content.split 'GO'
        server = obter_aberto
        statements.each do  |statement|
          next if statement.strip.empty?
          begin
            server.execute statement
          rescue Exception => exception
            warn "exception:\n#{exception}\nStatement:\n#{statement}"
            raise
          end
        end

      end
    end

end
