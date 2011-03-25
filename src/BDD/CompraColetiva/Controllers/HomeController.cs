using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CompraColetiva.Models.Entidades;

namespace CompraColetiva.Controllers
{
    public partial class HomeController : Controller
    {
        public virtual ActionResult Index()
        {
            var ofertas = new List<Oferta>
                              {
                                  new Oferta{Id = 1, NomeEmpresa = "Sorveteria do Jorge", ProdutoEmOferta = "Sorvete de limão", UrlImagem = "produtos/sorvete.jpg", ValorComDesconto = 5, ValorOriginal = 12},
                                  new Oferta{Id = 1, NomeEmpresa = "Sapataria do Alemão", ProdutoEmOferta = "Sapato de couro", UrlImagem = "produtos/sapato.jpg", ValorComDesconto = 92, ValorOriginal = 150},
                                  new Oferta{Id = 1, NomeEmpresa = "Hardware bom", ProdutoEmOferta = "Mouse ArcTouch", UrlImagem = "produtos/mouse.jpg", ValorComDesconto = 100.10m, ValorOriginal = 65.45m},
                                  new Oferta{Id = 1, NomeEmpresa = "Tailspin", ProdutoEmOferta = "Avião de papel", UrlImagem = "produtos/aviao.jpg", ValorComDesconto = 123.52m, ValorOriginal = 167.44m},
                              };
            ViewBag.Ofertas = ofertas;
            return View();
        }
        public virtual ActionResult About()
        {
            return View();
        }
        public virtual ActionResult Contato()
        {
            return View();
        }
        public virtual ActionResult Termos()
        {
            return View();
        }
        public virtual ActionResult FAQ()
        {
            return View();
        }
        public virtual ActionResult Noticias()
        {
            return View();
        }

    }
}
