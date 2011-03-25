using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CompraColetiva.Controllers
{
    public partial class UsuarioController : Controller
    {
        public virtual ActionResult Ofertas()
        {
            return View();
        }

        public virtual ActionResult Cidades()
        {
            return View();
        }

        public virtual ActionResult Empresas()
        {
            return View();
        }

        public virtual ActionResult Emails()
        {
            return View();
        }

    }
}
