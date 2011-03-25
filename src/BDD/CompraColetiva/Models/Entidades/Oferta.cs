using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CompraColetiva.Models.Entidades
{
    public class Oferta
    {
        public string UrlImagem { get; set; }
        public string ProdutoEmOferta { get; set; }
        public string NomeEmpresa { get; set; }
        public decimal ValorOriginal { get; set; }
        public decimal ValorComDesconto { get; set; }
        public int Id { get; set; }
        public decimal PercentualDeDesconto
        {
            get { return Math.Ceiling((1 - ValorComDesconto / ValorOriginal) * 100); }
        }
    }
}