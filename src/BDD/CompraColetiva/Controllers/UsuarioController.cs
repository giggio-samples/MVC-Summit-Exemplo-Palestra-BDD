using System.Web.Mvc;

namespace CompraColetiva.Controllers
{
    public partial class UsuarioController : Controller
    {
        public virtual ActionResult Ofertas()
        {
            return View();
        }

        public virtual ActionResult UltimasCompras()
        {
            return View();
        }

        public virtual ActionResult Configuracoes()
        {
            return View();
        }

    }
}
