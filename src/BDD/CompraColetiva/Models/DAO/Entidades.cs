using System.Data.Entity;
using CompraColetiva.Models.Entidades;

namespace CompraColetiva.Models.DAO
{
    public class Entidades : DbContext
    {
        public Entidades()
            : base("LocalSqlServer")
        {
            
        }
        public DbSet<Oferta> Ofertas { get; set; }
    }
}