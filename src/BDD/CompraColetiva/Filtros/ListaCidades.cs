using System.Collections.Generic;
using System.Web.Mvc;
using CompraColetiva.Models.Entidades;

namespace CompraColetiva.Filtros
{
    public class ListaCidades : IActionFilter
    {
        public void OnActionExecuting(ActionExecutingContext context)
        {
        }

        public void OnActionExecuted(ActionExecutedContext context)
        {
            if (!(context.Result is ViewResult)) return;
            var viewResult  = (ViewResult)context.Result;
            var viewBag = viewResult.ViewBag;
            var cidades = new List<Cidade>
                              {
                                  new Cidade{ Id = 1, Nome = "Curitiba"},
                                  new Cidade{ Id = 2, Nome = "São Paulo"},
                                  new Cidade{ Id = 3, Nome = "Manaus"},
                              };
            viewBag.Cidades = cidades;
            viewBag.CidadeSelecionada = cidades[1].Id;
        }
    }
}