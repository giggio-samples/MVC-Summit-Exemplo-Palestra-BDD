using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CompraColetiva.Models.Entidades
{
    public class Oferta
    {
        protected Oferta() {}

        public Oferta(string urlImagem, string produtoEmOferta, string nomeEmpresa, decimal valorOriginal, decimal valorComDesconto, int id)
        {
            UrlImagem = urlImagem;
            ProdutoEmOferta = produtoEmOferta;
            NomeEmpresa = nomeEmpresa;
            ValorOriginal = valorOriginal;
            ValorComDesconto = valorComDesconto;
            Id = id;
        }

        public string UrlImagem { get; protected set; }
        public string ProdutoEmOferta { get;  protected set; }
        public string NomeEmpresa { get;  protected set; }
        public decimal ValorOriginal { get; protected set; }
        public decimal ValorComDesconto { get; protected set; }
        public int Id { get; protected set; }
        public decimal PercentualDeDesconto
        {
            get { return Math.Ceiling((1 - ValorComDesconto / ValorOriginal) * 100); }
        }
        public string Slug
        {
            get { return string.Format("{0}_{1}", FormataTextoParaSlug(NomeEmpresa), FormataTextoParaSlug(ProdutoEmOferta)); }
        }

        private static string FormataTextoParaSlug(string texto)
        {
            return texto.ToLower().Replace(" ", "_");
        }
    }
}