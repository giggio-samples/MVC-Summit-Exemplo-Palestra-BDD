using System.Web.Mvc;
using System.Web.Mvc.Html;

namespace CompraColetiva.Html
{
    public static class ActionExtensions
    {
        public static MvcHtmlString ActionLinkComPost<T>(
            this HtmlHelper<T> helper,
            string linkText, string actionName, string controllerName, object routeValues, bool confirma = true)
        {
            var classe = "linkcompost" + (confirma ? " confirma" : "");
            return helper.ActionLink(linkText, actionName, controllerName, routeValues, new { @class = classe });
        }
    }
}