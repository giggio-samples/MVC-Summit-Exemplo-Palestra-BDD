using System.Linq;
using System.Web.Mvc;
using CompraColetiva.Models.DAO;

namespace CompraColetiva.Controllers
{
    public partial class HomeController : Controller
    {
        public virtual ActionResult Index()
        {
            var ofertas = new Entidades().Ofertas.ToList();
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
