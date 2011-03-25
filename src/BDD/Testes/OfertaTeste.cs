using CompraColetiva.Models.Entidades;
using NUnit.Framework;
using FluentAssertions;

namespace Testes
{
    public class OfertaTeste : TesteBase
    {
        private Oferta _oferta;

        protected override void Act()
        {
            _oferta = new Oferta("url", "Produto em Oferta", "MInha Empresa", 15, 12.2m, 1);
        }

        [Test]
        public void EntaoASlugEhCorreta()
        {
            _oferta.Slug.Should().Be("minha_empresa_produto_em_oferta");
        }
    }
}
